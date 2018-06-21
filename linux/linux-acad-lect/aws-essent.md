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