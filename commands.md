* `find / -iname "shim.efi"` >> this will search the entire machine for the file and give the location of needed file

- `rpm -ql syslinux` >> gets all the files related to this package

- `grep -R wakeup *` >>> runs a search in the current directory in all the folders and files



#### Git commands
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





#### Ansible Links
- .gitlab-ci.yml keyword reference >> https://docs.gitlab.com/ee/ci/yaml/

- Ansible Modules >>  https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html#plugins-in-ansible-builtin

---------------------------------------------------
 - https://docs.ansible.com/ansible/latest/collections/community/general/ipmi_power_module.html
 - https://docs.ansible.com/ansible/latest/collections/community/general/wakeonlan_module.html
 - https://docs.ansible.com/ansible/latest/collections/ansible/builtin/wait_for_connection_module.html#wait-for-connection-waits-until-remote-system-is-reachable-usable
