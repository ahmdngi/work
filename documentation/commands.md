##### Network
- `ping -c 5 www.google.com`  to know if the host is active or not
- `traceroute www.google.com`  more details of each step until u reach the host           
netstat -r

- `netstat -rn|column -t` get the network status with better view

- `ip a` ip list

- `watch "arp -an"` make u watch the arp/cache table in real time

- `tcpdump -i wlp4s0 -n`    gives network monitor to this interface -i is for the interface name

- `netstat -platun`gives a lists of programs and its ports

- `ps axuwwwwf | gerp -3 1100` search the active process by port (1100) 



-----
##### System
* `find / -iname "shim.efi"` >> this will search the entire machine for the file and give the location of needed file

- `rpm -ql syslinux` >> gets all the files related to this package

- `grep -R wakeup *` >>> runs a search in the current directory in all the folders and files

- `sudo su -` enter sudo Mode >>> hen `echo "ubuntu ALL=(ALL) NOPASSWD=ALL">/etc/sudoers.d/ubuntu` to give permission to "ubuntu" user


-----
##### Git commands
1. `git fetch` to get the latest updates from remote
2. `git pull` apply the latest changes from remote
3. `git commit` -am to add all changes from local
4. `git push` to push changes from local

5. `git add .` > to add the current directory from local to git
6. `git status` to check for changes
7. `git diff` origin/master to see changes 

-------------------------------------------
slurm:
1. enter interactive session  `srun --partition=gray-ib -t 05:00:00 --pty bash`



----
##### Ansible Links
- .gitlab-ci.yml keyword reference >> https://docs.gitlab.com/ee/ci/yaml/

- Ansible Modules >>  https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html#plugins-in-ansible-builtin

---------------------------------------------------
 - https://docs.ansible.com/ansible/latest/collections/community/general/ipmi_power_module.html
 - https://docs.ansible.com/ansible/latest/collections/community/general/wakeonlan_module.html
 - https://docs.ansible.com/ansible/latest/collections/ansible/builtin/wait_for_connection_module.html#wait-for-connection-waits-until-remote-system-is-reachable-usable
