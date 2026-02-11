## Today I practiced core networking concepts and real troubleshooting commands.
## Mini Task: Port Probe & Interpret

1. Listening Port Identified:
Answer: SSH is listening on port 22 (ss -tulpn shows sshd on 0.0.0.0:22)

2. Test from Same Machine:
Answer: - nc -zv localhost 22

3. One-Line Conclusion:
Answer:  Port 22 is reachable, SSH service is running properly.
      : If it was not reachable, next check: systemctl status ssh and firewall rules (sudo ufw status or iptables -L).

## Networking Commands 
```
ubuntu@ip-172-31-22-111:~$ traceroute google.com
traceroute to google.com (142.250.189.110), 30 hops max, 60 byte packets
 1  240.1.220.15 (240.1.220.15)  8.299 ms 240.1.220.13 (240.1.220.13)  8.213 ms 240.1.220.15 (240.1.220.15)  8.789 ms
 2  242.4.179.193 (242.4.179.193)  8.525 ms 242.4.179.69 (242.4.179.69)  8.393 ms 242.4.178.193 (242.4.178.193)  8.506 ms
 3  * * *
 4  151.148.9.135 (151.148.9.135)  7.841 ms  7.902 ms *
 5  * * *
 6  142.251.60.6 (142.251.60.6)  8.863 ms 209.85.247.116 (209.85.247.116)  8.790 ms 216.239.47.86 (216.239.47.86)  8.750 ms
 7  142.251.60.21 (142.251.60.21)  8.913 ms 192.178.105.216 (192.178.105.216)  8.077 ms 142.251.254.44 (142.251.254.44)  9.789 ms
 8  142.251.233.221 (142.251.233.221)  8.219 ms atl26s29-in-f14.1e100.net (142.250.189.110)  7.835 ms  7.813 ms
```
```
ubuntu@ip-172-31-22-111:~$ traceroute google.com
traceroute to google.com (142.250.189.110), 30 hops max, 60 byte packets
 1  240.1.220.15 (240.1.220.15)  8.299 ms 240.1.220.13 (240.1.220.13)  8.213 ms 240.1.220.15 (240.1.220.15)  8.789 ms
 2  242.4.179.193 (242.4.179.193)  8.525 ms 242.4.179.69 (242.4.179.69)  8.393 ms 242.4.178.193 (242.4.178.193)  8.506 ms
 3  * * *
 4  151.148.9.135 (151.148.9.135)  7.841 ms  7.902 ms *
 5  * * *
 6  142.251.60.6 (142.251.60.6)  8.863 ms 209.85.247.116 (209.85.247.116)  8.790 ms 216.239.47.86 (216.239.47.86)  8.750 ms
 7  142.251.60.21 (142.251.60.21)  8.913 ms 192.178.105.216 (192.178.105.216)  8.077 ms 142.251.254.44 (142.251.254.44)  9.789 ms
 8  142.251.233.221 (142.251.233.221)  8.219 ms atl26s29-in-f14.1e100.net (142.250.189.110)  7.835 ms  7.813 ms
```
```
ubuntu@ip-172-31-22-111:~$ dig google.com

; <<>> DiG 9.18.39-0ubuntu0.24.04.2-Ubuntu <<>> google.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 11702
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;google.com.                    IN      A

;; ANSWER SECTION:
google.com.             90      IN      A       142.250.189.110

;; Query time: 1 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Wed Feb 11 11:12:33 UTC 2026
;; MSG SIZE  rcvd: 55
```

