Today is Day 12 of #90DaysOfDevOpsChallenge

- Today was a breather + revision day 
- Instead of learning something new, I focused on revising and reinforcing everything from Days 01–11 so the fundamentals stay strong.

- This day was all about confidence, and clarity, just like real DevOps learning should be.

. Today’s Goal
- Take a short pause to:
1. Revisit core Linux & DevOps basics
2. Rerun a few important commands
3. Identify what feels strong and what needs practice
4. Prepare for the next phase of the challenge

- What I Reviewed Today
- Mindset & Learning Plan
1. Revisited my Day 01 plan
2. Goals still feel right ✔️
3. Will focus more on hands-on practice going forward

⚙️ Processes & Services
Rerun a few important commands to check system health:
1. ps
2. systemctl status nginx
3. journalctl -u nginx
- ✔️ Observed running processes
- ✔️ Checked service status
- ✔️ Looked at recent logs

- 📁 File & Directory Skills
- Practiced quick file operations from Days 06–11:
- Commands :
```
echo "Revision Day" >> revision.txt
chmod 644 revision.txt
ls -l revision.txt
mkdir test-dir

Verified permissions using ls -l
```
```
🧾 Cheat Sheet Refresh
Top 5 commands I’d use first during an incident:
ls -l
cd
ps
systemctl status
journalctl
```
```
👤 User & Group Sanity Check

Recreated a small ownership scenario:
sudo useradd tester
sudo chown tester:tester revision.txt
ls -l revision.txt
id tester

✔️ Ownership verified
✔️ User details confirmed
```

- Mini Self-Check
```
1. Top 3 time-saving commands

ls -l → quick permission & ownership check
ps → see what’s running
systemctl status → service health

2. How to check service health

systemctl status <service>
ps aux | grep <service>
journalctl -u <service>


3. Safe permission/ownership change

chown user:group filename
chmod 644 filename


4. Focus for next 3 days

Permissions (chmod numbers)
Log reading
More real troubleshooting scenarios
```
. Key Takeaways

- Revision is as important as learning new things
- Re-running commands builds confidence

Linux basics are the backbone of DevOps

Small practice beats rushing ahead
