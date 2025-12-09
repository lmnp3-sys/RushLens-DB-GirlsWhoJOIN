
import streamlit as st
import requests
from modules.nav import SideBarLinks

API_BASE = "http://web-api:4000"

st.set_page_config(layout="wide")
SideBarLinks()

st.title("Student Login")
st.write("Log in with your Customer ID to view your profile.")

# login form 
st.subheader("Log In")

customer_id = st.number_input("Enter your Customer ID:", min_value=1, step=1)

if st.button("Log In"):
    try:
        url = f"{API_BASE}/rushlens/customers/{customer_id}"
        resp = requests.get(url)

        if resp.status_code == 200:
            data = resp.json()
            st.success("Login successful!")
            st.json(data)

        elif resp.status_code == 404:
            st.error("Customer not found.")

        else:
            st.error(f"Unexpected error: status {resp.status_code}")

    except Exception as e:
        st.error(f"Could not connect to backend: {e}")


st.subheader("Create New Customer")

new_id = st.number_input("New Customer ID:", min_value=1, step=1)
first = st.text_input("First Name")
last = st.text_input("Last Name")
neuid = st.text_input("NEU ID")
store = st.number_input("Preferred Store ID:", min_value=1, step=1)

if st.button("Create Profile"):
    payload = {
        "customer_id": new_id,
        "firstName": first,
        "lastName": last,
        "neuID": neuid,
        "store_id": store
    }

    try:
        resp = requests.post(f"{API_BASE}/rushlens/customers", json=payload)

        if resp.status_code == 201:
            st.success("Profile created successfully!")
        else:
            st.error(f"Error: {resp.text}")

    except Exception as e:
        st.error(f"Could not connect to backend: {e}")
