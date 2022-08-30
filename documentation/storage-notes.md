Important acronyms 
- NAS: network attached storage.
- SAN: storage area network.
- DAS: direct attached storage. 
- NFS: network file system.
- GPFS: general parallel file system
- JBOD: just bunch of disks
- SMB: server message block. <details><summary>more</summary>is a client-server interaction protocol where clients request a file, and the server provides it to the client. It is now a  Windows-based network that gives users to create, modify and delete the shared files, folders, printers within the network.</details>
- S3: Amazon simple storage service <details><summary>more</summary>i(is an object storage service offering industry-leading scalability, data availability, security, and performance.</details>
- CES: Cluster Export Services
- NTFS: new technology file system and it is being used in windows 
- RAID: redundant array of independant disks
       <details><summary>**RAID TYPES**</summary>
    - RAID 0: striping just spread into two seperate disks
    - RAID 1: mirroring & duplicating data into 2 disks
    - RAID 5: striping with parity (3 or more disks) if we have 4 disks you can only use 3 disks and 1 will be for parity only.can handle single disk failure.r
    - RAID 6: parity is spread twice in all disks. should be able to handle double disks failure.
    - RAID 10 (0+1): 0 for striping data and 1 for duplicating it (only 50% of actual storage).
    - more is [here](https://www.youtube.com/watch?v=U-OCdTeZLac) and [here](https://www.youtube.com/watch?v=UuUgfCvt9-Q).
    - 5 vs 6: both have the same read speed however the write speed is lower in RAID 6 since it has to write 2 parities across all the disks.</details>
    - backup types:
      - full: all data is backed up.
      - incremental: only backs up the data change since the last incremental or full backup.
      - differential: data that has been changed since the last full backup.
---
GPFS: [guide](https://www.ibm.com/docs/en/gpfs/4.1.0.4?topic=SSFKCN_4.1.0.4/gpfs4104_content.html)
- failure groups
- HPC uses lenovo DSS-G (Distributed Storage Solution for IBM Spectrum Scale)
- DSS-G operated through xCAT(Extreme Cloud Admin Toolkit) to do the following:
   - setup DSS-G nodes, client nodes, DSS-G commands
- commands [here](https://www.ibm.com/docs/en/gpfs/4.1.0.4?topic=reference-gpfs-commands)


SSH squence
nas machines : base > hpc > nas-0
ocean: xcat > ocean1 
---
###### **Good Videos**
   - [file systems](https://www.youtube.com/watch?v=KN8YgJnShPM)
   -
