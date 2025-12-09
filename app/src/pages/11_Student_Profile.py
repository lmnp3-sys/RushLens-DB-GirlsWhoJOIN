import streamlit as st
import requests
import pandas as pd
from modules.nav import SideBarLinks

API_BASE = "http://localhost:4000"

st.set_page_config(layout="wide")
SideBarLinks()

st.title("🏫 User & Store Activity Overview")
st.write(
    "Explore which users are linked to which stores based on the RushLens database. "
    "This page uses GET, POST, PUT, and DELETE routes — no login required."
)

# ---------------------------------------------------------
# LOAD DATA FUNCTIONS
# ---------------------------------------------------------
@st.cache_data
def load_users():
    try:
        resp = requests.get(f"{API_BASE}/users")
        if resp.status_code == 200:
            return pd.DataFrame(resp.json())
        else:
            st.error("Unable to load users.")
            return pd.DataFrame()
    except Exception as e:
        st.error(f"Error loading users: {e}")
        return pd.DataFrame()


@st.cache_data
def load_customers():
    try:
        resp = requests.get(f"{API_BASE}/customers")
        if resp.status_code == 200:
            return pd.DataFrame(resp.json())
        else:
            st.error("Unable to load customers.")
            return pd.DataFrame()
    except Exception as e:
        st.error(f"Error loading customers: {e}")
        return pd.DataFrame()


@st.cache_data
def load_stores():
    try:
        resp = requests.get(f"{API_BASE}/stores")
        if resp.status_code == 200:
            return pd.DataFrame(resp.json())
        else:
            st.error("Unable to load stores.")
            return pd.DataFrame()
    except Exception as e:
        st.error(f"Error loading stores: {e}")
        return pd.DataFrame()

users = load_users()
customers = load_customers()
stores = load_stores()

# ---------------------------------------------------------
# JOIN USERS → CUSTOMERS → STORES
# ---------------------------------------------------------
st.subheader("📌 User → Customer → Store Mapping")

if not users.empty and not customers.empty and not stores.empty:

    # Rename DB columns for readability
    customers = customers.rename(columns={
        "customer_id": "Customer ID",
        "firstName": "First Name",
        "lastName": "Last Name",
        "store_id": "Store ID"
    })

    stores = stores.rename(columns={
        "store_id": "Store ID",
        "store_name": "Store Name",
        "store_type": "Store Type"
    })

    # Merge: User ID == Customer ID
    merged = pd.merge(users, customers, left_on="user_id", right_on="Customer ID", how="left")
    merged = pd.merge(merged, stores, on="Store ID", how="left")

    st.dataframe(merged[[
        "user_id", "accountType", 
        "First Name", "Last Name", 
        "Store ID", "Store Name", "Store Type"
    ]], use_container_width=True)

else:
    st.error("Missing data. Check backend routes.")

# ---------------------------------------------------------
# CREATE USER (POST)
# ---------------------------------------------------------
st.markdown("---")
st.subheader("➕ Create New User")

new_id = st.number_input("User ID", min_value=1)
new_type = st.text_input("Account Type (ex: student, owner, manager)")

if st.button("Create User"):
    body = {"user_id": int(new_id), "accountType": new_type}
    resp = requests.post(f"{API_BASE}/users", json=body)

    if resp.status_code == 201:
        st.success("User created successfully!")
    else:
        st.error(f"Failed to create user: {resp.text}")

# ---------------------------------------------------------
# UPDATE USER (PUT)
# ---------------------------------------------------------
st.markdown("---")
st.subheader("✏️ Update User Account Type")

update_id = st.number_input("User ID to update", min_value=1)
update_type = st.text_input("New Account Type")

if st.button("Update User"):
    body = {"accountType": update_type}
    resp = requests.put(f"{API_BASE}/users/{int(update_id)}", json=body)

    if resp.status_code == 200:
        st.success("User updated successfully!")
    else:
        st.error(f"Failed to update user: {resp.text}")

# ---------------------------------------------------------
# DELETE USER (DELETE)
# ---------------------------------------------------------
st.markdown("---")
st.subheader("🗑 Delete User")

delete_id = st.number_input("User ID to delete", min_value=1, key="delete_user")

if st.button("Delete User"):
    resp = requests.delete(f"{API_BASE}/users/{int(delete_id)}")

    if resp.status_code == 200:
        st.success("User deleted successfully!")
    else:
        st.error(f"Failed to delete user: {resp.text}")
