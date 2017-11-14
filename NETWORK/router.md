# CISCO ROUTER COMMANDS

? - show help
<command> ? - show command help
<command> <parameter> ? - show parameter help
enable - enable priviledge mode

## PRIVILEDGE MODE COMMANDS

-------------------------
configure terminal - enter configurational mode
show ip interface - get info about ip interfaces
show running-config

## CONFIG MODE COMMANDS

-------------------------
interface <interface name> - select interface (f.e. interface gigabitethernet 0/0)
shutdown/no shutdown - disable/enable port
do - run commands from other modes
write memory - Save current configurational
reload - reboot switch/router

## GENERAL

-------------------------
Router#clock set hh:mm:ss dd mounth yy - set date
Router(config)#hostname <Name> - set router Name

Router(config)#interface X/X.<VLAN> - Create virual interface (subinterface)
X.X - physical interface to which network is connected, <VLAN> - VLAN number 
which is terminated by this interface

Router(config-if)#encapsulation dot1Q <VLAN> - external frames from interface X/X.VLAN 
will be tagged by <VLAN> VLAN and input frames with tag <VLAN> will be received by 
interface X/X.<VLAN>

## ACCESS CONFIGURATION

-------------------------
line vty 0 4 - Setup telnet/ssh connection (0 4 - five user virtual terminals/sessions)
password <Password> - Setup password for access via telnet
enable secret <Password> - Setup password for access via ssh

aaa new-model - Another way to setup login/password
username <username> password <Password> - Set login/password

line console 0        |
login                 | - set password for console port
password <Password>   |

## SETUP ACL

-------------------------
- Router(config)#ip access-list extended <List name> 
- permin/deny <protocol (tcp/udp)> <ip from> host <ip to> eq <port or protocol>
- f.e. permin tcp any host 10.0.0.1 eq www

- Router(config)#ip access-list standard <List name (number)>
- permin/deny <ip from>

- Add to interface
- ip access-group <List name> in/out

### Setup object groups

1. Set ports
* object-group service <group name>
* description <description>
* tcp/udp eq <port>
* ... 
2. Set hosts
object-group network <group name>
* description <description>
* host <host IP>
* ...
3. Set ACL
* permit object-group <ports> object-group <hosts> any 

## NAT

-------------------------
1. Setup IP address pool 
- ip nat pool <pool name> <1st IP> <last IP> netmask <netmask>

2. Create access list
- ip access-list extended <list name>

3. ip nat inside source list <list name> pool <pool name> overload

4. For all internal interfaces
- ip nat inside

5. For all external interfaces
- ip nat outside

Port forwarding
-------------------------
ip nat inside source static <protocol (tcp/udp)> <internal ip> <internal port> <external ip> <external port> 

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



-------------------------
1. Loopback setup
interface loopback 0 
ip address ... ... 

2. router ospf <ospf id>
3. router-id (usually the same as **loopback interface IP**)
4. network <IP> <reverse subnet mask> area <area number>

5. ip ospf hello-interval <number> - change hello interval (first choose interface)
6. ip ospf dead-interval <number> 0 change dead interval (first choose interface)

7. passive-interface <interface name> - set passive interface, which won't send hello-packets (firtst add command **router ospf 1**)
8. ip ospf cost <number> - change cost of some interfaces to route trafic to another (first choose interf)
9. bandwidth <number> - change interface bandwidth

10. ip ospf authentication message-digest       |
11. ip ospf message-digest-key 1 md5 P@ssw0rd   | - set password when setup ospf between two routers (first set interf)