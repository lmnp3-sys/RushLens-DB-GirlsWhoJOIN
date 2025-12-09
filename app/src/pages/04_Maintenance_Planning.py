# John feature page: maintenance essentials
##################################################

import streamlit as st
import requests
import pandas as pd
from modules.nav import SideBarLinks

SideBarLinks()

st.title('⛑️Maintenance Planning')

API_BASE = 'http://host.docker.internal:4000/rushlens'

# VIEW maintenance history

try:
    response = requests.get(f'{API_BASE}/maintenance-log')
    if response.status_code == 200:
        logs = response.json()

        if logs:
            df = pd.DataFrame(logs)

            # Filter by action type
            action_filter = st.multiselect('Filter by action:', 
                                           df['actionType'].unique() 
                                           if 'actionType' in df.columns 
                                           else [])
            
            if action_filter:
                df = df[df['actionType'].isin(action_filter)]

            st.dataframe(df, use_container_width=True)

            # Summary of stats
            st.subheader('Maintenance Summary')
            col1, col2 = st.columns(2)
            with col1:
                st.metric('Total Maintenance Records', len(logs))
            with col2:
                if 'actionType' in df.columns:
                    most_common_type = df['actionType'].mode()[0]
                    st.metric('Most Common Action', most_common_type)
        
        else:
            st.info('No maintenance record yet')

except Exception as e:
    st.error(f'Error: {e}')


# SCHEDULE new maintenance
st.header('Schedule Maintenance')

with st.form('schedule_maintenance'):
    sensor_id = st.number_input('Sensor ID', min_value=1)
    performed_by = st.text_input('Performed By')
    action_type = st.selectbox('Action Type', ['Repair', 'Calibration', 
                                               'Replacement', 'Diagnostic Test'])
    notes = st.text_area('Notes')
    scheduled = st.form_submit_button('Schedule Maintenance')

    if scheduled:
        st.success(f'New maintanance has been scheduled for Sensor {sensor_id}')
