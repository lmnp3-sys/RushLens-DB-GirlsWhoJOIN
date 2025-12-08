# System Alerts Feature Page
##################################################

import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import pandas as pd
import requests
from datetime import datetime

API_BASE = "http://host.docker.internal:4000/rushlens"

st.set_page_config(layout="wide")
SideBarLinks()

st.title("🚨 System Alerts Dashboard")
st.write("Monitor active warnings, system issues, and sensor problems in real time.")

# Alerts from backend
@st.cache_data(ttl=30)
def fetch_alerts():
    try:
        resp = requests.get(f"{API_BASE}/system-alerts")
        if resp.status_code != 200:
            return f"Error {resp.status_code}", None
        return None, resp.json()
    except Exception as e:
        return str(e), None

# Load alerts
error, alerts = fetch_alerts()

if error:
    st.error(f"Could not fetch system alerts: {error}")
    st.stop()

if not alerts:
    st.info("No system alerts found.")
    st.stop()

df = pd.DataFrame(alerts)

# Convert timestamp
if "timestamp" in df.columns:
    df["timestamp"] = pd.to_datetime(df["timestamp"])

# Sidebar filter
st.sidebar.subheader("Filter Alerts")
levels = df["level"].unique().tolist()
selected_level = st.sidebar.multiselect("Alert Level", levels, default=levels)

if selected_level:
    df = df[df["level"].isin(selected_level)]

# Main table
st.write("### 🔔 All Active Alerts")
st.dataframe(df, use_container_width=True)

# Visual summary
col1, col2 = st.columns(2)

with col1:
    st.write("### Alert Count by Store")
    if "store_id" in df.columns:
        alert_counts = df.groupby("store_id")["alert_id"].count()
        st.bar_chart(alert_counts)

with col2:
    st.write("### Alerts by Severity")
    if "level" in df.columns:
        severity_counts = df["level"].value_counts()
        st.bar_chart(severity_counts)

# Highlight latest alerts
st.write("### 🕒 Most Recent Alerts")
recent_df = df.sort_values(by="timestamp", ascending=False).head(5)
st.table(recent_df)