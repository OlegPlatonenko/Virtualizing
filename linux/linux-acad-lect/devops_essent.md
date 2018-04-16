# Devops Essentials

## Table of contents

- [1. DevOps goals](#DG)
- [2. DevOps principles](#DP)
    - [a. Build Automation](#BA)
    - [b. Continuous Integration](#CI)
    - [c. Continuous Delivery](#CD)
    - [d. Infrastructure as Code](#IaC)
    - [e. Configuration Management](#CM)
    - [f. Orchestration](#ON)
    - [g. Monitoring](#MG)
    - [h. Microservices](#MS)
- [3. DevOps Tools](#DT)
    - [a. Build Automation](#BA1)
    - [b. Continuous Integration](#CI1)
    - [c. Configuration Management](#CM1)
    - [d. Virtualization and Containerization](#VC1)
    - [e. Monitoring](#MG1)
    - [f. Orchestration](#ON1)

## 1. DevOps goals <a name="DG"></a>

- Fast time-to-market
- Few production failures
- Immediate recovery from failures

## 2. DevOps Principles <a name="DP"></a>

### a. Build Automation <a name="BA"></a>

- Use **build script** or **build tool**
- Build automation is Independent of IDE

- **BA Features**

- fast
- consistent
- repeatable
- portable
- reliable

### b. Continuous Integration <a name="CI"></a>

- Merge many times everyday
- Merging should be automated

### c. Continuous Delivery <a name="CD"></a>

- Code is always ready to be deployed (Delivery)
- Many often small deployments (Deployment)

### d. Infrastructure as Code <a name="IaC"></a>

- Create config files
- Commit to source control
- Use automation tool for management

### e. Configuration Management <a name="CM"></a>

- Minimize **Configuration drift** - small differences in configs between different servers

### f. Orchestration <a name="ON"></a>

- Orchestration: automation that supports processes and workflows, such as provisioning resources

### g. Monitoring <a name="MG"></a>

- Fast recovery
- Better root cause analysis
- Visibility across teams
- Automated response

### h. Microservices <a name="MS"></a>

- A microservice architecture breaks an appliation up into a collection of small, loosely-coupled services

## 3. DevOps Tools <a name="DT"></a>

https://xebialabs.com/periodic-table-of-devops-tools/

### a. Build Automation <a name="BA1"></a>

- **Java** - ant, maven, gradle
- **Java script** - npm, grunt, gulp
- **Make** - used in Unix Systems
- **Packer** - to build VM machines and Containers

### b. Continuous Integration <a name="CI1"></a>

- **Jenkins**
- **TravisCI** (built aroung GitHub integration)
- **Bamboo**

### c. Configuration Management <a name="CM1"></a>

- **Ansible** - can do Declarative configuration (YAML Files)
- **Puppet** - can do Declarative configuration (use UI)
- **Chef** - can do Procedural configuration (scripts)
- **Salt** - can do Declarative configuration (YAML Files)

### d. Virtualization and Containerization <a name="VC1"></a>

- **Docker** - leading container technology

### e. Monitoring <a name="MG1"></a>

- **Infrastructure monitoring**
    - **SenSu** (Server/Agent, AMQP broker)
    - **NewRelic** (SaaS, APM)
- **App performing monitoring (APM)**
    - **AppDynamics** (Code-level diagnostics, Server/Agent)
    - **NewRelic**
- **Aggregation and Analytics**
    - **Elastic Stack**

### f. Orchestration <a name="ON1"></a>

- **Docker Swarm** - Docker Containers orchestration
- **Kubernetes** - Orchestration Server
- **Zookeeper** - centralized service registry
- **Terraform** - Combines orchestration with IaC