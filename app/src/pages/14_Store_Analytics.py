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

traffic_id = 3  # ← supply an actual ID or retrieve it dynamically

store_data = None
try:
    resp = requests.get(f"{API_BASE}/{traffic_id}")
    if resp.status_code != 200:
        st.error(f"Error fetching your foot traffic stats: {resp.status_code}")
        st.stop()

    data = resp.json()
    if not data:
        st.warning("No foot traffic stats are available.")
        st.stop()

    df = pd.DataFrame(data)
        try:
                response = requests.put(f"{API_BASE}/{traffic_id}", json=payload)
                if response.status_code == 200:
                    st.success(f"View your stats!")
                else:
                    st.error("Could not load foot traffic stats.")
            except:
                st.error("Error connecting to API.")

if st.button("Return to Store Homepage!"):
    st.switch_page("pages/13_Store_Owner_Home.py")