# John feature page: Check data quality and management
##################################################

import streamlit as st
import requests
import pandas as pd
from modules.nav import SideBarLinks

SideBarLinks()

st.title('📊Data Quality & Store Management')

# API_BASE = 'http://host.docker.internal:4000/rushlens'
API_BASE = 'http://localhost:4000'


tab1, tab2, tab3 = st.tabs(['Data Quality Checks', 
                            'Add New Store',
                            'Update Store Configuration'])


# TAB 1: Data Quality
with tab1:
    st.header('Data Quality Check Results')

    try:
        response = requests.get(f'{API_BASE}/rushlens/data-quality-checks')
        if response.status_code == 200:
            checks = response.json()

            if checks:
                df = pd.DataFrame(checks)

                # show failed and passed
                col1, col2 = st.columns(2)
                with col1:
                    passed = len(df[df['status'] == 'passed'])
                    st.metric('Passed Checks', passed)

                with col2:
                    failed = len(df[df['status'] == 'failed'])
                    st.metric('Failed Checks', failed)

                # display the df
                st.dataframe(df, use_container_width=True)


                # Option to flag bad data
                st.subheader('Flag Problematic Data')
                check_id = st.number_input('Check ID to review:', min_value=1)
                if st.button('Flag as Issue'):
                    # API call to flag data
                    st.success(f'Flagged check {check_id} for review')
            else:
                st.warning('No data quality checks returned from API.')
        else:
            st.error(f'Failed to fetch data quality checks: {response.status_code}')
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

        submitted = st.form_submit_button('Add Store')

        if submitted:
            data = {
                'store_name': store_name,
                'store_type': store_type,
                'capacity': capacity,
                'location_id': location_id
            }

            response = requests.post(f'{API_BASE}/rushlens/store', json=data)

            if response.status_code == 200:
                st.success(f'Successfully added {store_name}!')
            else:
                st.error(f'Failed to add store: {response.text}')


# TAB 3: Update Store Configuration
with tab3:
    st.header('Update Store Configuration')

    # Get all stores
    try:
        response = requests.get(f'{API_BASE}/rushlens/store')
        if response.status_code == 200:
            stores = response.json()

            # if API returns a string, parse it
            if isinstance(stores, str):
                import json
                stores = json.loads(stores)

            # ensure stores is a list of dicts
            if isinstance(stores, list) and stores:
                # build a dic of store_name -> store_id
                store_names = {s['store_name']: s['store_id'] for s in stores}

                # Select store dropdown
                selected_store = st.selectbox("Select Store:", options=list(store_names.keys()))
                store_id = store_names[selected_store]

                # Get the selected store data
                selected_store_data = next(s for s in stores if s['store_name'] == selected_store)
                current_capacity = selected_store_data.get("capacity", 50)

                # Update form
                with st.form('update_store'):
                    new_name = st.text_input('New Store Name', value=selected_store)
                    new_capactity = st.number_input('New Capacity', min_value=1, value=current_capacity)

                    updated = st.form_submit_button("Update Store")

                    if updated:
                        data = {
                            'store_name': new_name,
                            'capacity': new_capactity
                        }

                        response = requests.put(f'{API_BASE}/rushlens/store/{store_id}', json=data)

                        if response.status_code == 200:
                            st.success(f'Updated {selected_store} successfully!')
                        else:
                            st.error(f'Failed to update {selected_store}: {response.text}')

            else:
                st.warning('No stores found from the API.')
        
        else:
            st.error(f'Failed to fetch stores: {response.status_code}')

    except Exception as e:
        st.error(f'Error: {e}')

