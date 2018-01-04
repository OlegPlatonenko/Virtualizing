# DNS

```bash
sudo vi /etc/network/interfaces
```

- Set IP to static

```
sudo apt-get -y update
sudo apt-get -y install bind9 bind9utils bind9-doc
```

- Configure BIND9 to run in IPv4
```
$ sudo vi /etc/default/bind9

# run resolvconf?
RESOLVCONF=no

# startup options for the server
OPTIONS="-4 -u bind"  
``` 

## DNS Configuration

The primary configuration file for the BIND DNS server named process is **/etc/named.conf** (**/etc/bind/named.conf** in Ubuntu/Debian). 

It includes three additional configuration files: **named.conf.options, named.conf.local, and named.conf.default-zones**.

## DNS Server logs

```

```

## DNS Zones

- **Zone** is a part of domain name system tree which is located on one DNS-server. It also may be called *zone of responsibility*.

### Difference between zone and domain

If we have domain *boston.edu* with 1 DNS-zones *math.boston.edu* so all machines are members of boston.edu domain but some of them are members of math.boston.edu DNS zone, not boston.edu

## FQDN (Fully Qualified Domain Name)

```
host.systems.com.
 |      |   | | |
 |      |   | | +-- root domain
 |      |   | +---- first level domain (TLD - top level domains)
 |      |   +------ dot between domains, parts of FQDN
 |      +---------- second level domain
 +----------------- subdomain/third level domain, maybe hostname
```
## Resource records

- NAME - domain name or IP address
- TTL (Time to Live) - time for storing record in DNS cache
- CLASS - network type (in 99% cases IN (Internet) is used)
- TYPE - record type, syntax and purpose
- DATA - different info which format and syntax is defined by type

Current symbols may be used:

```
- ;  - comment
- @  - name of current domain
- () - data may use a few rows
- *  - metasymbol (only in NAME field)
```

### Resource records types

- **A** - address record
```
test.com.  86400   IN   A    10.0.0.25
```
- **AAAA** - same as A but for IPv6
- **CNAME** (canonical name record) displays alias for real name
```
program_01 86400   IN CNAME  prog.test.com
```
- **MX** - mail exchange. 
* NAME fileld displays destinamtion domain
* DATA field displays priority and after space mail server domain name
```
test.com  17790  IN   MX     10 mail1.test.com
test.com  17790  IN   MX     20 mail2.test.com
```
- **NS** - name server (DNS server for this domain)
```
test.com  17790  IN   MX     dns.microsoft.com
```
- **PTR** - convert IP-address to domain name
- **SOA** - Start of Authority (describes main zone settings)
* NAME - domain name (zone name)
* TTL, CLASS - standard values
* TYPE - SOA
* DATA 
    1. Primary DNS server name
    2. zone administrator address
    3. zone file serial number in brackets
    4. Timers
        1) Refresh - how often secondary server retrives primary serial number for updates
        2) Retry - Waiting time after unsuccessful retrive
        3) Expire - maximum time during what secondary server use info about zone
        4) Minimum TTL - minimum time during what data is located in secondary server cache

```
test.com  86400   IN   SOA   dns01.test.com host01.test.com (
                              20180103001 ; serial
                              28800  ; refresh
                              7200   ; retry
                              604800 ; expire
                              86400)  ; minimum TTL
```
- **SRV** - server selection (Jabber or Active Directory)

## DNS Servers

- **Primary (Master)** - authoritive server. Which has main database copy
- **Secondary** - receive database copy from primary server

In depending of setup main server may send zone changing signal to secondary. After receiving secondary performs copy. It calls *zone transfer*. 
- AXFR - full zone copy
- IXFR - incremental

- **Caching** - save in memory cache from previous requests

## DNS clients (resolvers)

- file /etc/nsswitch.conf - defines which services in what order use (/etc/hosts or DNS - /etc/resolv.conf)
```
hosts:    files dns
networks: files
```
- file /etc/resolv.conf
```
nameserver 10.0.0.1
nameserver 10.0.0.2
domain example.com
search test.com
```
- domain defines default domain
- search - defines additional domain
domain and search options couldn't be used both

![DNS resolvers scheme](https://github.com/OlegPlatonenko/net-sys-administration/blob/master/LINUX/images/dns_resolvers.png)
