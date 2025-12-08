
import logging
logger = logging.getLogger(__name__)
import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')

SideBarLinks()


logger.info("Loading Store home page")

st.title(f"Welcome, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('How is your store doing?')

if st.button('View Store Foot Traffic Statistics Dashboard',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/14_Store_Analytics.py')

if st.button('Update Store page',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/15_Store_Update_Page.py')

if st.button('View Rushlens Store Homepage Analytics',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/16_Store_Page_Traffic.py')