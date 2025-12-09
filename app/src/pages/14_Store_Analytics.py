import streamlit as st
import requests
from modules.nav import SideBarLinks
import pandas as pd

st.set_page_config(layout='wide')

SideBarLinks()

st.title("My Analytics")
API_BASE = "http://localhost:4000"

#headers
st.subheader("Store ID")
store_id = st.number_input("Store ID *", min_value=1)

st.write("Weekly Foot Traffic Stats")

#asks for traffic_id, deafult is 1
traffic_id = 1 

#analytics input
try:
    r = requests.get(f"{API_BASE}/{store_id}")
    if r.status_code == 200:
        store_data = r.json()
    else:
        store_data = None
except Exception as e:
    st.error(f"Error fetching store data: {e}")
    store_data = None

if not store_data:
    st.warning("No data available.")
    st.stop()

df = pd.DataFrame(store_data)

# Check required columns exist and set up bar chart
required_cols = ["store_name", "avg_wait_min"]
if all(col in df.columns for col in required_cols):
    st.subheader("This Week's Average Wait Times")
    try:
        st.bar_chart(df.set_index("store_name")["avg_wait_min"])
    except Exception as e:
        st.error(f"Not enough data for: {e}")

#returns to store owner hoem page
if st.button("Return to Store Directory?"):
    st.switch_page("pages/13_Store_Owner_Home.py")
