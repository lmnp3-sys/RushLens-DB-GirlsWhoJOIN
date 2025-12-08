# John's Persona Home Page — Senior Systems Coordinator
##################################################

import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks


# use wide layout
st.set_page_config(layout='wide')

# show appropriate sidebar links for the role of currently logged in user
SideBarLinks()

# John's page
logger.info('Loading Senior Systems Coordinator home page')

st.title(f'Welcome Senior Systems Coordinator, {st.session_state["first_name"]}.')
st.write('')
st.write('')
st.write('### What would you like to do today?')


# Buttons links to John's feature pages
if st.button('Manage System Alerts & Monitoring', type='primary',
             use_container_width=True):
    st.switch_page('pages/02_System_Alerts.py')

if st.button('Data Quality & Store Configuration', type='primary',
             use_container_width=True):
    st.switch_page('pages/03_Data_Management.py')

if st.button('Maintenance Planning & Scheduling', type='primary',
             use_container_width=True):
    st.switch_page('pages/04_Maintenance_Planning.py')