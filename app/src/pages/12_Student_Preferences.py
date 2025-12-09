import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout="wide")
SideBarLinks()

st.title("🎓 My Study Preferences")
st.write("Tell us how you like to study — no login required!")

# Initialize session state
if "prefs" not in st.session_state:
    st.session_state.prefs = {}

st.subheader("Study Environment 📚 ")
env = st.radio(
    "What environment do you prefer?",
    ["Quiet", "Moderate Noise", "Busy / Social"],
)

st.subheader("Preferred Time of Day ⏰")
time = st.selectbox(
    "When do you like to study?",
    ["Morning", "Afternoon", "Evening", "Late Night"]
)

st.subheader("Preferred Type of Space 🏫")
space = st.selectbox(
    "Where do you usually study?",
    ["Library", "Dining Hall", "Café", "Outdoor Space", "Residence Hall Lounge"]
)

if st.button("Save Preferences"):
    st.session_state.prefs = {
        "Environment": env,
        "Time": time,
        "Space": space,
    }
    st.success("Preferences saved!")

# Show saved results
if st.session_state.prefs:
    st.subheader("⭐ Your Saved Preferences")
    st.json(st.session_state.prefs)

