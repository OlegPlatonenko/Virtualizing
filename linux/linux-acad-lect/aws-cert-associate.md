# AWS Certified Solutions Architect

An **Edge Location** is an AWS datacenter which does not contain AWS services. Instead, it is used to deliver content to parts of the world.

An example would be **CloudFront** which is CDN: cached items such as a PDF file can be cached on an edge location which reduces the amount of *space/time/latency* required for a request from that part of the world.

AWS physical Structure

- Regions
    - 3-4 Availability Zones
- Edge locations

## 1. Terminology

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

