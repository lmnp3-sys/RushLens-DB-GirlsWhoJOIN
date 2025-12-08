import streamlit as st
import requests
from modules.nav import SideBarLinks


SideBarLinks()
st.title("Update Store")
API_BASE = "http://localhost:4000"

st.subheader("Store ID")
store_id = st.number_input("Store ID *", min_value=1)

store_data = None
try:
    r = requests.get(f"{API_URL}/{store_id}")
    if r.status_code == 200:
        store_data = r.json()
except:
    store_data = None

with st.form("update_store_form"):
    st.subheader("Store Information")

    name = st.text_input("Store Name *", value=store_data.get("store_name", "") if store_data else "")
    store_type = st.text_input("Store Type *", value=store_data.get("store_type", "") if store_data else "")
    capacity = st.number_input("Capacity *", min_value=0, value=store_data.get("capacity", 0) if store_data else 0)
    status = st.text_input("Status *", value=store_data.get("status", "") if store_data else "")

    submitted = st.form_submit_button("Update Store")

    if submitted:
        if not all([store_id, name, store_type, status]):
            st.error("Please fill in all required fields marked with *")
        else:
            payload = {
                "store_name": name,
                "store_type": store_type,
                "capacity": int(capacity),
                "status": status
            }

            try:
                response = requests.put(f"{API_URL}/{store_id}", json=payload)
                if response.status_code == 200:
                    st.success(f"Store '{name}' updated successfully!")
                else:
                    st.error("Failed to update store.")
            except:
                st.error("Error connecting to API.")

if st.button("Return to Store Directory"):
    st.switch_page("pages/Store_Directory.py")
