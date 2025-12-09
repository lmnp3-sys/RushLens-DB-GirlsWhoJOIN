import streamlit as st
import requests
import pandas as pd
import plotly.express as px
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')

SideBarLinks()


st.title('Community Foot Traffic Trends')

API_BASE = "http://web-api:4000"

#sample data in case api unretrivable
data = [
    {"hour": 8, "total_customers": 12, "avg_wait_min": 5, "store_name": "Store A"},
    {"hour": 9, "total_customers": 20, "avg_wait_min": 7, "store_name": "Store B"},
    {"hour": 10, "total_customers": 18, "avg_wait_min": 6, "store_name": "Store C"},
    {"hour": 11, "total_customers": 25, "avg_wait_min": 10, "store_name": "Store D"},
]

df = pd.DataFrame(data)

try:
    response = requests.get(API_BASE)
    if response.status_code == 200:
        df = pd.DataFrame(response.json())
except:
    #data from data frame columns
    st.metric("Total Customers", df['total_customers'].sum() if 'total_customers' in df.columns else "N/A")
    st.metric("Average Waiting Minutes", round(df['avg_wait_min'].mean(), 1) if 'avg_wait_min' in df.columns else "N/A")        
    
if 'hour' in df.columns and 'total_customers' in df.columns:
    fig = px.line(data, x='hour', y='total_customers', title="Traffic This Week")
    st.plotly_chart(fig)
   
    st.subheader("Raw Data")
    st.dataframe(data)
else:
    st.warning("No data available from the API.")

#returns to store owner page
if st.button("Return to Store Homepage?"):
    st.switch_page("pages/13_Store_Owner_Home.py")