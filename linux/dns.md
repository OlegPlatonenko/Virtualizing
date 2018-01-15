# DNS

```bash
sudo vi /etc/network/interfaces
```

```bash
systemd-resolve --status
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

![DNS resolvers scheme](https://github.com/OlegPlatonenko/net-sys-administration/blob/master/linux/images/dns_resolvers.png)

## DNS Requests

- **Forward** - send domain name to DNS server and ask for IP address (root and TLD servers)
- **Recursive** - send domain name to DNS server and ask for IP address, DNS server may ask another servers
- **Reverse** - send IP and ask for domain name

```
1. Client (what IP has host.test.com?)             --> resolver
2. resolver (/etc/nsswitch.conf, /etc/resolv/conf) --> Primary DNS server 
3. Primary DNS server                              --> root DNS server
4. root DNS server                                 --> DNS server for **com** domain
5. DNS server for com domain                       --> DNS server for **test** domain
6. DNS server for test domain                      --> return IP to Primary DNS server
7. Primary DNS server                              --> return IP to client
```

## DNS Server response

- Authoritative (from servers which are response for zone)
- Non authoritative (from catching servers)

### DNS response sections

- Header entry
- Request entry
- Response entry
- Authoritative servers entry
- Additional information

```
; <<>> DiG 9.9.4-RedHat-9.9.4-51.el7_4.1 <<>> google.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 20962
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 13, ADDITIONAL: 24

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096

;; QUESTION SECTION:
;google.com.			IN	A

;; ANSWER SECTION:
google.com.		35	IN	A	172.217.18.174

;; AUTHORITY SECTION:
.			1899	IN	NS	c.root-servers.net.
.			1899	IN	NS	d.root-servers.net.

;; ADDITIONAL SECTION:
c.root-servers.net.	39649	IN	A	192.33.4.12
d.root-servers.net.	1978	IN	A	199.7.91.13

;; Query time: 8 msec
;; SERVER: 172.22.61.3#53(172.22.61.3)
;; WHEN: Thu Jan 04 09:42:02 EST 2018
;; MSG SIZE  rcvd: 778

dig.txt
Open with
Displaying dig.txt.
```

## Reverse name transformation

**in-addr.arpa** domain is used in DNS for reserve transformation

```
; <<>> DiG 9.9.4-RedHat-9.9.4-51.el7_4.1 <<>> -x 199.7.91.13
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8680
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 13, ADDITIONAL: 26

...

;; QUESTION SECTION:
;13.91.7.199.in-addr.arpa.	IN	PTR

;; ANSWER SECTION:
13.91.7.199.in-addr.arpa. 175	IN	PTR	d.root-servers.net.
...
```

## DNS Server Configuration (Debian and CentOS)

![DNS Configuration structure](https://github.com/OlegPlatonenko/net-sys-administration/blob/master/linux/images/bind_config.png)

Main binary file is located at **/usr/sbin/named**

### named.conf (/etc/bind) structure

- Working server catalog (/var/cache/bind) with zone description files
- Accordance between zone name and zone description file is set in **zone**
 section with **file** parameter
- **Zone** section also describes server type for this zone - *master, slave, etc*

**named.conf example**
```
include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";
include "/etc/bind/named.conf.default-zones";
```

**named.conf.options example**
```
acl "my_access_list" {
	10.0.0.1/24; #my_lab
};

options {
	directory "/var/cache/bind";

	forwarders {
	0.0.0.0;
	};

	dnssec-validation auto;

	auth-nxdomain no;    # conform to RFC1035
	listen-on-v6 { any; };
};
```

**named.conf.default-zones example**
```
// prime the server with knowledge of the root servers
zone "." {
	type hint;
	file "/etc/bind/db.root";
};

// be authoritative for the localhost forward and reverse zones, and for
// broadcast zones as per RFC 1912

zone "localhost" {
	type master;
	file "/etc/bind/db.local";
};

zone "127.in-addr.arpa" {
	type master;
	file "/etc/bind/db.127";
};

zone "0.in-addr.arpa" {
	type master;
	file "/etc/bind/db.0";
};

zone "255.in-addr.arpa" {
	type master;
	file "/etc/bind/db.255";
};
```
**db file example**
```
$TTL	604800
@	IN	SOA	localhost. root.localhost. (
			      1		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	localhost.
```

### named.conf syntax

#### IP address
- IP address list must be separated with ";"
- IP-sybnet may be set in formats: 192.168.1.1/24 or 192.168.1.1/255.255.255.0
- IP address may be excluded with "!"
- You may use "any", "none", "localhost"

#### Comments
- Lines with #, //, /* */ are comments

- In zones description files **@** symbol is variable with zone name value, which is set in **named.conf**
- Each finished line with parameters must end with ";"

#### ACL section
- ACL - gives opportunity to set named network list in format: acl "network name" {ip; ip; ip};

#### Options section

- options {Option_section_operators};

**Common used Options operators**

- **allow-query {ip list}** - Allows responds only for listed ip's
- **allow-recursion {ip list}** - Recurse responses for listed ip's
- **allow-transfer {ip list}** - List of servers which may take zone from server
- **directory /path/to/work/dir** - Absolute path to working directory
- **forwarders {ip port, ip port}** - host adress and ports if needed for request redirection
- **forward ONLY or forward FIRST** - if **first** - resolve with DNS-servers listed in **forwarders**
- **notify YES/NO** - Yes - notify slave-servers about changes in zone
- **recursion YES/NO** - Yes - Yes - do recurse requests

#### Zone section

- zone {Zone_section_operators}

**Common used Zone section operators**

- **allow-update {ip_list}** - list of systems which allows update zone dynamically
- **file "file_name"** - path to file with zone parameters (must be located in folder defined in *options* section with *directory* operator)
- **masters {ip_list}** - master servers list
- **type "zone_type"**
    * *forward* - redirection zone
    * *hint* - secondary zone (info about core servers)
    * *master* - work as *master* server for current zone
    * *slave* - work as *slave* server for current zone

#### Additional configuration parameters

- **$TTL** - defines TTL-by default for all entries in current zone
- **$ORIGIN** - change zone name from defined in named.cong
- **$INCLUDE** - include current file as part of zone file

