### Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## Tasks

## Task 1
```
1.DNS – How Names Become IPs
- Explain in 3–4 lines: what happens when you type google.com in a browser?

--> When you type google.com, your browser first asks the DNS server: “What is the IP address of this name?”
    DNS looks up the record and returns the IP address (like 142.x.x.x).
    Your browser then connects to that IP address using HTTP/HTTPS.
    Finally, the server sends back the website, and it loads in your browser.

2. What are these record types? Write one line each:
A, AAAA, CNAME, MX, NS
--> A Record - Maps a domain name to an IPv4 address (example: google.com → 142.250.x.x).
    AAAA Record - Maps a domain name to an IPv6 address.
    CNAME Record - Points one domain name to another domain name (alias).
    MX Record - Tells which mail server handles emails for the domain.
    NS Record - Specifies which DNS servers are responsible for the domain.

3. Run: dig google.com - identify the A record and TTL from the output
--> A record = ip address
    TTL(Time to Live) = 300 sec

    google.com.             300     IN      A       172.217.174.238
```
## Task 2
```
1. What is an IPv4 address? How is it structured? (e.g., 192.168.1.10)
--> An IPv4 address is a unique number given to a device in a network so it can communicate with other devices.

2. Difference between public and private IPs
--> A public IP address is a globally unique address assigned by an ISP that allows a device to communicate over the internet,
    while a private IP address is used inside local networks and cannot be accessed directly from the internet.
```
## Task 3 

```
# 🌐 Task 3: CIDR & Subnetting

## ✅ What does `/24` mean in `192.168.1.0/24`?

1. What does /24 mean in 192.168.1.0/24?
--> `/24` means 24 bits are used for the network portion of the IP address.  
     The remaining 8 bits are for host addresses.
---

2. Explain in your own words: why do we subnet?
Subnetting is used to:
- Divide a large network into smaller networks
- Reduce network traffic
- Improve security
- Use IP addresses efficiently
- Make network management easier
In simple words:  
Subnetting helps organize and control network communication better.
```
```
4. Quick exercise — fill in
    CIDR Quick Reference Table

| CIDR | Subnet Mask       | Total IPs | Usable Hosts |
|------|-------------------|-----------|--------------|
| /24  | 255.255.255.0     | 256       | 254          |
| /16  | 255.255.0.0       | 65,536    | 65,534       |
| /28  | 255.255.255.240   | 16        | 14           |

```
## Task 4 

```
1. What is a port? Why do we need them?
--> A port is a logical communication endpoint on a computer that allows different services
    or applications to run on the same IP address.

2. Document these common ports:
--> | Port  | Service        |
    |--------|---------------|
    | 22     | SSH (Secure Shell) |
    | 80     | HTTP (Web Traffic) |
    | 443    | HTTPS (Secure Web Traffic) |
    | 53     | DNS (Domain Name System) |
    | 3306   | MySQL Database |
    | 6379   | Redis |
    | 27017  | MongoDB |

```








