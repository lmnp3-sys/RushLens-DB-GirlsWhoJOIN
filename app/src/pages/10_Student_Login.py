
import streamlit as st
import requests
from modules.nav import SideBarLinks

API_BASE = "http://localhost:4000"
SideBarLinks()

st.title("Student Login")
st.write("Welcome! Log in with your Customer ID or create a new profile.")

if "customer_id" not in st.session_state:
    st.session_state["customer_id"] = None

st.subheader("Log In")

with st.form("login_form"):
    login_id = st.number_input("Enter your Customer ID:", min_value=1)
    submitted = st.form_submit_button("Log In")

    if submitted:
        try:
            resp = requests.get(f"{API_BASE}/customers/{login_id}")
            if resp.status_code == 200:
                st.session_state["customer_id"] = login_id
                st.success("Login successful")
                st.switch_page("pages/11_Student_Profile.py")
            else:
                st.error("Customer not found")
        except Exception as e:
            st.error(f"Connection error: {e}")


st.subheader("Create New Customer")

with st.form("create_customer_form"):
    new_id = st.number_input("Customer ID", min_value=1)
    first = st.text_input("First Name")
    last = st.text_input("Last Name")
    neu = st.text_input("NEU ID")
    store = st.number_input("Preferred Store ID", min_value=1)

    create_submit = st.form_submit_button("Create Profile")

    if create_submit:
        payload = {
            "customer_id": new_id,
            "firstName": first,
            "lastName": last,
            "neuID": neu,
            "store_id": store
        }

        try:
            resp = requests.post(f"{API_BASE}/customers", json=payload)
            if resp.status_code == 201:
                st.success("Customer created successfully")
            else:
                st.error(resp.json())
        except Exception as e:
            st.error(f"Error: {e}")
