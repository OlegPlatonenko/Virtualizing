# DOCKER commands

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

```bash
#Get docker image creating history

docker image history <image ID>
```

