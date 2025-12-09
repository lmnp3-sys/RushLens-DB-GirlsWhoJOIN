# System Alerts Feature Page
##################################################

import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import pandas as pd
import requests
from datetime import datetime

API_BASE = "http://localhost:4000/rushlens"

st.set_page_config(layout="wide")
SideBarLinks()

st.title("🚨 System Alerts Dashboard")
st.write("Monitor active warnings, system issues, and sensor problems in real time.")

# Fetch alerts from backend
@st.cache_data(ttl=30)
def fetch_alerts(resolved_filter=None):
    try:
        url = f"{API_BASE}/system-alerts"
        params = {}
        if resolved_filter is not None:
            params['resolved'] = 'true' if resolved_filter else 'false'
        
        resp = requests.get(url, params=params)
        if resp.status_code != 200:
            try:
                err = resp.json().get("error", f"Error {resp.status_code}")
            except Exception:
                err = f"Error {resp.status_code}"
            return err, None
        return None, resp.json()
    except Exception as e:
        return str(e), None

# Sidebar filters
st.sidebar.subheader("Filter Alerts")

# Show resolved/unresolved filter
status_options = {
    "Active (Unresolved)": False,
    "Resolved": True,
    "All": None
}
selected_status = st.sidebar.radio(
    "Alert Status",
    list(status_options.keys()),
    index=0
)
resolved_filter = status_options[selected_status]

# Load alerts with filter
error, alerts = fetch_alerts(resolved_filter)

if error:
    st.error(f"Could not fetch system alerts: {error}")
    st.stop()

if not alerts:
    st.info("No system alerts found.")
    st.stop()

# Check if alerts is a list
if not isinstance(alerts, list):
    st.error(f"Unexpected data format from API: {type(alerts)}")
    st.json(alerts)
    st.stop()

df = pd.DataFrame(alerts)
df = df.rename(columns={
    "timeStamp": "timestamp",    
    "alertType": "alertType",  
})

# Check if dataframe is empty
if df.empty:
    st.info("No system alerts found.")
    st.stop()

# Convert timestamp - handle various formats
if "timestamp" in df.columns:
    try:
        # Try to convert timestamp, handling None/null values
        df["timestamp"] = pd.to_datetime(df["timestamp"], errors='coerce')
    except Exception as e:
        st.warning(f"Could not parse timestamps: {e}")
        # Keep as string if parsing fails
        pass

# Additional sidebar filters
if "severity" in df.columns:
    levels = df["severity"].unique().tolist()
    selected_level = st.sidebar.multiselect("Alert Severity", levels, default=levels)
    if selected_level:
        df = df[df["severity"].isin(selected_level)]

if "store_id" in df.columns:
    stores = df["store_id"].unique().tolist()
    selected_stores = st.sidebar.multiselect("Store ID", stores, default=stores)
    if selected_stores:
        df = df[df["store_id"].isin(selected_stores)]

# Summary metrics
col1, col2, col3, col4 = st.columns(4)
with col1:
    st.metric("Total Alerts", len(df))
with col2:
    if "resolved" in df.columns:
        unresolved = (df["resolved"] == 0).sum()
        st.metric("Active Alerts", unresolved)
with col3:
   if "severity" in df.columns:
    critical = (df["severity"] == "critical").sum()
    st.metric("Critical", critical)
with col4:
    if "store_id" in df.columns:
        affected_stores = df["store_id"].nunique()
        st.metric("Affected Stores", affected_stores)

# Main table
st.write("### 🔔 Alert Details")

# Format the dataframe for display
display_df = df.copy()
if "resolved" in display_df.columns:
    display_df["resolved"] = display_df["resolved"].map({0: "❌ No", 1: "✅ Yes"})
if "timestamp" in display_df.columns:
    display_df["timestamp"] = display_df["timestamp"].dt.strftime("%Y-%m-%d %H:%M:%S")

st.dataframe(display_df, use_container_width=True)

# Visual summary
col1, col2 = st.columns(2)

with col1:
    st.write("### 📊 Alert Count by Store")
    if "sensor_id" in df.columns:
        alert_counts = df.groupby("sensor_id")["alert_id"].count().sort_values(ascending=False)
        st.bar_chart(alert_counts)

with col2:
    st.write("### ⚠️ Alerts by Severity")
    if "severity" in df.columns:
        severity_counts = df["severity"].value_counts()
        st.bar_chart(severity_counts)

# Highlight latest alerts
st.write("### 🕒 Most Recent Alerts")
if "timestamp" in df.columns:
    recent_df = df.sort_values(by="timestamp", ascending=False).head(5)
    recent_display = recent_df.copy()
    if "resolved" in recent_display.columns:
        recent_display["resolved"] = recent_display["resolved"].map({0: "❌ No", 1: "✅ Yes"})
    if "timestamp" in recent_display.columns:
        recent_display["timestamp"] = recent_display["timestamp"].dt.strftime("%Y-%m-%d %H:%M:%S")
    st.table(recent_display)

# Refresh button
if st.button("🔄 Refresh Data"):
    st.cache_data.clear()
    st.rerun()