import streamlit as st
import requests
from modules.nav import SideBarLinks

API_BASE = "http://localhost:4000"

st.set_page_config(layout="wide")
SideBarLinks()

st.title("Student Profile Manager")
st.write("Manage your Curry dining & study profile")

st.header("View Existing Profile")

profile_id = st.number_input("Enter Customer ID to Load Profile:", min_value=1, step=1)

if st.button("Load My Profile"):
    try:
        resp = requests.get(f"{API_BASE}/customers/{profile_id}")
        if resp.status_code == 200:
            st.session_state.profile = resp.json()
            st.success("Profile loaded successfully!")
        else:
            st.error("Profile not found.")
            st.session_state.profile = None
    except Exception as e:
        st.error(f"Backend error: {e}")
        # GET


if "profile" in st.session_state and st.session_state.profile:
    data = st.session_state.profile

    st.subheader("Current Profile Details")
    st.json(data)

    st.subheader("Update Your Profile")

    updated_first = st.text_input("First Name", value=data["firstName"])
    updated_last = st.text_input("Last Name", value=data["lastName"])
    updated_neuid = st.text_input("NEU ID", value=data["neuID"])
    updated_store = st.number_input("Preferred Store ID", min_value=1, step=1,
                                    value=data["store_id"])

    if st.button("Save Changes"):
        payload = {
            "firstName": updated_first,
            "lastName": updated_last,
            "neuID": updated_neuid,
            "store_id": updated_store
        }

        try:
            update = requests.put(
                f"{API_BASE}/customers/{profile_id}", 
                json=payload 
            )
            if update.status_code == 200:
                st.success("Profile updated successfully!")
            else:
                st.error(update.text)
        except Exception as e:
            st.error(f"Backend error: {e}")
            # PUT

    st.subheader("Delete Your Profile")
    if st.button("Delete Profile"):
        try:
            delete_req = requests.delete(
                f"{API_BASE}/customers/{profile_id}"
            )
            if delete_req.status_code == 200:
                st.success("Profile deleted.")
                st.session_state.profile = None
            else:
                st.error(delete_req.text)
        except Exception as e:
            st.error(f"Backend error: {e}")
            # DELETE

st.header("Create a New Student Profile")

new_id = st.number_input("New Customer ID:", min_value=1, step=1)
first = st.text_input("First Name")
last = st.text_input("Last Name")
neuid = st.text_input("NEU ID")
store = st.number_input("Preferred Store ID", min_value=1, step=1)

if st.button("Create New Profile"):
    payload = {
        "customer_id": new_id,
        "firstName": first,
        "lastName": last,
        "neuID": neuid,
        "store_id": store
    }

    try:
        resp = requests.post(
            f"{API_BASE}/customers", 
            json=payload
        )
        # POST
        if resp.status_code == 201:
            st.success("New profile created!")
        else:
            st.error(f"Error: {resp.text}")
    except Exception as e:
        st.error(f"Backend error: {e}")
        # POST