# CISCO ROUTER COMMANDS

```
? - show help
<command> ? - show command help
<command> <parameter> ? - show parameter help
enable - enable priviledge mode
```

## PRIVILEDGE MODE COMMANDS

-------------------------
```
configure terminal - enter configurational mode
show ip interface - get info about ip interfaces
show running-config
```

## CONFIG MODE COMMANDS

-------------------------
```
interface <interface name> - select interface (f.e. interface gigabitethernet 0/0)
shutdown/no shutdown - disable/enable port
do - run commands from other modes
write memory - Save current configurational
reload - reboot switch/router
```

## GENERAL

-------------------------
```
Router#clock set hh:mm:ss dd mounth yy - set date
Router(config)#hostname <Name> - set router Name

Router(config)#interface X/X.<VLAN> - Create virual interface (subinterface)
X.X - physical interface to which network is connected, <VLAN> - VLAN number 
which is terminated by this interface

Router(config-if)#encapsulation dot1Q <VLAN> - external frames from interface X/X.VLAN 
will be tagged by <VLAN> VLAN and input frames with tag <VLAN> will be received by 
interface X/X.<VLAN>
```

## ACCESS CONFIGURATION

-------------------------
```
line vty 0 4 - Setup telnet/ssh connection (0 4 - five user virtual terminals/sessions)
password <Password> - Setup password for access via telnet
enable secret <Password> - Setup password for access via ssh

aaa new-model - Another way to setup login/password
username <username> password <Password> - Set login/password

line console 0        |
login                 | - set password for console port
password <Password>   |
```

## SETUP ACL

-------------------------
```
- Router(config)#ip access-list extended <List name> 
- permit/deny <protocol (tcp/udp)> <ip from> host <ip to> eq <port or protocol>
- f.e. permin tcp any host 10.0.0.1 eq www

- Router(config)#ip access-list standard <List name (number)>
- permin/deny <ip from>

- Add to interface
- ip access-group <List name> in/out
```

### Setup object groups

1. Set ports
```
object-group service <group name>
description <description>
tcp/udp eq <port>
...
``` 
2. Set hosts
```
object-group network <group name>
description <description>
host <host IP>
 ...
```
3. Set ACL
```
permit object-group <ports> object-group <hosts> any 
```

## NAT

-------------------------

1. Setup IP address pool
``` 
ip nat pool <pool name> <1st IP> <last IP> netmask <netmask>
```

2. Create access list
```
ip access-list extended <list name>
```

3. Setup NAT
``` 
ip nat inside source list <list name> pool <pool name> overload
```

4. For all internal interfaces
```
ip nat inside
```

5. For all external interfaces
```
ip nat outside
```

Port forwarding
-------------------------
```
ip nat inside source static <protocol (tcp/udp)> <internal ip> <internal port> <external ip> <external port> 
```

## DYNAMIC ROUTING

- EGP - Exterior Gateway Protocol
- IGP - Interior Gateway Protocol
    * Distance-Vector (RIP, EIGRP) routing-table exchange, knows only neigbors
    * Link-State (OSPF, IS-IS) topology-table exchange, knows all network

### Administrative distance

```
- Connected interface                                              - 0
- Static route                                                     - 1
- Enhanced Interior Gateway Routing Protocol (EIGRP) summary route - 5
- External Border Gateway Protocol (BGP)                           - 20
- Internal EIGRP                                                   - 90
- IGRP                                                             - 100
- OSPF                                                             - 110
- Intermediate system to Intermadiate System (IS-IS)               - 115
- External EIGRP                                                   - 170
- Internal BGP                                                     - 200
```

### OSPF

* OSPF Working conditions
    - Equal **hello intervals** (10s by default)
    - Equal **dead intervals**  (40s by default)
    - Both interfaces in same subnet!
    - Equal zones numbers
    - Set loopback interface with /32 netmask and set it as **RouterID**
    - Equal MTU

