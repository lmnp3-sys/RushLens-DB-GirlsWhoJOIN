# Anne's Persona Home Page — Undergrad Student

import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')

SideBarLinks()

# Content of Anne's page
st.title(f"Welcome Student, {st.session_state.get('first_name')}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Student Login',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/10_Student_Login.py')

if st.button('Update Your Profile',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/11_Student_Profile.py')

if st.button('Explore Historical Traffic Trends',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/12_HistoricalTrends.py')
