
import streamlit as st
import requests
import pandas as pd
import logging
from modules.nav import SideBarLinks

API_BASE = "http://web-api:4000"
logger = logging.getLogger(__name__)

st.set_page_config(layout="wide")
SideBarLinks()

st.title("Historical Traffic & Trend Analysis")
st.write("Explore past patterns to plan your day more efficiently.")

# GET historical data
try:
    resp = requests.get(f"{API_BASE}/rushlens/store/historical")
    if resp.status_code != 200:
        st.error("Historical data unavailable.")
        st.stop()

    df = pd.DataFrame(resp.json())

except Exception as e:
    st.error(f"Failed to load data: {e}")
    st.stop()

if df.empty:
    st.warning("No historical data found.")
    st.stop()

if "date" in df.columns:
    df["date"] = pd.to_datetime(df["date"])

st.subheader("Historical Store Metrics")
st.dataframe(df, use_container_width=True)

if "date" in df.columns and "daily_visitors" in df.columns:
    st.subheader("Daily Visitors Over Time")
    st.line_chart(df.set_index("date")["daily_visitors"])

if "peak_hour" in df.columns:
    st.subheader("Peak Hours Distribution")
    st.bar_chart(df["peak_hour"])
