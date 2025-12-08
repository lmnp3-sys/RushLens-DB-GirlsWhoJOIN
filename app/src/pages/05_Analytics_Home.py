# Timmy's Persona Home Page — Analytics Scientist
##################################################

import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

# Use wide layout 
st.set_page_config(layout='wide')

# Show appropriate sidebar links for the role of the currently logged-in user
SideBarLinks()

# Content of Timmy page

logger.info("Loading Analytics Scientist home page")

# Use first_name stored in session_state from Home.py
st.title(f"Welcome Analytics Scientist, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

# These buttons link to Timmy's feature pages
if st.button('View Traffic Analytics Dashboard',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/06_Traffic_Analytics.py')

if st.button('Compare Store Performance',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/07_Store_Comparison.py')

if st.button('Monitor System Alerts',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/08_System_Alerts.py')