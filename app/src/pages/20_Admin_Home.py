import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title('System Data Analyst Home Page')
st.write('### What would you like to do today?')

# These buttons link to Timmy's feature pages (you will create these files)
if st.button('View Traffic Analytics Dashboard',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/23_Traffic_Analytics.py')

if st.button('Compare Store Performance',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/24_Store_Comparison.py')

if st.button('Monitor System Alerts',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/25_System_Alerts.py')