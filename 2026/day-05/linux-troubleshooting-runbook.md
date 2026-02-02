Today is Day-05 of #90DaysOfDevOpsChallenge 

Today's task is all about real troubleshooting in production enviorments 

I have to write a mini runbook explaining a service called nginx real errors how you face it 
how do you solve it.

1. Target service / process

- Service: nginx 
. Why nginx?: Common production web server; CPU, memory, network, and logs are easy to correlate

2. Snapshot: CPU & Memory
```
top - 10:58:57 up 31 min,  1 user,  load average: 0.53, 0.85, 0.83
Tasks: 139 total,   1 running, 138 sleeping,   0 stopped,   0 zombie
%Cpu(s):  1.8 us,  2.0 sy,  0.0 ni, 95.5 id,  0.1 wa,  0.0 hi,  0.5 si,  0.0 st
MiB Mem :   3600.8 total,     83.9 free,   2892.0 used,    826.4 buff/cache
MiB Swap:   1024.0 total,    323.1 free,    700.9 used.    708.8 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3357 root      20   0 1453440 221252  30500 S   7.6   6.0   2:25.28 kube-apiserver
   3373 root      20   0   11.2g  53140  16076 S   5.6   1.4   1:28.29 etcd
```

3. Snapshot: Disk & IO
```
  Filesystem      Size  Used Avail Use% Mounted on
none            1.8G     0  1.8G   0% /usr/lib/modules/5.15.167.4-microsoft-standard-WSL2
none            1.8G  4.0K  1.8G   1% /mnt/wsl
drivers         242G  171G   71G  71% /usr/lib/wsl/drivers
/dev/sdc       1007G   36G  920G   4% /
none            1.8G   84K  1.8G   1% /mnt/wslg
none            1.8G     0  1.8G   0% /usr/lib/wsl/lib
````

4. Snapshot: Network
```
ubuntu@LAPTOP-6F2K1CME:/tmp/runbook-demo$ netstat -tulpn
(No info could be read for "-p": geteuid()=1000 but you should be root.)
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 127.0.0.1:33149         0.0.0.0:*               LISTEN      -
tcp        0      0 127.0.0.1:27017         0.0.0.0:*               LISTEN      -
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      -
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      -
```
. You can clearly see here my port 80 which uses nginx is already binded 
. I have solved it by killing the port 80 which used by another process 
- Command = sudo lsof -i :80

4. journalctl -u nginx -n 10 && Logs reviewed 
```
ubuntu@LAPTOP-6F2K1CME:/tmp/runbook-demo$ journalctl -u nginx -n 50
Jan 18 09:12:39 LAPTOP-6F2K1CME systemd[1]: Starting nginx.service - A high performance web server and a reverse proxy >
Jan 18 09:12:40 LAPTOP-6F2K1CME systemd[1]: Started nginx.service - A high performance web server and a reverse proxy s>
-- Boot e117584ff66441df97f173806dee4589 --
Jan 19 08:14:30 LAPTOP-6F2K1CME systemd[1]: Starting nginx.service - A high performance web server and a reverse proxy >
Jan 19 08:14:42 LAPTOP-6F2K1CME systemd[1]: Started nginx.service - A high performance web server and a reverse proxy s>
-- Boot cb82a796efba44ce8821d59d4f142857 --
Jan 19 10:03:48 LAPTOP-6F2K1CME systemd[1]: Starting nginx.service - A high performance web server and a reverse proxy >
Jan 19 10:04:00 LAPTOP-6F2K1CME systemd[1]: Started nginx.service - A high performance web server and a reverse proxy s>
```
5. Quick findings
 - You just have to see whether port 80 is already allocated or not

6. If this worsens (next steps)
```
1. Confirm repeated port conflict
Command= sudo ss -ltnp 'sport = :80'
Command= sudo lsof -i :80
Check if the same process keeps reclaiming port 80.
Identify if systemd or another service is auto-restarting it.


2. Validate configuration before restart
sudo nginx -t
Ensure no duplicate listen 80; entries or conflicting server blocks.

3. Check for competing services
sudo systemctl list-units --type=service | grep -E 'apache|httpd|docker'
docker ps
Stop or reconfigure any service also binding to port 80.

4. Change port temporarily
listen 8080;
sudo nginx -t && sudo nginx -s reload
Restore service availability while root cause is investigated.
