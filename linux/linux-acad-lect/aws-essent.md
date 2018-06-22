# AWS Essentials

## Table of contents

- [1. Identity and Access Management](#IAM)
- [2. Virtual Private Cloud (VPC)](#VPC)
    - [a) Internet Gateway (IGW)](#IGW)
    - [b) Internet Gateway (RTs)](#RTs)
    - [c) Network Access Control Lists (NACLs)](#NACLs)
    - [d) Subnets](#SUB)
    - [e) Availability Zone](#AVZ)
- [3. Simple Storage Service (S3)](#S3)
- [4. Elastic Compute Cloud (EC2)](#EC2)
    - [a) Amazon Machine Image (AMI)](#AMI)
    - [b) Instance Types](#IT)
    - [c) Elastic Block Store (EBS) Volumes](#EBS)
    - [d) Security Groups](#SG)
    - [e) IP Addressing](#IP)
- [5. RDS & DynamoDB](#RDS)
- [6. Simple Notification Service (SNS) Basics](#SNS)
- [7. Cloud Watch Basics](#CW)

## 1. Identity and Access Management <a name="IAM"></a>

Manage users, groups, AWS policies, roles

## 2. Virtual Private Cloud (VPC) <a name="VPC"></a>

- Regions (USA, Europe, Australia ...)
- Availability zones (1,2,3 ...)

### VPC Definitions

- **VPC** = Virtual Private Cloud

1. Internet Gateway
2. Route Table
3. Network Access Control List (NACL)
4. Subnets

### a) Internat Gateaway (IGW) <a name="IGW"></a>

Provides connection for VPC to the Internet

1. Horizontally Scaled
2. Redundant
3. Highly Available

### b) Route Tables (RTs) <a name="RTs"></a>

Contains set of rules which determens where network traffic is directed

### c) Network Access Control Lists (NACLs) <a name="NACLs"></a>

- Inbound Rules
- Outbound Rules

### d) Subnets <a name="SUB"></a>

- **Public** subnet has route to the Internet
- **Private** doesn't have

### e) Availability Zone <a name="AVZ"></a>

Each Zone geographically separated from another Zones

- High Availability
- Fault Tolerance

## 3. S3 (Simple Storage Service) <a name="S3"></a>

Online bulk storage which may be accessed from any device

- Buckets
- Folders
- Objects

Storage class represents the "classification" assigned to each Object in S3

- Standard
- Reduced Redundancy Storage (RRS)
- Infrequent Access (S3-IA)
- Glacer

**Durability** - fault tolerance
**Availability** - file available in particulat time moment

**Storage lifecycle** - set of rules that automate the migration of an object's storage class to a different storage class, based on specific time intervals.

## 4. Elastic Compute Cloud (EC2) <a name="EC2"></a>

- AMI (Operating System)
- Instance type (CPU)
- EBS (Local Storage)
- IP Addressing (Network Card)
- Security Groups (Firewall)
- RAM

### a) Amazon Machine Image (AMI) <a name="AMI"></a>

- Operating System
- Software PAckages
- Required Settings

### b) Instance Types <a name="IT"></a>

Instance Types Components
- Family
- Type
- vCPUs
- Memory
- Instance Storage
- EBS-Optimized
- Network-Performance

### c) Elastic Block Store (EBS) Volumes <a name="EBS"></a>

Storage Volume for EC2 instance

**IOPS** = Input/Output Operations per Second

A **snapshot** is an "image" of an EBS volume that can be stored as a backup of the volume or used to create a duplicate.

### d) Security Groups <a name="SG"></a>

When you create a new SG, all **inboud** traffic is denied and all **outbound** traffic is allowed by default.

There are no **deny** rules - only **allow** rules

**!!! Best practice is to allow ONLY traffic that is required**

### e) IP Addressing <a name="IP"></a>

Providing EC2 instance with public IP address

Public IP addresses are required to the instance to communicate with the Internet

## 5. RDS & DynamoDB <a name="RDS"></a>

- Relational (SQL)
- Non-Relational (noSQL)

**Relational Database Service (RDS)** 

SQL Options
- Amazon Aurora
- MySQl
- MariaDB
- PostgradeSQl
- Oracle
- Microsoft SQLServer

**DynamoDB**

DynamoDB can replace
- MongoDB
- Cassandra DB
- Oracle NoSQL

**SQL** - stores data in tables, typically used for very structured data, such as contact lists

**NoSQL** - stores related data in JSON-like, name-value documents, typically used for non-structured data such as catalog documents

## 6. Simple Notification Service (SNS) Basics <a name="SNS"></a>

An AWS service that allows to automate the sending of email or text message notifications, based on events that happend in AWS account

SNS Components
- Topics
- Subscriptions
- Publishers

## 7. Cloud Watch Basics <a name="CW"></a>

CloudWatch is a service that allows you to monitor various elements of AWS account