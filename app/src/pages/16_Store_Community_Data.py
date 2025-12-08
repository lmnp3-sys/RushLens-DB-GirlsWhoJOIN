import streamlit as st
import requests
import pandas as pd
import plotly.express as px

st.title('Community Foot Traffic Trends')

API_BASE = "http://localhost:4000"

try:
    response = requests.get(API_BASE)
    data = response.json()

    if data:
        df = pd.DataFrame(data)
        
    st.metric("Total Customers", df['total_customers'].sum() if 'total_customers' in df.columns else "N/A")
    st.metric("Average Waiting Minutes", round(df['avg_wait_min'].mean(), 1) if 'avg_wait_min' in df.columns else "N/A")
        
    if 'hour' in df.columns and 'avg_visitors' in df.columns:
        fig = px.line(df, x='hour', y='avg_visitors', title="Traffic This Week")
        st.plotly_chart(fig)
   
        st.subheader("Raw Data")
        st.dataframe(df)
    else:
        st.warning("No data available from the API.")

except:
    st.error("Could not fetch community data.")