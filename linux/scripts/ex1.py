#!/usr/bin/env python3.6

user = dict(admin=True, active=False, name='Oleg')
if user['admin'] and user['active']:
    print(f"ACTIVE - (ADMIN) {user['name']}")
elif user['admin'] == True:
    print(f"ADMIN: {user['name']}")
elif user['active'] == True:
    print(f"ACTIVE - {user['name']}")
else:
    print(f"{user[name]}")