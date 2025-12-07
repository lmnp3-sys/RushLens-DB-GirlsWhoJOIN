import logging
logging.basicConfig(format='%(filename)s:%(lineno)s:%(levelname)s -- %(message)s', level=logging.INFO)
logger = logging.getLogger(__name__)

# import the main streamlit library as well
# as SideBarLinks function from src/modules folder
import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

# If a user is at this page, we assume they are not 
# authenticated.  So we change the 'authenticated' value
# in the streamlit session_state to false. 
st.session_state['authenticated'] = False

SideBarLinks(show_home=True)

st.title("RushLens Analytics ! Mails Home Page")

if st.button ("Go to Timmy (Analytics Scientist)", type="primary", use_container_width=True):

    st.session_state["authenticated"] = True
    st.session_statel ["role"] = "analytics_scientist"
    st.session_statel["first_name"] = "Timmy"
    st.switch_page("pages/10_Analytics_Home-py")