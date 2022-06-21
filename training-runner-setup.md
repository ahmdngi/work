# Setting Up New Runner for Training Repo:
##### Please note the following:
* Docker already setup and being used in the Runner machine 
* multi runners is being used ,meaning that several runners are installed in the same docker container (fbbaecc8a625).
* gitlab runner is already installed as well



###### Steps

1. Enter the container >>> `docker exec -t -i fbbaecc8a625 /bin/bash`> 
1. Run `gitlab-runner register`
1. Enter the GitLab instance URL : https://gitlab.hpc.taltech.ee/
4. provide the registeration token can be found in Gitlab Setting > CI/CD
4. Provide the runner executor >> docker
5. Then you are asked for the default image to be used for projects that do not define one in .gitlab-ci.yml 
             <details><summary>Link </summary>
        - can be found in Packages & Registeries > container registery
        - gitlab.hpc.taltech.ee:5050/hpc/training
             </details>


 
###### Change the execution image if left blank in step No 6 :
1. Run `docker exec -t -i fbbaecc8a625 /bin/bash` > fbbaecc8a625 is the container for the runner.
1. Navigate to /etc/gitlab-runner/.
1. Change the config.toml file :
         <details><summary>More Info</summary>
        1. find your runner then change the image:
        2. Example we want to change the image directory therefore we substitute the directory via sed. 
        3. Run`cat config.toml.bak | sed 's/base\/merge:latest/training/' >config.toml`.
        4. this command will substitute the "base/merge:latest" by "training".
        5. Also > sed detected / as delimiter to avoid that we used \ to skip character. 
        </details>
1. Exit the container to save.

----------------------------------------------------------------------
- .gitlab-ci.yml keyword reference >> https://docs.gitlab.com/ee/ci/yaml/

- Ansible Modules >>  https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html#plugins-in-ansible-builtin

##### Ref:
- https://docs.gitlab.com/runner/register/
- https://docs.gitlab.com/runner/commands/#configuration-file
- Comprehensive Step by Step guide: https://youtu.be/2HHYfy1pJAw

------------------------------------------------------------------------------
##### WakeUp Trigger

we will create a new service on wakeup which will run the trigger url to activate the wakeup part of the pipeline script 

1. `cd /etc/slurm/scripts/` on the trageted node

2. `touch wakeup.sh` then write:

```
#!/bin/bash
curl -X POST -F token=2c20e16b62d4cbd90e66069a39e3e4 -F "ref=master" -F "variables[hostvar]=${HOSTNAME}" https://gitlab.hpc.taltech.ee/api/v4/projects/2/trigger/pipeline
```
###### Ref https://gitlab.hpc.taltech.ee/hpc/base/-/settings/ci_cd


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
WantedBy=default.target
```
5. `cd /etc/systemd/system/default.target.wants`

6. create or copy wakeup.service with the same syntax
