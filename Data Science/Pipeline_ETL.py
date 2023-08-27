#Libs
import pandas as pd
import requests
import json

#Functions
def get_user(id):
    response = requests.get(f'{swd2023_api_url}/users/{id}')
    return response.json() if response.status_code == 200 else None

swd2023_api_url = 'https://sdw-2023-prd.up.railway.app'

df = pd.read_csv('SANTANDERDEVWEEK.csv')
user_ids = df['UserID'].tolist()
print(user_ids)

users = [user for id in user_ids if ( user := get_user(id) ) is not None] #If None it will ignore
print(json.dumps(users, indent=2))
