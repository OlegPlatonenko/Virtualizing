# DOCKER commands

## Single node
```bash
#Docker status (running containers list)
docker ps

CONTAINER ID   IMAGE            COMMAND        CREATED              STATUS              PORTS    NAMES
ee7949239136   ubuntu:12.10     "/bin/bash"    About a minute ago   Up About a minute            kickass_joliot
```

```bash
#List available downloaded Docker images
docker images

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ubuntu              12.10               3e314f95dcac        3 years ago         172 MB
```

```bash
#Run docker image
docker run <image repository name>
```

```bash
#Show cached changes in container
docker diff <container ID>

C /var
C /var/lib
C /var/lib/apt
C /var/lib/apt/lists
D /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_quantal-security_Release.gpg
D /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_quantal-updates_Release.gpg
D /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_quantal_Release.gpg
C /var/lib/apt/lists/partial
A /var/lib/apt/lists/partial/archive.ubuntu.com_ubuntu_dists_quantal-security_Release.gpg.reverify
A /var/lib/apt/lists/partial/archive.ubuntu.com_ubuntu_dists_quantal-updates_Release.gpg.reverify
A /var/lib/apt/lists/partial/archive.ubuntu.com_ubuntu_dists_quantal_Release.gpg.reverify

#Commit this changes and create new image
docker commit <container ID> <username/new-image-name>

#Add name to custom image separately
docker image tag <image ID> <username/new-image-name>
```

```bash
#Run already created container
docker start <container ID>
```

```bash
#Send command to container
docker exec <container ID> <command>
```

```bash
#Build image from Dockerfile
docker image build -t <imagename>
```

Dockerfile example
```Dockerfile 
FROM alpine
RUN apk update && apk add nodejs
COPY . /app
WORKDIR /app
CMD ["node","index.js"]
```

```bash
#Get docker image creating history
docker image history <image ID>
```

```bash
#Inspect Docker image
docker image inspect <imagename>

#Get info about layers
docker image inspect --format "{{ json .RootFS.Layers }}" <imagename>
```

```bash
#Remove a few containers
docker rm $(docker -a -f status=exited -q)
```

```bash
#Map folder to container
docker run -it --name <container-name> -v <Host_shared_file_path>:<Container_folder> <image_name> <command>
```

## Docker Swarm

```bash
#Init Docker Swarm manager
docker swarm init --advertise-addr $(hostname -i)

Swarm initialized: current node (tjocs7ul557phkmp6mkpjmu3f) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-3b33jjwsqpkcy2c8og73aorjf2ao9sjm4crvbwg3xpd1ome459-ckfdcxqqahb9gy9s2t9n5mi78 10.0.25.3:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```

```bash
#Get list of Swarm nodes
docker node ls
```

```bash
#Deploy Docker Stack
docker stack deploy --compose-file=<file_name>

#List of Docker Stacks
docker stack ls
```

## DOCKER DAEMON CONTROL

