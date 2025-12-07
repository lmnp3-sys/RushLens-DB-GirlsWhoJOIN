# Timmy feature page: Compare store performance
##################################################

import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import pandas as pd
import requests

API_BASE = "http://localhost:8339"

st.set_page_config(layout='wide')
SideBarLinks()

st.title("🏪 Store Comparison")
st.write("A simple overview of stores based on their sensors.")

# Get sensor devices (assuming each has a store_id)
try:
    resp = requests.get(f"{API_BASE}/sensor-device")
    if resp.status_code != 200:
        st.error(f"Error fetching sensors: {resp.status_code}")
        st.stop()
    data = resp.json()
    if not data:
        st.warning("No sensors found.")
        st.stop()
    df = pd.DataFrame(data)
except Exception as e:
    st.error(f"Could not load sensor devices: {e}")
    st.stop()

st.write("### All Sensors")
st.dataframe(df, use_container_width=True)

if "store_id" in df.columns:
    st.write("### Sensors per Store")
    sensors_per_store = df.groupby("store_id")["sensor_id"].count().reset_index(name="sensor_count")
    st.bar_chart(sensors_per_store.set_index("store_id"))