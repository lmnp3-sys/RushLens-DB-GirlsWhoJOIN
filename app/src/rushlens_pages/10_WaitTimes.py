
import streamlit as st
import requests
import pandas as pd
import logging
from modules.nav import SidebarLinks

API_BASE = "http://localhost:8339"

logger = logging.getLogger(__name__)

st.set_page_config(layout="wide")
SidebarLinks()

st.title("Curry Dining Wait Times")
st.write("Check the current expected wait times across Curry locations.")

try:
    resp = requests.get(f"{API_BASE}/store/wait-times")
    if resp.status_code != 200:
        st.error("Unable to retrieve wait times.")
        st.stop()

    data = pd.DataFrame(resp.json())

except Exception as e:
    st.error(f"Connection error: {e}")
    st.stop()

if data.empty:
    st.warning("No wait time data available.")
    st.stop()

st.subheader("Current Wait Times")
st.dataframe(data, use_container_width=True)

if "reported_wait_min" in data.columns and "store_name" in data.columns:
    st.subheader("Visual Comparison")
    st.bar_chart(
        data.set_index("store_name")["reported_wait_min"]
    )

