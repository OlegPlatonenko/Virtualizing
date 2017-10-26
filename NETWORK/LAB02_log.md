# LAB02
-------------------------------------

# CONNECTIONS:
```
- PC01  fa0   -->  SW01  fa0/1  VLAN 2
- PC02  fa0   -->  SW01  fa0/2  VLAN 2
- PC03  fa0   -->  SW02  fa0/1  VLAN 2
- PC04  fa0   -->  SW04  fa0/1  VLAN 2
- SVR01 fa0   -->  SW01  fa0/3  VLAN 3
- SVR02 fa0   -->  SW01  fa0/4  VLAN 3
- SVR03 fa0   -->  SW02  fa0/2  VLAN 3
- SVR04 fa0   -->  SW04  fa0/2  VLAN 3
- MGMT1 fa0   -->  SW01  fa0/24 VLAN 4
- MGMT2 fa0   -->  SW02  fa0/24 VLAN 4
- MGMT3 fa0   -->  PROV  fa0/1  VLAN 5
- SW01  gi0/1 -->  GW01  gi0/1  VLAN 2,3,4
- SW01  gi0/2 -->  SW02  gi0/2  VLAN 2,3,4
- SW02  gi0/2 -->  SW01  gi0/2  VLAN 2,3,4
- SW04  gi0/1 -->  GW02  gi0/1  VLAN 2,3
- GW01  gi0/1 -->  SW01  gi0/1  
- GW01  gi0/0 -->  PROV  gi0/1 
- GW02  gi0/0 -->  PROV  gi0/2 
- GW02  gi0/1 -->  SW04  gi0/1
- PROV  gi0/1 -->  GW01  gi0/0  VLAN 5
- PROV  gi0/2 -->  GW02  gi0/0  VLAN 5
- PROV  fa0/1 -->  MGMT3 fa0    VLAN 5
```

# IP
```
- PC01         IP 10.0.0.2 MASK: 255.255.255.0   GW 10.0.0.1 
- PC02         IP 10.0.0.3 MASK: 255.255.255.0   GW 10.0.0.1 
- PC03         IP 10.0.0.4 MASK: 255.255.255.0   GW 10.0.0.1
- PC04         IP 10.0.5.2 MASK: 255.255.255.0   GW 10.0.5.1
- SVR01        IP 10.0.1.2 MASK: 255.255.255.0   GW 10.0.1.1 
- SVR02        IP 10.0.1.3 MASK: 255.255.255.0   GW 10.0.1.1 
- SVR03        IP 10.0.1.4 MASK: 255.255.255.0   GW 10.0.1.1 
- SVR04        IP 10.0.6.2 MASK: 255.255.255.0   GW 10.0.6.1
- SW01         IP 10.0.2.2 MASK: 255.255.255.0
- SW02         IP 10.0.2.3 MASK: 255.255.255.0
- GW01 gi0/0.5 IP 10.0.3.2 MASK: 255.255.255.248
- GW02 gi0/0.5 IP 10.0.3.3 MASK: 255.255.255.248
- MGMT1        IP 10.0.2.4 MASK: 255.255.255.0   GW 10.0.2.1 
- MGMT2        IP 10.0.2.5 MASK: 255.255.255.0   GW 10.0.2.1
- MGMT3        IP 10.0.3.4 MASK: 255.255.255.248
- PROV         IP 10.0.3.1 MASK: 255.255.255.248 
```

# NETWORKS (SUBNETS)

- 10.0.0.0/24 - PC
- 10.0.1.0/24 - SVR
- 10.0.2.0/24 - MGMT
- 10.0.3.0/29 - N1N2
- 10.0.5.0/24 - PC
- 10.0.6.0/24 - SVR

- NET1 10.0.0.0/22
- NET2 10.0.5.0/23

## VLANS

- 2 - PC
- 3 - SVR
- 4 - MGMT
- 5 - N1N2

## SW01
```
Set SW01 hostname to SW01
Create VLAN 2 name PC and VLAN 3 name SVR and vlan 4 name MGMT

interface vlan 4
Description MGMT
ip 10.0.2.2 mask: 255.255.255.0

interface fa0/1
Description PC01
access
VLAN 2

interface fa0/2
Description PC02
access
VLAN 2

interface fa0/3
Description SVR01
access
VLAN 3

interface fa0/3
Description SVR02
access
VLAN 3

interface fa0/24
Description MGMT
access
VLAN 4

interface gi0/1
Description GW01
trunk
VLAN 2,3,4

interface gi0/2
Description GW01
trunk
VLAN 2,3,4

```

## SW02
```
Set SW02 hostname to SW02
Create VLAN 2 name PC and VLAN 3 name SVR and vlan 4 name MGMT

interface vlan 4
Description MGMT
ip 10.0.2.3 mask: 255.255.255.0

interface gi0/2
Description GW01
trunk
VLAN 2,3,4

interface fa0/1
Description PC03
access
VLAN 2

interface fa0/2
Description SVR03
access
VLAN 3

interface fa0/24
Description MGMT
access
VLAN 4

```

## GW01

- L - local
- C - connected
- S - static
- R- RIP
- M - mobile

```
Set GW01 hostname to GW01
Set time

interface gi0/0.5 
Description N1N2
ip 10.0.3.2 mask: 255.255.255.248

interface gi0/1.2 
Description PC
ip 10.0.0.1 mask: 255.255.255.0

interface gi0/1.3 
Description SVR
ip 10.0.2.1 mask: 255.255.255.0

interface gi0/1.4 
Description MGMT
ip 10.0.3.1 mask: 255.255.255.0

```

## PROV
```
Set PROV name to PROV
Create VLAN 5 name N1N2

interface gi0/1
Description GW01
access
VLAN 5

interface gi0/2
Description GW02
access
VLAN 5

interface fa0/1
Description MGMT3
access
VLAN 5
```

## GW02
```
Set GW02 hostname to GW02
Set time

interface gi0/0.5 
Description N1N2
ip 10.0.3.3 mask: 255.255.255.248

interface gi0/1.2
Description PC
ip 10.0.5.1 mask: 255.255.255.0

interface gi0/1.3
Description SVR
ip 10.0.6.1 mask: 255.255.255.0
```

## SW04
```
Set SW04 hostname to SW04
Create VLAN 2 name PC and VLAN 3 name SVR

interface gi0/1
Description GW02
trunk
VLAN 2,3

interface fa0/1
Description PC04
access
VLAN 2

interface fa0/2
Description SVR04
access
VLAN 3