```bash
#Common information
root@SRV02:/home/test/net-sys-administration/powershell# systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; disabled; vendor preset: enabled)
   Active: active (running) since Wed 2018-03-07 00:33:21 EST; 1min 6s ago
     Docs: https://docs.docker.com
 Main PID: 10923 (dockerd)
    Tasks: 28
   Memory: 68.6M
      CPU: 910ms
   CGroup: /system.slice/docker.service
           ├─10923 /usr/bin/dockerd -H fd://
           ├─10943 docker-containerd -l unix:///var/run/docker/libcontainerd/docker-containerd.sock --metrics-interval=0 --start-timeout 2m --state-dir /var/run/docker/libcon
           ├─11999 docker-containerd-shim c1149129c40ed21b153237ed8ad4db40a7c81b944cb97b14820282f9d3241c6d /var/run/docker/libcontainerd/c1149129c40ed21b153237ed8ad4db40a7c81
           └─12015 bash

Mar 07 00:33:21 SRV02 dockerd[10923]: time="2018-03-07T00:33:21.594871630-05:00" level=info msg="No non-localhost DNS nameservers are left in resolv.conf. Using default exter
Mar 07 00:33:21 SRV02 dockerd[10923]: time="2018-03-07T00:33:21.595387161-05:00" level=info msg="IPv6 enabled; Adding default IPv6 external servers: [nameserver 2001:4860:486
Mar 07 00:33:22 SRV02 dockerd[10923]: time="2018-03-07T00:33:22-05:00" level=info msg="Firewalld running: false"
Mar 07 00:33:41 SRV02 dockerd[10923]: time="2018-03-07T00:33:41.438469484-05:00" level=warning msg="failed to retrieve docker-init version: unknown output format: tini versio
Mar 07 00:34:01 SRV02 dockerd[10923]: time="2018-03-07T00:34:01.442464404-05:00" level=warning msg="failed to retrieve docker-init version: unknown output format: tini versio
Mar 07 00:34:07 SRV02 dockerd[10923]: time="2018-03-07T00:34:07.864572609-05:00" level=info msg="No non-localhost DNS nameservers are left in resolv.conf. Using default exter
Mar 07 00:34:07 SRV02 dockerd[10923]: time="2018-03-07T00:34:07.865138445-05:00" level=info msg="IPv6 enabled; Adding default IPv6 external servers: [nameserver 2001:4860:486
Mar 07 00:34:08 SRV02 dockerd[10923]: time="2018-03-07T00:34:08.314473343-05:00" level=error msg="Handler for POST /v1.26/containers/bash/start returned error: No such contai
Mar 07 00:34:15 SRV02 dockerd[10923]: time="2018-03-07T00:34:15.585865352-05:00" level=error msg="Handler for POST /v1.26/containers/c1149129c40e/start returned error: Contai
Mar 07 00:34:21 SRV02 dockerd[10923]: time="2018-03-07T00:34:21.442816177-05:00" level=warning msg="failed to retrieve docker-init version: unknown output format: tini version"

#Default daemon directory
root@SRV02:/home/test/net-sys-administration/powershell# systemctl status docker.service | grep loaded
   Loaded: loaded (/lib/systemd/system/docker.service; disabled; vendor preset: enabled)
```

### Docker main configuration file - docker.service

**docker.service** has 3 main sections: 

- Unit
- Service
- Install

```
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network.target docker.socket firewalld.service
Requires=docker.socket

[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
EnvironmentFile=-/etc/default/docker
ExecStart=/usr/bin/dockerd -H fd:// $DOCKER_OPTS
ExecReload=/bin/kill -s HUP $MAINPID
LimitNOFILE=1048576
# Having non-zero Limit*s causes performance problems due to accounting overhead
# in the kernel. We recommend using cgroups to do container-local accounting.
LimitNPROC=infinity
LimitCORE=infinity
# Uncomment TasksMax if your systemd version supports it.
# Only systemd 226 and above support this version.
TasksMax=infinity
TimeoutStartSec=0
# set delegate yes so that systemd does not reset the cgroups of docker containers
Delegate=yes
# kill only the docker process, not all processes in the cgroup
KillMode=process

[Install]
WantedBy=multi-user.target
```

### Changing settings

```bash
#Receive current settings
root@SRV02:/home/test/net-sys-administration/powershell# systemctl cat docker | grep ExecStart
ExecStart=/usr/bin/dockerd -H fd:// $DOCKER_OPTS

#Changing settings
root@SRV02:/home/test/net-sys-administration/powershell# systemctl edit docker

#Enter into opened editor:
[Service]
ExecStart=
ExecStart=/usr/bin/docker daemon -H tcp://0.0.0.:2375 -H unix:///var/run/docker.sock

#If file waas edited manually you need one more command:
root@SRV02:/home/test/net-sys-administration/powershell# systemctl daemon-reload

#Check override file
root@SRV02:/home/test/net-sys-administration/powershell# cat /etc/systemd/system/docker.service.d/override.conf 
[Service]
ExecStart=
ExecStart=/usr/bin/docker daemon -H tcp://0.0.0.:2375 -H unix:///var/run/docker.sock

#Restart service and check status
root@SRV02:/home/test/net-sys-administration/powershell# systemctl restart docker
root@SRV02:/home/test/net-sys-administration/powershell# systemctl status docker
```

### Reviewing logs