* OSPF states
    1. **OSPF - DOWN**
    2. **OSPF - INIT** - router send Hello-packet to multicast 224.0.0.5 from all interfaces with OSPF-started. TTL=1
        * Hello message packet
            - RouterID
            - Hello interval
            - Dead interval
            - Neighbors
            - Subnet mask
            - Area ID
            - Router priority
            - DR and BDR routers address
            - Authentication password
        * Other routers add RouterID to **neighbors** and send by unicast new Hello
    3. **OSPF-TWO-WAY** - both routers know that they are heighbors
    4. **OSPF-EXSTART** - routers decide who is DR (designated router) and BDR (backup designated router) - router with the biggest RouterID
    5. **OSPF-EXCHANGE** - DBD (Data Base Description) messages exchange which contains LSDB (Link State Data Base) description - subnets description
    6. **OSPF-LOADING** - router sends receiving DBD confirmation (LSAsk) and compares database info. if there are differences, send LSR (Link State Request) to request info                        about unknown subnets. Another router send LSU (Link State Update) which contains LSA (Link State Advertisement)
    7. **OSPF-FULL STATE** - all info is up to date
    8. Router use SPF (Shortest Path First) or Dijkstra's algoritm to calculate routes 


#### OSPF Setup commands

1. Loopback setup
```
interface loopback 0 
ip address ... ...
``` 

2. OSPF Setup 
```
router ospf <ospf id>
router-id (usually the same as **loopback interface IP**)
network <IP> <reverse subnet mask> area <area number>

ip ospf hello-interval <number> - change hello interval (first choose interface)
ip ospf dead-interval <number> 0 change dead interval (first choose interface)

passive-interface <interface name> - set passive interface, which won't send hello-packets (firtst add command **router ospf 1**)

ip ospf cost <number> - change cost of some interfaces to route trafic to another (first choose interf)
bandwidth <number> - change interface bandwidth

ip ospf authentication message-digest       |
ip ospf message-digest-key 1 md5 P@ssw0rd   | - set password when setup ospf between two routers (first set interf)
```

### EIGRP

- Each EIGRP process works with 3 tables:
    1. Neighbor table (**show ip eigrp neighbors**)
    2. Topology table (**show ip eigrp topology**)
    3. Routing table (**show ip route**)

- Metrics
    EIGRP (K1 * bw + (K2 * bw) / (256 - load) + K3 * delay) * (K5 / (reliability + K4))
        - **bw:** (10000000/the smallest bandwidth) * 256
        - **delay:** delay sum for current route in 10's miliseconds * 256 (shown in microseconds in config)
        - **K1 - K5** - coefficient

    In practise 
    - K1 = K3 = 1
    - K2 = K4 = K5 = 0

    !!! Metric is calculated for the worst bandwidth in a route

- Each route in EIGRP is described by FD (Feasible Distance) and AD (Advertised Distance) or RD (Reported Distance)
    * FD - from me to destination
    * AD - from neighbor to destination

- There are **Sucecssor** for each subnet on each router - neighbor router with the best route to subnet
- There are **Feasible Successor** router with backup route

**Simple metric**

