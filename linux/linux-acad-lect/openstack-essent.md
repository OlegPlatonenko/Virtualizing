# OpenStack Essentials

## Keystone

- Identity service in OpenStack
- Supports token-based authorization and user-service authorization
- Provides authentication not only to users but also to OpenStack services

Pluggable backend architecture helps Keystone to integrate with heterogeneous environments such as:
- **Pluggable authentication Module** - uses local system's PAM service to authenticate
- **LDAP** - connects via LDAP to Ad to authenticate users and obtain role information
- **Key Value Service (KVS)** - in-memory
- **memcached** - Distributed memory caching system
- **SQL** - Sqlite, MySQL, MariaDB 

Keystone tracks which OpenStack services are installed and where to locate them on the network 
