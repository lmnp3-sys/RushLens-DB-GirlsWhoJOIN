import streamlit as st
import requests
from modules.nav import SideBarLinks
import pandas as pd

st.set_page_config(layout='wide')

SideBarLinks()

st.title("My Analytics")
API_BASE = "http://host.docker.internal:4000"

st.subheader("Store ID")
store_id = st.number_input("Store ID *", min_value=1)

st.write("Weekly Foot Traffic Stats")

traffic_id = 3  # ← supply an actual ID or retrieve it dynamically

try:
    resp = requests.get(f"{API_BASE}/traffic/{traffic_id}")
    if resp.status_code != 200:
        st.error(f"Error fetching your foot traffic stats: {resp.status_code}")
        st.stop()

    data = resp.json()
    if not data:
        st.warning("No foot traffic stats are available.")
        st.stop()

    df = pd.DataFrame(data)

except Exception as e:
    st.error(f"Could not load foot traffic stats: {e}")
    st.stop()

# Use df, not data
if "store_id" in df.columns and "avg_wait_min" in df.columns and "store_name" in df.columns:
    st.subheader("This week's wait")
    try:
        st.bar_chart(df.set_index("store_name")["avg_wait_min"])
    except Exception as e:
        st.info(f"Could not plot average wait times: {e}")

if st.button("Return to Store Homepage!"):
    st.switch_page("pages/13_Store_Owner_Home.py")