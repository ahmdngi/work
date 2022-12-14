### installation Guide

docker: [HERE](https://github.com/ansible/awx/blob/devel/tools/docker-compose/README.md)

k8s: [HERE](https://gist.github.com/dmccuk/93db22e9b30d1963b8fca0de96fc82f0)
- http://193.40.156.245/30242 
- user: ahnasr pass: ahnasr 

note: k8s awx will add a layer of complexity which we don't need it in our current setup

### Upgrade Guide:
- we will use awx CLI Guide [HERE](https://docs.ansible.com/ansible-tower/latest/html/towercli/examples.html)
- check version `awx --version` 
- upgrade docker-compose `pip install docker-compose`
- install/Upgrade awxkit > `pip3 install awxkit`
- add credentials > 
    - `export TOWER_HOST=https://193.40.156.72:8043`     
    - `export TOWER_USERNAME=ahnasr`
    - `export TOWER_PASSWORD=ahnasr`
    - you also add token > `export TOWER_OAUTH_TOKEN=H0g2eQ7GnzTP0ZPubwymqiAjSfzn0I`
    - more on Authentication [HERE](https://docs.ansible.com/ansible-tower/latest/html/towercli/authentication.html#authentication)
- Check data by `awx config`
- export all to a json file assets.json `awx export > assets.json`
- stop all the current docker containers `docker stop $(docker ps -q)` (if u want to start `docker start $(docker ps -n 6 -q)`)
- remove all containers and images `docker image rm -f ***imagename***`
- remove tmp file `rm -rf /tmp/awx*`
- make new folder for awx installation `mkdir new_awx`
- run command `git clone https://github.com/ansible/awx.git`
- go inside awx folder `make docker-compose-build`
- run command `make docker-compose`
- **UI:** go inside awx1 container `docker exec -it tools_awx_1` and run `make clean-ui ui-devel`
- inside awx1 run `TARGET='https://awx.local:8043' npm --prefix awx/ui start`
- for UI Guide [HERE](https://github.com/ansible/awx/blob/devel/tools/docker-compose/README.md)
- run `awx import -k < assets.json`
        


--------
### The awx-manage Utility: 
can be used for several operations (new tokens) read about it [HERE](urlhttps://docs.ansible.com/ansible-tower/latest/html/administration/tower-manage.html#id1)

To add **multiple hosts** [HERE](https://www.unixarena.com/2018/12/awx-ansible-tower-inventory-bulk-hosts-import.html/#:~:text=Add%20Multiple%20hosts%20in%20AWX,ansible%20clients%20in%20few%20minutes)

* run `docker ps` > check the awx machine which is `bd9eda4fb191`
* run `docker exec -t -i bd9eda4fb191 bash`
* run `awx-manage --version`  
    
* `vim hosts_add` and add all the hosts u want 
      <details><summary>Click to expand</summary>
    #just add all the ip u want
    192.168.3.152
    192.168.3.153
    192.168.3.154
    192.168.3.155
    192.168.3.156
    192.168.3.157
    192.168.3.158
    192.168.3.159
     </details>

* make a new inventory in AWX UI( Linux_UA_Hosts) and use the name in the next step.
* run  `awx-manage inventory_import --inventory-name Linux_UA_Hosts --source hosts_add`


---
### AWX Trigger
* since we don't have an embedded trigger like GitLab we will rely on the API commands to execute the jobs via bash script
* first we will generate a token (oAuth2) for a user then we will recall this token in the script as the Authentication method 


###### 1. Token Generation:
to generate the token and other API options: [HERE](https://docs.ansible.com/ansible-tower/latest/html/towerapi/api_ref.html#/Authentication/Authentication_tokens_create_0) 

1. go to https://193.40.156.72:8043/api/v2/tokens/
2. use POST button below and you will get the response below with the token >>> save it 

###### 2. Bash Script: 
* make a new bash file 
* add the following command: 
   - `#!/bin/bash 
    curl -H "Authorization: Bearer MGIFfJff9TZNXVQd2xRXg7RqvW47nv" -H "Content-Type: application/json" -k -X POST https://193.40.156.72:8043/api/v2/job_templates/10/launch/`

* syntax [HERE](https://docs.ansible.com/ansible-tower/latest/html/administration/oauth2_token_auth.html#ag-use-oauth-pat)

###### 3. WakeUp Trigger:

we will create a new service on wakeup which will run the script to activate the job_templates

1. `cd /etc/slurm/scripts/` on the trageted node

2. `touch wakeup.sh` then write and keep in mind the job reference number (in this case > 10):

    `curl -H "Authorization: Bearer MGIFfJff9TZNXVQd2xRXg7RqvW47nv" -H "Content-Type: application/json" -k -X POST https://193.40.156.72:8043/api/v2/job_templates/10/launch/`

    
3. `cd /etc/systemd/system`

4. `touch wakeup.service` and then write

```
[Unit]
Description=Wakeup script for triggering update pipeline
After=network.target
After=network-online.target

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/slurm/scripts/wakeup.sh

[Install]
WantedBy=multi-user.target
```
5. - `sudo systemctl daemon-reload`
   - `sudo systemctl enable wakeup-service`
   - [Ref](https://unix.stackexchange.com/questions/57852/how-do-i-start-a-cron-job-1-min-after-reboot)



-----------------------------
###### Ref 

* How API works [HERE](https://medium.com/@claudio.domingos/ansible-awx-from-scratch-to-rest-api-part-3-of-8-3adcf539031f)
* to use username and password as Authentication for triggers [HERE](https://stackoverflow.com/questions/3044315/how-to-set-the-authorization-header-using-curl)

* we will use awx CLI Guide [HERE](https://docs.ansible.com/ansible-tower/latest/html/towercli/examples.html)

* awx CLI reference [Here](https://docs.ansible.com/ansible-tower/latest/html/towercli/reference.html#awx-export)

*  more on Authentication [HERE](https://docs.ansible.com/ansible-tower/latest/html/towercli/authentication.html#authentication)
* for UI Guide [HERE](https://github.com/ansible/awx/blob/devel/tools/docker-compose/README.md)
* can be used for several operations (new tokens) read about it [HERE](https://docs.ansible.com/ansible-tower/latest/html/administration/tower-manage.html#id1)

* To add **multiple hosts** [HERE](https://www.unixarena.com/2018/12/awx-ansible-tower-inventory-bulk-hosts-import.html/#:~:text=Add%20Multiple%20hosts%20in%20AWX,ansible%20clients%20in%20few%20minutes)

* to generate the token and other API options: [HERE](https://docs.ansible.com/ansible-tower/latest/html/towerapi/api_ref.html#/Authentication/Authentication_tokens_create_0) 
