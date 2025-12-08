# Idea borrowed from https://github.com/fsmosca/sample-streamlit-authenticator

# This file has function to add certain functionality to the left side bar of the app

import streamlit as st

# general 

def HomeNav():
    st.sidebar.page_link("Home.py", label="Home", icon="🏠")

def AboutPageNav():
    st.sidebar.page_link("pages/30_About.py", label="About", icon="ℹ️")


# User persona

def StudentHomeNav():
    st.sidebar.page_link("pages/09_Student_Home.py", label="Student Dashboard", icon="🎓")
    st.sidebar.page_link("pages/10_WaitTimes.py", label="Wait Times", icon="⏱️")
    st.sidebar.page_link("pages/11_StudySpaces.py", label="Study Spaces", icon="📚")
    st.sidebar.page_link("pages/12_HistoricalTrends.py", label="Historical Trends", icon="📈")


# Store Owner persona

def StoreOwnerHomeNav():
    st.sidebar.page_link("pages/13_Store_Owner_Home.py", label="Store Owner Dashboard", icon="🏪")
    st.sidebar.page_link("pages/13_Store_Analytics.py", label="Foot Traffic Analytics", icon="🏪")
    st.sidebar.page_link("pages/14_Store_Update_Page.py", label="Update Store Info", icon="✏️")
    st.sidebar.page_link("pages/15_Store_Page_Traffic.py", label="Traffic Reports", icon="🚦")


# Data Analyst Persona

def AnalystHomeNav():
    st.sidebar.page_link("pages/05_Analytics_Home.py", label="Analytics Dashboard", icon="📊")
    st.sidebar.page_link("pages/06_Traffic_Analytics.py", label="Traffic Analytics", icon="📈")
    st.sidebar.page_link("pages/07_Store_Comparison.py", label="Store Comparison", icon="📉")


# System Admin Persona

def AdminHomeNav():
    st.sidebar.page_link("pages/20_Admin_Home.py", label="Admin Dashboard", icon="🖥️")
    st.sidebar.page_link("pages/21_ML_Model_Mgmt.py", label="ML Management", icon="🤖")


# Handling Sidebar

def SideBarLinks(show_home=False):

    # Logo
    st.sidebar.image("assets/logo.png", width=150)

    # if no one is logged in
    # go to landing page
    if "authenticated" not in st.session_state:
        st.session_state["authenticated"] = False
        st.switch_page("Home.py")

    if show_home:
        HomeNav()

    # if logged in
    # load correct persona sidebar
    if st.session_state.get("authenticated"):

        role = st.session_state.get("role")

        if role == "student":
            StudentHomeNav()

        elif role == "store_owner":
            StoreOwnerHomeNav()

        elif role == "analyst":
            AnalystHomeNav()

        elif role == "admin":
            AdminHomeNav()

    # show About!
    AboutPageNav()

    # Logout button
    if st.session_state.get("authenticated"):
        if st.sidebar.button("Logout"):
            for k in ["authenticated", "role", "first_name"]:
                st.session_state.pop(k, None)
            st.switch_page("Home.py")
