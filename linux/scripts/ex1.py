#!/usr/bin/env python3.6

user0 = dict(admin=True, active=True, name='Oleg')
user1 = dict(admin=False, active=True, name='Sasha')
user2 = dict(admin=True, active=False, name='Yarik')

users = [user0, user1, user2]
i = 1
for user in users:
    if user['admin'] and user['active']:
        print(f"{i} ACTIVE - (ADMIN): {user['name']}")
        i = i + 1
    elif user['admin'] == True:
        print(f"{i} ADMIN: {user['name']}")
        i = i + 1
    elif user['active'] == True:
        print(f"{i} ACTIVE: {user['name']}")
        i = i + 1
    else:
        print(f"{i} {user[name]}")
        i = i + 1