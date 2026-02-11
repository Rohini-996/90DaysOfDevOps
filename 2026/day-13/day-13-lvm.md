##  Today’s task is to understand and implement LVM in Linux.

## Task 1: Check Current Storage
- First, I checked the existing disk structure to understand available devices.
- lsblk 
 <img width="965" height="366" alt="Task 1" src="https://github.com/user-attachments/assets/d6075708-4e48-4e02-b7ea-96806e28c8f4" />
 
## Task 2: Create Physical Volume
- Next, I converted the raw disks into Physical Volumes so that LVM can manage them.
- pvcreate /dev/nvme1n1 /dev/nvme2n1
- pvs

<img width="702" height="162" alt="Task 2" src="https://github.com/user-attachments/assets/c408d82a-5799-4e75-a350-ee244f397b87" />

## Task 3: Create Volume Group
- After creating physical volumes, I combined them into a single Volume Group.
```
vgcreate tws_vg /dev/nvme1n1 /dev/nvme2n1
vgs
```
<img width="622" height="116" alt="Task 3" src="https://github.com/user-attachments/assets/6ae73c75-4450-40a9-98ab-2dbb3456a617" />

- Task 4: Create Logical Volume
- Now that volume group is ready, I created a Logical Volume from it.
```
lvcreate -L 500M -n tws_lv tws_vg
lvs
```
<img width="1102" height="115" alt="Task 4" src="https://github.com/user-attachments/assets/fbf7a4d3-132c-490f-b596-301c38405835" />

- Task 5: Format and Mount
- After creating the logical volume, I formatted it with a filesystem and mounted it to make it usable.
```
 mkdir /mnt/tws_lv_mount
 mkfs.ext4 /dev/tws_vg/tws_lv
 mount /dev/tws_vg/tws_lv /mnt/tws_lv_mount
 df -h /mnt/tws_lv_mount/
```
 <img width="913" height="102" alt="Task 5" src="https://github.com/user-attachments/assets/5b9838ec-c405-4c21-8551-3c2dfd453e2a" />

- Task 6: Extend the Volume
- Next, I extend the volume using lvextend
- One of the biggest advantages of LVM is the ability to extend storage easily.
- This command increased the size of the logical volume by 200MB without deleting or recreating it.
```
 lvextend -L +200M /dev/tws_vg/tws_lv
```
 <img width="1335" height="106" alt="Task 6" src="https://github.com/user-attachments/assets/65762364-37a2-42ec-9c76-13a0bcba8a6f" />

🔹 What I Learned Today
1. I understood how LVM organizes storage step by step, from Physical Volume (PV) to Volume Group (VG) to Logical Volume (LV).
2. I learned how to format and mount a logical volume so it can be used just like a normal disk.
3. I practiced extending storage without deleting anything, which shows how flexible LVM really is.
 



