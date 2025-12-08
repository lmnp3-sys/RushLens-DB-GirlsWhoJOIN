import streamlit as st
import requests
import pandas as pd
import plotly.express as px

st.title('Community Foot Traffic Trends')

API_BASE = "http://localhost:4000"

try:
    response = requests.get(API_BASE)
    
    if response.status_code == 200:
        data = response.json()
        
        df = pd.DataFrame(data)
        
        col1, col2 = st.columns(3)
        with col1:
            st.metric("Total Customers", "182")
        with col2:
            st.metric("Average Waiting Mintes", "28")
        
        st.subheader("Foot Traffic Trends")
        

        if 'hour' in df.columns and 'avg_visitors' in df.columns:
            fig = px.line(df, x='hour', y='avg_visitors', 
                         title='Traffic This Week')
            st.plotly_chart(fig)
        else:
            st.info("Chart unable to display")
        
        with st.expander("View Raw Data"):
            st.dataframe(df)
            
    else:
        st.error(f"API returned status code: {response.status_code}")
        
except requests.exceptions.ConnectionError:
    st.error("Community data cannot be found.")
    st.code(f"Expected API at: {API_BASE}")