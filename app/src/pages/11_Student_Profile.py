import streamlit as st
import requests
import pandas as pd
from modules.nav import SideBarLinks

API_BASE = "http://localhost:4000"
SideBarLinks()

st.title("Student Profile")

# Must be logged in
if "customer_id" not in st.session_state or st.session_state["customer_id"] is None:
    st.warning("Please log in first.")
    st.stop()

customer_id = st.session_state["customer_id"]

try:
    resp = requests.get(f"{API_BASE}/customers/{customer_id}")
    if resp.status_code != 200:
        st.error("Profile not found")
        st.stop()

    data = resp.json()

except Exception as e:
    st.error(f"Error: {e}")
    st.stop()

st.subheader("Your Info")
st.json(data)

st.subheader("Update Your Profile")

with st.form("update_form"):
    first = st.text_input("First Name", data["firstName"])
    last = st.text_input("Last Name", data["lastName"])
    neu = st.text_input("NEU ID", data["neuID"])
    store = st.number_input("Preferred Store ID", min_value=1, value=data["store_id"])

    submitted = st.form_submit_button("Save Changes")

    if submitted:
        payload = {
            "firstName": first,
            "lastName": last,
            "neuID": neu,
            "store_id": store
        }

        try:
            put = requests.put(f"{API_BASE}/customers/{customer_id}", json=payload)
            if put.status_code == 200:
                st.success("Profile updated successfully")
                st.switch_page("pages/11_Student_Profile.py")
            else:
                st.error(put.json())
        except Exception as e:
            st.error(f"Error: {e}")

if st.button("Go to Home Page"):
    st.switch_page("pages/09_Student_Home.py")