```
root@SRV02:~# journalctl -u docker
-- Logs begin at Tue 2018-03-06 12:21:01 EST, end at Wed 2018-03-07 00:59:27 EST. --
Mar 07 00:33:17 SRV02 systemd[1]: Starting Docker Application Container Engine...
Mar 07 00:33:17 SRV02 dockerd[10923]: time="2018-03-07T00:33:17.757014455-05:00" level=info msg="libcontainerd: new containerd process, pid: 10943"
Mar 07 00:33:18 SRV02 dockerd[10923]: time="2018-03-07T00:33:18.904698813-05:00" level=info msg="[graphdriver] using prior storage driver: aufs"
Mar 07 00:33:19 SRV02 dockerd[10923]: time="2018-03-07T00:33:19.344977585-05:00" level=info msg="Graph migration to content-addressability took 0.00 seconds"
Mar 07 00:33:19 SRV02 dockerd[10923]: time="2018-03-07T00:33:19.345774153-05:00" level=warning msg="Your kernel does not support swap memory limit"
Mar 07 00:33:19 SRV02 dockerd[10923]: time="2018-03-07T00:33:19.346235226-05:00" level=warning msg="Your kernel does not support cgroup rt period"
Mar 07 00:33:19 SRV02 dockerd[10923]: time="2018-03-07T00:33:19.346566120-05:00" level=warning msg="Your kernel does not support cgroup rt runtime"
Mar 07 00:33:19 SRV02 dockerd[10923]: time="2018-03-07T00:33:19.349953896-05:00" level=info msg="Loading containers: start."
Mar 07 00:33:19 SRV02 dockerd[10923]: time="2018-03-07T00:33:19.814502801-05:00" level=info msg="Firewalld running: false"
```

## DOCKER NETWORKING

```bash
#List Docker networks
docker network ls

NETWORK ID          NAME                DRIVER              SCOPE
2f220bd57a11        bridge              bridge              local
db20efe9b8d3        docker_gwbridge     bridge              local
4385f6264a19        host                host                local
v5soowd10tjf        ingress             overlay             swarm
92d92d8c0e5d        none                null                local

#All networks which use bridge driver are based locally
```

```
#Network inspection
docker inspect <network_name>

[
    {
        "Name": "bridge",
        "Id": "2f220bd57a110050db07b6f0feb1471329efd370eaf6d1ac4fb8a53de49c7e8d",
        "Created": "2018-03-07T00:54:26.921640162-05:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Containers": {},
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
```

```bash
#Get list of all Linux network bridges
brctl show

bridge name	       bridge id		   STP enabled	  interfaces
docker0            8000.024220846709	   no		
docker_gwbridge    8000.0242ba139cec	   no		  vethf5945ab

#More deep info
ip a

3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:20:84:67:09 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:20ff:fe84:6709/64 scope link 
       valid_lft forever preferred_lft forever
```

```bash
#Create new container
root@SRV02:/home/test/net-sys-administration# docker run -dt ubuntu sleep infinity
e2e14923fd92287881088f7a543df21a423881100c95d12c29cf3d1cc544ba74

#Review that container is created
root@SRV02:/home/test/net-sys-administration# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
e2e14923fd92        ubuntu              "sleep infinity"    22 seconds ago      Up 20 seconds                           competent_ptolemy

#Inscpect bridges
root@SRV02:/home/test/net-sys-administration# brctl show
bridge name	          bridge id		    STP enabled	      interfaces
docker0		        8000.024220846709	    no		      veth5800aef
docker_gwbridge		8000.0242ba139cec	    no		      vethf5945ab

#Look more deeply to docker0 bridge and see that it is connected no new createdcontainer
root@SRV02:/home/test/net-sys-administration# docker network inspect bridge
...
"Containers": {
            "e2e14923fd92287881088f7a543df21a423881100c95d12c29cf3d1cc544ba74": {
                "Name": "competent_ptolemy",
                "EndpointID": "e3dcdaecfdcecd40b442692bef1e389eee8b9f21494653177a2e6208270fdee2",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            }
        },
...

#Pinging container
root@SRV02:/home/test/net-sys-administration# ping -c5 172.17.0.2
PING 172.17.0.2 (172.17.0.2) 56(84) bytes of data.
64 bytes from 172.17.0.2: icmp_seq=1 ttl=64 time=0.063 ms
64 bytes from 172.17.0.2: icmp_seq=2 ttl=64 time=0.054 ms
64 bytes from 172.17.0.2: icmp_seq=3 ttl=64 time=0.043 ms
64 bytes from 172.17.0.2: icmp_seq=4 ttl=64 time=0.044 ms
64 bytes from 172.17.0.2: icmp_seq=5 ttl=64 time=0.044 ms

--- 172.17.0.2 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4052ms
rtt min/avg/max/mdev = 0.043/0.049/0.063/0.011 ms
```


