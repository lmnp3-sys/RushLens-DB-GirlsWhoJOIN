import streamlit as st
import requests
from modules.nav import SideBarLinks
import pandas as pd

st.set_page_config(layout='wide')

SideBarLinks()

st.title("My Analytics")
API_BASE = "http://localhost:4000"

st.subheader("Store ID")
store_id = st.number_input("Store ID *", min_value=1)

st.write("Weekly Foot Traffic Stats")

store_data = None
try:
    r = requests.get(f"{API_BASE}/{store_id}")
    if r.status_code == 200:
        store_data = r.json()
except: 
    store_data = None

with st.form("analytics_form"):
    total_visits = st.number_input(
        "Total Visits This Week", 
        value=store_data.get("total_visits", 0) if store_data else 0, 
        min_value=0
    )
    avg_wait = st.number_input(
        "Average Wait Time (minutes)", 
        value=store_data.get("avg_wait_min", 0) if store_data else 0, 
        min_value=0
    )

    submitted = st.form_submit_button("Load Info")
    if submitted:
    if not store_data:
        st.warning("Invalid Store ID.")
    else:
        resp = requests.get(f"{API_BASE}/{traffic_id}")
        data = resp.json()
    if not data:
        st.warning("No foot traffic stats are available.")
        st.stop()
else:
    df = pd.DataFrame(store_data if isinstance(store_data, list) else [store_data])
    st.success("Here's your data!")


if {"store_id", "avg_wait_min", "store_name"}.issubset(df.columns):
    st.subheader("This week's wait times by store")
    try:
        st.bar_chart(df.set_index("store_name")["avg_wait_min"])
    except Exception as e:
        st.info(f"Could not plot average wait times: {e}")

if st.button("Return to Store Homepage!"):
    st.switch_page("pages/13_Store_Owner_Home.py")