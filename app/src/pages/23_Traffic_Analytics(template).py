import streamlit as st
import requests
import pandas as pd
import plotly.express as px

st.title('🚦 Traffic Analytics Dashboard')

# API endpoint - based on your traffic_input_routes.py
API_URL = "http://host.docker.internal:4000/rushlens/traffic"   #have to change this

try:
    # Fetch data from API
    response = requests.get(API_URL)
    
    if response.status_code == 200:
        data = response.json()
        
        # Convert to DataFrame
        df = pd.DataFrame(data)
        
        # Display metrics
        col1, col2, col3 = st.columns(3)
        with col1:
            st.metric("Total Visitors Today", "1,247")
        with col2:
            st.metric("Peak Hour", "2:00 PM")
        with col3:
            st.metric("Avg Occupancy", "68%")
        
        st.subheader("Traffic Over Time")
        
        # Simple line chart
        if 'timestamp' in df.columns and 'visitors' in df.columns:
            fig = px.line(df, x='timestamp', y='visitors', 
                         title='Visitor Traffic')
            st.plotly_chart(fig)
        else:
            st.info("Chart will display when API returns timestamp and visitors data")
        
        # Show raw data
        with st.expander("View Raw Data"):
            st.dataframe(df)
            
    else:
        st.error(f"API returned status code: {response.status_code}")
        
except requests.exceptions.ConnectionError:
    st.error("⚠️ Cannot connect to API. Make sure your server is running!")
    st.code(f"Expected API at: {API_URL}")
    
except Exception as e:
    st.error(f"Error: {str(e)}")
    st.info("Using sample data instead...")
    
    # Sample data fallback
    sample_data = {
        'hour': ['9 AM', '10 AM', '11 AM', '12 PM', '1 PM', '2 PM', '3 PM'],
        'visitors': [150, 230, 280, 320, 350, 380, 290]
    }
    df_sample = pd.DataFrame(sample_data)
    fig = px.bar(df_sample, x='hour', y='visitors', title='Sample Visitor Traffic')
    st.plotly_chart(fig)