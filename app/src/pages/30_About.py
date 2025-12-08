import streamlit as st
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

SideBarLinks()

st.write("# About this App")

st.markdown(
    """
    RushLens is a smart platform that helps users understand how busy a space is—without 
    having to be there. By combining user-entered data with sensor-generated data, 
    RushLens analyzes patterns to provide high-level insights that guide decision-making. 
    Users can see real-time and predicted occupancy for places like Curry, Starbucks, Snell, 
    or even laundry rooms, helping them plan when to visit.

    """
)

# Add a button to return to home page
if st.button("Return to Home", type="primary"):
    st.switch_page("Home.py")
