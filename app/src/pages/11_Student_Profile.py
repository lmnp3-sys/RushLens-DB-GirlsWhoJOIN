import streamlit as st
import requests
import pandas as pd
from modules.nav import SideBarLinks

API_BASE = "http://web-api:4000"

st.set_page_config(layout="wide")
SideBarLinks()

st.title("👤 Student Profile")
st.write("View or update your student profile — no login required!")


st.subheader("Lookup Existing Profile")

lookup_id = st.number_input("Enter Customer ID:", min_value=1, step=1)

if st.button("Load Profile"):
    try:
        resp = requests.get(f"{API_BASE}/customers/{lookup_id}")
        if resp.status_code == 200:
            st.session_state.profile = resp.json()
            st.success("Profile loaded!")
        else:
            st.error("Profile not found.")
            st.session_state.profile = None
    except Exception as e:
        st.error(f"Backend error: {e}")

# Show loaded profile
if "profile" in st.session_state and st.session_state.profile:
    st.write("### Profile Details")
    st.json(st.session_state.profile)

    st.subheader("Update Profile")

    first = st.text_input("First Name", st.session_state.profile["firstName"])
    last = st.text_input("Last Name", st.session_state.profile["lastName"])
    neuid = st.text_input("NEU ID", st.session_state.profile["neuID"])
    store = st.number_input("Preferred Store ID", min_value=1, step=1,
                             value=st.session_state.profile["store_id"])

    if st.button("Save Updates"):
        payload = {
            "firstName": first,
            "lastName": last,
            "neuID": neuid,
            "store_id": store
        }
        try:
            update = requests.put(f"{API_BASE}/customers/{lookup_id}", json=payload)
            if update.status_code == 200:
                st.success("Profile updated successfully!")
            else:
                st.error(update.text)
        except Exception as e:
            st.error(f"Could not connect to backend: {e}")

    if st.button("Delete Profile"):
        try:
            delete = requests.delete(f"{API_BASE}/customers/{lookup_id}")
            if delete.status_code == 200:
                st.success("Profile deleted!")
                st.session_state.profile = None
            else:
                st.error(delete.text)
        except Exception as e:
            st.error(f"Could not connect to backend: {e}")

st.subheader("Create New Profile")

new_id = st.number_input("New Customer ID:", min_value=1, step=1)
first = st.text_input("First Name")
last = st.text_input("Last Name")
neuid = st.text_input("NEU ID")
store = st.number_input("Preferred Store ID", min_value=1, step=1)

if st.button("Create Profile"):
    payload = {
        "customer_id": new_id,
        "firstName": first,
        "lastName": last,
        "neuID": neuid,
        "store_id": store
    }

    try:
        resp = requests.post(f"{API_BASE}/customers", json=payload)
        if resp.status_code == 201:
            st.success("Profile created successfully!")
        else:
            st.error(f"Error: {resp.text}")
    except Exception as e:
        st.error(f"Could not connect to backend: {e}")
