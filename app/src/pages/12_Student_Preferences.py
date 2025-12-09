import streamlit as st
import requests
from modules.nav import SideBarLinks

API_BASE = "http://localhost:4000"

st.set_page_config(layout="wide")
SideBarLinks()

st.title("🎓 My Study Preferences")
st.write("Customize your study style — no login required. Preferences are saved locally, and you may also create a RushLens user profile.")

if "prefs" not in st.session_state:
    st.session_state.prefs = {}

st.subheader("Study Environment 📚")
env = st.radio(
    "What environment do you prefer?",
    ["Quiet", "Moderate Noise", "Busy / Social"]
)

st.subheader("Preferred Time of Day ⏰")
time = st.selectbox(
    "When do you like to study?",
    ["Morning", "Afternoon", "Evening", "Late Night"]
)

st.subheader("Preferred Type of Study Space 🏫")
space_type = st.selectbox(
    "Where do you usually study?",
    ["Library", "Dining Hall", "Café", "Outdoor Space", "Residence Hall Lounge"]
)

if st.button("Save Preferences Locally"):
    st.session_state.prefs = {
        "Environment": env,
        "Time": time,
        "Study Space": space_type,
    }
    st.success("Preferences saved locally!")


if st.session_state.prefs:
    st.subheader("⭐ Your Saved Preferences")
    st.json(st.session_state.prefs)

st.markdown("---")
st.header("🆕 Create a RushLens User Profile")

new_user_id = st.number_input("Choose a User ID", min_value=1)
new_user_type = st.selectbox("Select Account Type", ["student", "owner", "manager", "visitor"])

if st.button("Create User Profile"):
    body = {
        "user_id": int(new_user_id),
        "accountType": new_user_type
    }

    try:
        resp = requests.post(f"{API_BASE}/users", json=body)

        if resp.status_code == 201:
            st.success("🎉 User successfully created in the database!")
        elif resp.status_code == 400:
            st.error("User already exists or missing fields.")
        else:
            st.error(f"Unexpected error: {resp.text}")

    except Exception as e:
        st.error(f"Backend connection error: {e}")
