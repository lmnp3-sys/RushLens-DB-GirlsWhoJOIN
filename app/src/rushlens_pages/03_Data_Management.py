import streamlit as st
import requests
import pandas as pd

st.title('Data Quality & Store Management')

API_BASE = 'http://localhost:8339/rushlens'

tab1, tab2, tab3 = st.tabs(['Data Quality Checks', 
                            'Add New Store',
                            'Update Store Configuration'])


# TAB 1: Data Quality
with tab1:
    st.header('Data Quality Check Results')

    try:
        response = requests.get(f'{API_BASE}/data-quality-check')
        if response.status_code == 200:
            checks = response.json()

            if checks:
                df = pd.DataFrame(checks)

                # show failed and passed
                col1, col2 = st.column(2)
                with col1:
                    passed = len(df[df['status'] == 'passed'])
                    st.metric('Passed Checks', passed)

                with col2:
                    failed = len(df[df['status'] == 'failed'])
                    st.metric('Failed Checks', failed)

                st.dataframe(df, use_containter_width=True)


                # Option to flag bad data
                st.subheader('Flag Problematic Data')
                check_id = st.number_input('Check ID to review:', min_value=1)
                if st.button('Flag as Issue'):
                    # API call to flag data
                    st.success(f'Flagged check {check_id} for review')

    except Exception as e:
        st.error(f'Error: {e}')

# TAB 2: Add New Store
with tab2:
    st.header('Add New Store to Rushlens')

    with st.form('new_store'):
        store_name = st.text_input('Store Name')
        store_type = st.selectbox('Store Type', ['Fast-Food', 'Retail', 'Service'])
        capacity = st.number_input('Capacity', min_value=1, value=50)
        location_id = st.number_input('Location ID', min_value=1)




