import streamlit as st
import requests
import pandas as pd
import logging
from modules.nav import SideBarLinks

API_BASE = "http://host.docker.internal:4000/rushlen"
logger = logging.getLogger(__name__)

st.set_page_config(layout="wide")
SideBarLinks()

st.title("Study & Seating Availability")
st.write("Real-time occupancy for Snell and other common study buildings.")

try:
    resp = requests.get(f"{API_BASE}/location/occupancy")
    if resp.status_code != 200:
        st.error("Could not load occupancy data.")
        st.stop()

    df = pd.DataFrame(resp.json())

except Exception as e:
    st.error(f"Error contacting server: {e}")
    st.stop()

if df.empty:
    st.warning("No occupancy data found.")
    st.stop()

if "timeStamp" in df.columns:
    df["timeStamp"] = pd.to_datetime(df["timeStamp"])

st.subheader("Real-Time Occupancy by Location")
st.dataframe(df, use_container_width=True)

if "location_name" in df.columns and "reported_occupancy" in df.columns:
    st.subheader("Occupancy Levels")
    st.bar_chart(df.set_index("location_name")["reported_occupancy"])
