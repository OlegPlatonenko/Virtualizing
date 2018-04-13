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

### a. Build Automation

- **Java** - ant, maven
- **Java script** - npm, grunt
- Make - used in Unix Systems
- Packer - to build VM machines and Containers

### b. Continuous Integration

- Jenkins
- TravisCI (built aroung GitHub integration)
- Bamboo