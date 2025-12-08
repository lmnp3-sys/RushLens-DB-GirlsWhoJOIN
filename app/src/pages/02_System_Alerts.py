# John feature page: Track alerts
##################################################

import streamlit as st
import requests
import pandas as pd

st.title('System Alerts & Monitoring')

API_BASE = 'http://host.docker.internal:4000/rushlens'

# Display active alerts
st.header('Active System Alerts')

try:
    response = requests.get(f'{API_BASE}/system-alerts')
    if response.status_code == 200:
        alerts = response.json()

        if alerts:
            df = pd.DataFrame(alerts)

            # Filter by severity values from actual data
            severity_options = ['All'] + sorted(df['severity'].unique().tolist())
            severity = st.selectbox('Filter by severity:', severity_options)

            if severity != 'All': # only filter is not All
                df = df[df['severity'] == severity]


            st.dataframe(df, use_container_width=True)

            # show unresolved count
            unresolved = len(df[df['resolved'] == False])
            if unresolved > 0:
                st.error(f'{unresolved} unresolved alerts')

        else:
            st.success(f'No active alerts - system running smoothly!')

except Exception as e:
    st.error(f'Error loading alerts: {e}')


# Sensor status overview
st.header('Sensor Status Overview')

try:
    response = requests.get(f'{API_BASE}/sensor-device')
    if response.status_code == 200:
        sensors = response.json()

        if sensors:
            df = pd.DataFrame(sensors)

            # show active and inactive statuses
            col1, col2 = st.columns(2)
            with col1:
                active = len(df[df['status'] == True])
                st.metric('Active Sensors', active)
            with col2:
                inactive = len(df[df['status'] == False])
                st.metric('Inactive Sensors', inactive)
            
            st.dataframe(df, use_container_width=True)

except Exception as e:
    st.error(f'Error loading sensors: {e}')