import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks
import pandas as pd
import requests

API_BASE = "http://localhost:4000"

st.set_page_config(layout='wide')

SideBarLinks()

st.title("My Analytics")
st.write("Weekly Foot Traffic Stats")


try:
    resp = requests.get(f"{API_BASE}/traffic/<int:traffic_id>")
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

if "store_id" in data.columns and "avg_wait_min" in data.columns:
    st.subheader("This week's wait")
    st.bar_chart(
        data.set_index("store_name")["avg_wait_min"]
           except Exception:
        st.info("Could not find average wait times.")
    )