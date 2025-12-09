import streamlit as st
import requests
from modules.nav import SideBarLinks
import pandas as pd

st.set_page_config(layout='wide')

SideBarLinks()

st.title("My Analytics")
API_BASE = "http://web-api:4000"

st.subheader("Store ID")
store_id = st.number_input("Store ID *", min_value=1, value=1)

if st.button("Load Store Analytics"):
    try:
        resp = requests.get(f"{API_BASE}/rushlens/store/{store_id}")
        
        if resp.status_code == 200:
            store_data = resp.json()
            
            st.success(f"Loaded: {store_data.get('store_name', 'Unknown')}")
            
            col1, col2 = st.columns(2)
            with col1:
                st.metric("Total Visits", store_data.get('total_visits', 'N/A'))
            with col2:
                st.metric("Avg Wait (min)", store_data.get('avg_wait_min', 'N/A'))
        else:
            st.error(f"Store {store_id} not found")
    except Exception as e:
        st.error(f"Error: {e}")

if st.button("Return to Store Homepage"):
    st.switch_page("pages/13_Store_Owner_Home.py")