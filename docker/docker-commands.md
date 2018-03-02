# DOCKER commands

##Single node
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

```bash
<<<<<<< HEAD
#Remove a few containers

docker rm $(docker -a -f status=exited -q)
```

```bash
#Map folder to container

docker run -it --name <container-name> -v <Host_shared_file_path>:<Container_folder> <image_name> <command>
```

##Docker Swarm

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







=======
#Inspect Docker image

docker image inspect <imagename>

#Get info about layers

docker image inspect --format "{{ json .RootFS.Layers }}" <imagename>
```

>>>>>>> 2bfb67668450bb4c900fa18884380edd114d631b
