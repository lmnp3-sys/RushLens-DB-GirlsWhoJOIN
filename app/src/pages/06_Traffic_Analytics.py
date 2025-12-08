#Timmy feature page: View traffic analytics
##################################################

import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import pandas as pd
import requests

# 
API_BASE = "http://host.docker.internal:4000/rushlens"

st.set_page_config(layout='wide')
SideBarLinks()

st.title("📊Traffic Analytics Dashboard")
st.write("See basic trends from sensor data.")

# --- Call your Flask backend to get sensor data ---
try:
    resp = requests.get(f"{API_BASE}/sensor-data")
    if resp.status_code != 200:
        st.error(f"Error fetching sensor data: {resp.status_code}")
        st.stop()

    data = resp.json()
    if not data:
        st.warning("No sensor data available.")
        st.stop()

    df = pd.DataFrame(data)

except Exception as e:
    st.error(f"Could not load sensor data: {e}")
    st.stop()

# --- Very simple cleaning: make sure timestamps are datetime ---
if "timeStamp" in df.columns:
    df["timeStamp"] = pd.to_datetime(df["timeStamp"])

st.write("### Raw Sensor Data")
st.dataframe(df, use_container_width=True)

# --- Simple metrics (keep it super basic) ---
col1, col2, col3 = st.columns(3)

col1.metric("Total Readings", len(df))

if "sensor_id" in df.columns:
    col2.metric("Unique Sensors", df["sensor_id"].nunique())

if "value" in df.columns:
    # if value is numeric-like
    try:
        df["value_num"] = pd.to_numeric(df["value"])
        col3.metric("Average Value", round(df["value_num"].mean(), 2))
    except Exception:
        col3.write("Average Value: N/A")

# --- Simple line chart over time (if possible) ---
if "timeStamp" in df.columns and "value" in df.columns:
    try:
        df["value_num"] = pd.to_numeric(df["value"])
        df_chart = df.sort_values("timeStamp").set_index("timeStamp")
        st.write("### Sensor Values Over Time")
        st.line_chart(df_chart["value_num"])
    except Exception:
        st.info("Could not plot value over time (non-numeric values).")