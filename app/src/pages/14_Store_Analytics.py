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

traffic_id = store_id  # ← supply an actual ID or retrieve it dynamically

df = None

try:
    if not traffic_id:
        st.warning("Invalid Store ID.")
    else:
        resp = requests.get(f"{API_BASE}/{traffic_id}")
        data = resp.json()
    if not data:
        st.warning("No foot traffic stats are available.")
        st.stop()
    else:
        df = pd.DataFrame(data)
        st.success("Here's your data!")
except:
    st.error("Error connecting to API.")

if st.button("Return to Store Homepage!"):
    st.switch_page("pages/13_Store_Owner_Home.py")