# AWS Certified Solutions Architect

An **Edge Location** is an AWS datacenter which does not contain AWS services. Instead, it is used to deliver content to parts of the world.

An example would be **CloudFront** which is CDN: cached items such as a PDF file can be cached on an edge location which reduces the amount of *space/time/latency* required for a request from that part of the world.

AWS physical Structure

- Regions
    - 3-4 Availability Zones
- Edge locations

## Table of contents 

- [1. Terminology](#TERM)
- [2. Identity and Access Management](#IAM)
- [3. Virtual Private Cloud](#VPC)

## 1. Terminology <a name="TERM"></a>

**High Availability**
- Refers to systems that are durable and likely to operate continuously withou failure for a long time. For a solutions architect this means making sure your application (hosted in AWS) is always available when a user/customer tries to access it.

**Fault Tolerance**
- Is the property that enables a system to continue operating properly in the event of the failure of one or more of its components. A fault tolerant application (in AWS) would be where one of its web server can fail, and still serve traffic to visitors (and even repair itself).

**Scalability** 
- The ability of a system to easily increase in size and capacity in a cost effective way (usually based on usage demand)

**Elasticity**
- The ability of a system to increase and decrease in size (usually based on usage demand). In architecting applications, this usually refers to the ability of an application to increase and decrease server capacity on demand.

**Cost Efficient** 
- Choosing the correct options to make a system as inexpensive as possible.

**Secure** 
- Following proper security guidelines and practices to secure a system

**AWS Best Practices** 
- A set of guidelines outlined by AWS that should be followed when provisioning and using their services

## 2. Identity and Access Management <a name="IAM"></a>

The common use of **IAM** is to manage
- Users
- Groups
- Roles
- IAM Access Policies
- Api Keys
- Specify a password policy as well as manage requirements on a per user basis

**Policy** is a document that formally states one or more permissions

By default an **explicit deny** always override and an **explicit allow**

Policy example
```json
{
    "Version": "2018-7-4"
    "Statement": [
        {
            "Effect": "Allow"
            "Action": "*"
            "Resource": "*"
        }
    ]
}
```
**Pre-built policy templates**
- Administrator
- Power user: (Same as admin, except user/group management are not allowed)
- Read only access: Only view AWS resources 

**Role** is something that another entity can "assume", and in doing so acquires the specific permissions defined by the role.

An EC2 instance can only have ONE role attached at a time

**IAM Security Token Service (STS)** allows you to create temporary security credentials that grant trusted users access to AWS resources.
This temporary credentials are for short-term use, and can be active for a few minutes to several hours.

- Security Token
- Access Key ID
- Secret Access Key

**API Access Keys** are required to make programmatic calls to AWS from the:
- AWS Command Line Interface (CLI)
- Tools for Windows PowerShell
- AWS SDKs
- Direct HTTP calls using the APIs for individual AWS services

## 3. Virtual Private Cloud <a name="VPC"></a>

**Amazon Virtual Private Cloud (Amazon VPC)** enables launching Amazon Web Services 9AWS) resources into a virtual network that you've defined. This virtual network closely resembles a traditional network that you'd operate in your own datacenter, with the benefits of using the scalable infrastructure of AWS

**VPC Limits:**
- 5 VPC per region
- 5 Internet Gateways (GTW) per region
- 50 customer gateways per region
- 50 VPN connections per region
- 200 route tables per region / 50 entries per route table
- 5 elastic IP addresses
- 500 security groups per VPC
- 50 rules per security group
- 5 security groups per network interface

**Internet Gateway**
- Is a *VPC* component that allows communication between instances in VPC and the Internet
- Is a horizontally scaled, redundant and highly available
- It imposes no availability risks or bandwidth constrains on network traffic
- Provides NAT translation for instances that have a public IP addresses assigned

A **Route Table** contains a set of rules, called routes, that are used to determine where network traffic is directed

When you create a *VPC*, it spans all of the *Availability Zones* in the region. After creating a VPC, you can add one or more **Subnets** in each Availability Zone. Each **Subnet** must reside entirely within one Availability Zone and cannot span zones.

- **Public Subnets** have access to Internet (attached to IGW)
- **Private Subnets** don't have access to Internet

**Network Access Control Lists**
- ACL's operate at the network/subnet level
- They support *allow* and *deny* rules for traffic traveling into or out of subnet
- They are stateless: so return traffic must be allowed through an outbound rule

## !!! Important
- NACLs are responsible for subnets
- NACL rules support *ALLOW/DENY* rules
- Security Groups are responsible for instances
- SG rules support only *ALLOW* rules