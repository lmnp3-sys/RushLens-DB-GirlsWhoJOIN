import streamlit as st
import requests
import pandas as pd
import plotly.express as px

st.title('Community Foot Traffic Trends')

API_BASE = "http://localhost:4000"

data = [
    {"hour": 8, "avg_visitors": 12, "total_customers": 12, "avg_wait_min": 5, "store_name": "Store A"},
    {"hour": 9, "avg_visitors": 20, "total_customers": 20, "avg_wait_min": 7, "store_name": "Store B"},
    {"hour": 10, "avg_visitors": 18, "total_customers": 18, "avg_wait_min": 6, "store_name": "Store C"},
    {"hour": 11, "avg_visitors": 25, "total_customers": 25, "avg_wait_min": 10, "store_name": "Store D"},
]

df = pd.DataFrame(data)


try:
    response = requests.get(API_BASE)
    if response.status_code == 200:
        df = pd.DataFrame(response.json())
except:
    pass

    st.metric("Total Customers", data['total_customers'].sum() if 'total_customers' in data.columns else "N/A")
    st.metric("Average Waiting Minutes", round(data['avg_wait_min'].mean(), 1) if 'avg_wait_min' in data.columns else "N/A")
        
    if 'hour' in data.columns and 'avg_visitors' in data.columns:
        fig = px.line(data, x='hour', y='avg_visitors', title="Traffic This Week")
        st.plotly_chart(fig)
   
        st.subheader("Raw Data")
        st.dataframe(data)
    else:
        st.warning("No data available from the API.")

if st.button("Return to Store Homepage?"):
    st.switch_page("pages/13_Store_Owner_Home.py")