Metric = (K1 * bw + (K2 * bw) / (256 — load) + (K3 * delay)

**EIGRP States**
after command
```
router eigrp <sybsystem number>
```
1. Router start to send hello-packets to multicast 224.0.0.10 by default every 5 seconds for ethernet
2. Each router-receiver
    - compare hello-packet sender address with interface from packet was received and make shure they from the same subnet
3. Compare received K-coefficients with own
4. Check AS (Autonomous System) number
5. Optional: Checks keys correspondence if authentication is set up 

## VPN

### GRE (General Routing Encapsulation)

![GRE frame](https://github.com/OlegPlatonenko/Virtualizing/blob/master/NETWORK/images/gre.png)

```
interface Tunnel 0
ip address <tunnel IP> <tunnel mask>
tunnel source <external provider white IP>
tunnel destination <external provider white IP>

ip route 0.0.0.0 0.0.0.0 <provider default gateway>
ip route <current subnet IP> <current mask> <tunnel internal IP on the another end>
```

f.e.
```
tunnel IPs            10.2.2.1   10.2.2.2  255.255.255.252
loopbacks             10.0.2.1   10.0.2.2  255.255.255.255
external IP           100.0.0.1  200.0.0.1 255.255.255.252
provider default GW   100.0.0.2  200.0.0.2 255.255.255.252

GW2(config)#interface Tunnel 0
GW2(config-if)#ip address 10.2.2.2 255.255.255.252
GW2(config-if)#tunnel source 200.0.0.1
GW2(config-if)#tunnel destination 100.0.0.1
GW2(config-if)#exit

ip route 0.0.0.0 0.0.0.0 100.0.0.2
ip route 10.0.2.1 255.255.255.255 10.2.2.1
```

```
show ip route
     200.0.0.0/30 is subnetted, 1 subnets
C       200.0.0.0 is directly connected, FastEthernet0/0
     10.0.0.0/8 is variably subnetted, 4 subnets, 3 masks
S       10.0.2.0/32 [1/0] via 10.2.2.1
C       10.0.2.1/32 is directly connected, Loopback0
C       10.2.2.0/30 is directly connected, Tunnel0
C       10.0.1.0/24 is directly connected, FastEthernet0/1.1
S*   0.0.0.0/0 [1/0] via 200.0.0.2
```

### IPSEC

IPSec is standard with 3 protocols

- **ESP** (Encapsulating Security Payload)
- **AH**  (Authentication Heasder)
- **IKE** (Internet Key Exchange protocol)

#### SA (Security association)

- SA is the set of security connection parameters (encryption key, encryption algorythm)
- All connections has associated SA

IPSec phases

0. A bit of traffic need to correspont to access list in crypto map
1. IKE phase
    - **ISAKMP tunnel** - information exchange about further encryption algorithms etc
    - agreement about how to build main tunnel
2. Data exchange
3. In acording to lifetime encryption keys are updated for main tunnel


1. ISAKMP setup
```
crypto isakmp policy 1
encr aes
authentication pre-share
```

2. Pre-shared key setup for neighbor check
```
crypto isakmp key 0 P@ssw0rd address 200.0.0.1
```

3. Traffic processing setup. AES encryption algorithm with ESP-header and authentication algorithm
```
crypto ipsec transform-set AES128-SHA esp-aes esp-sha-hmac
```

4. Encryption map creation
```
crypto map MAP1 10 ipsec-isakmp 
set peer 200.0.0.1
set transform-set AES128-SHA 
match address 101
```

5. ACL creation
```
access-list 101 permit ip host 10.0.2.1 host 10.0.2.2
```

#### IPSec VTI

f.e.
```
tunnel IPs            10.2.2.1   10.2.2.2  255.255.255.252
loopbacks             10.0.2.1   10.0.2.2  255.255.255.255
external IP           100.0.0.1  200.0.0.1 255.255.255.252
provider default GW   100.0.0.2  200.0.0.2 255.255.255.252

hostname R1
!
crypto isakmp policy 1
 authentication pre-share
crypto isakmp key P@ssw0rd address 200.0.0.1
!
crypto ipsec transform-set AES128-SHA esp-aes esp-sha-hmac 
 mode transport
!
crypto ipsec profile P1
 set transform-set AES128-SHA 
!
interface Loopback0
 ip address 10.0.2.0 255.255.255.255
!
interface Tunnel0
 ip address 10.2.2.1 255.255.255.252
 tunnel source 100.0.0.1
 tunnel destination 200.0.0.1
 tunnel mode ipsec ipv4
 tunnel protection ipsec profile P1
!
interface FastEthernet0/0
 ip address 100.0.0.1 255.255.255.252
 duplex auto
 speed auto
!
ip forward-protocol nd
ip route 0.0.0.0 0.0.0.0 100.0.0.2
ip route 10.0.2.1 255.255.255.255 10.2.2.2
!
end
```

## BGP (Border Gateway Protocol)
 
- Each AS (Autonomous sytem) has its own number
- BGP uses TCP

### AS numbers

- **64512 - 65534** - for private AS
- **64496 - 64511** - for examples and Documentation

- **PA-address (Provider Aggregadable)** - public IP-address range from provider
- **PI-address (Provider Independent)** - public IP-address range, are provided by LIR 9local Internet registry)

### BGP Architecture

- IBGP - run BGP routes in internal network
- EBGP - BGP between AS

### BGP Session establishment

1. **BGP IDLE** - nothing to happend (no route to BGP neighbor)
2. **CONNECT** - listen 179-TCP port 
3. **ACTIVE** - send packets on 179 TCP-port
    R1 send **TCP-SYN** to R2 179-port - initiating TCP session
    R2 send **TCP-ACK** and own **TCP-SYN** to R1 
    R1 send **TCP-ACK** to R2
4. **OPEN** - messages send only once at the beginning of BGP-session
    **OPENSENT** - message sent
    **OPENCONFIRM** - message received
    After receiving *OPEN* from R1, R2 send own *OPEN* and **KEEPALIVE**
5. **KEEPALIVE** - signal for R1 to go to **ESTABLISHED** state
6. **UPDATE** - route information exchange


