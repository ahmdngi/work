##### AWX Managment:
* run `docker ps` > check the awx machine which is `bd9eda4fb191`
* run `docker exec -t -i bd9eda4fb191 bash`
* run `awx-manage --version`  <details><summary>Click to expand</summary>
https://docs.ansible.com/ansible-tower/latest/html/administration/tower-manage.html#id1
 </details>
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


---------------------
##### Notes:
* you can make new tokens via axw-manage as well 
##### ref
* https://www.unixarena.com/2018/12/awx-ansible-tower-inventory-bulk-hosts-import.html/
-------------------------------------------------------------------






* https://medium.com/@claudio.domingos/ansible-awx-from-scratch-to-rest-api-part-3-of-8-3adcf539031f
* 
* https://github.com/ansible/awx/issues/3599
* https://docs.ansible.com/ansible-tower/latest/html/administration/oauth2_token_auth.html#application-using-password-grant-type
* https://docs.ansible.com/ansible-tower/latest/html/administration/oauth2_token_auth.html#ag-use-oauth-pat
* https://stackoverflow.com/questions/3044315/how-to-set-the-authorization-header-using-curl
----------------------------------------------
##### AWX Trigger
* since we don't have an embedded trigger like GitLab we will rely on the API commands to execute the jobs via bash script
* first we will generate a token (oAuth2) for a user then we will recall this token in the script as the Authentication method 






###### token
to generate the token: <details><summary>ref</summary>
https://docs.ansible.com/ansible-tower/latest/html/towerapi/api_ref.html#/Authentication/Authentication_tokens_create_0
</details>



```
HTTP 201 Created
Allow: GET, POST, HEAD, OPTIONS
Content-Type: application/json
Location: /api/v2/tokens/1/
Vary: Accept
X-API-Node: awx_1
X-API-Product-Name: AWX
X-API-Product-Version: 20.0.2.dev0+g4c9d028a35.d20220317
X-API-Query-Count: 7
X-API-Query-Time: 0.030s
X-API-Time: 0.067s

{
    "id": 1,
    "type": "o_auth2_access_token",
    "url": "/api/v2/tokens/1/",
    "related": {
        "user": "/api/v2/users/4/",
        "activity_stream": "/api/v2/tokens/1/activity_stream/"
    },
    "summary_fields": {curl -H "Authorization: Bearer MGIFfJff9TZNXVQd2xRXg7RqvW47nv" -H "Content-Type: application/json" -k -X POST https://193.40.156.72:8043/api/v2/job_templates/10/launch/
    },
    "created": "2022-06-20T13:00:15.867772Z",
    "modified": "2022-06-20T13:00:15.875140Z",
    "description": "",
    "user": 4,
    "token": "MGIFfJff9TZNXVQd2xRXg7RqvW47nv",
    "refresh_token": null,
    "application": null,
    "expires": "3021-10-21T13:00:15.865046Z",
    "scope": "write"
}
```


##### bash script
* make a new bash file 
* add the following command: <details><summary>Click to expand</summary>
`curl -H "Authorization: Bearer MGIFfJff9TZNXVQd2xRXg7RqvW47nv" -H "Content-Type: application/json" -k -X POST https://193.40.156.72:8043/api/v2/job_templates/10/launch/`
</details>
