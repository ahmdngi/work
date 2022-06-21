#### Local SETUP
1. git clone from gitlab
2. go to the dir > training-hpc/inventory then open hosts.yaml 
		<details><summary>Click to expand</summary>
 to make a new child (overhaul)  with the same syntax heirarchy
 and ensure that ansible host is for one of the servers
</details>
       
3. go to dir > training-hpc/group-vars/  and make a new folder (overhaul)
4. copy vars from /training-hpc/group-vars/hpcvnodes to /training-hpc/group-vars/overhaul
5. make a new txt file name "vault-passowrd.txt" in /training-hpc/ ---- password is aquried from rainer(only the password shall be written in the txt)
6. for ssh connection i sent my pub key to rainer and he gave me access

8. to run ansible > go to /training-hpc/ and write the command
		/training-hpc/`ansible overhaul -m ping`
9. Default command >>  ansible <host> [-m module_name] [-a args] [options]
 
10. Default playbook command >> ansible-playbook <playbook.yml>
---------------------------------
##### Notes:
1. to ssh jump > `ssh -J centos@training.hpc.taltech.ee centos@192.168.42.33` 
2. add config file to .ssh/ for easier navigation
```
#first option for the proxy jump is to define them and then use it in under the proxy jump parameter
Host gw gateway
HostName hpc-gw.hpc.taltech.ee
User root

Host hpc3 base
HostName base.hpc.taltech.ee
User ahnasr

Host runner gl-runner gitlab-runner
Hostname 10.10.101.11
ProxyJump base
User root

Host dns
HostName 10.10.101.3
Proxyjump base
User root

Host dhcp pxe
HostName 10.10.101.6
ProxyJump gw
User root


#second option is to specify the username and location in the proxyjump
Host  compute1
Hostname 192.168.42.13
Proxyjump centos@training.hpc.taltech.ee
User centos

Host overhaul compute2
Hostname 192.168.42.33
Proxyjump centos@training.hpc.taltech.ee
User centos

Host  compute3
Hostname 192.168.42.30
Proxyjump centos@training.hpc.taltech.ee
User centos


Host  headnode
Hostname 192.168.42.23
Proxyjump centos@training.hpc.taltech.ee
User centos

#or we can simply
#Host headnode
#Hostname training.hpc.taltech.ee
#User centos
```
 
--------------------------------------------------
##### Ref:
 https://techviewleo.com/ansible-check-if-software-package-is-installed/
 https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html#plugins-in-ansible-builtin
