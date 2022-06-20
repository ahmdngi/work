

https://medium.com/@claudio.domingos/ansible-awx-from-scratch-to-rest-api-part-3-of-8-3adcf539031f
https://docs.ansible.com/ansible-tower/latest/html/towerapi/api_ref.html#/Authentication/Authentication_tokens_create_0
https://github.com/ansible/awx/issues/3599
https://docs.ansible.com/ansible-tower/latest/html/administration/oauth2_token_auth.html#application-using-password-grant-type
https://docs.ansible.com/ansible-tower/latest/html/administration/oauth2_token_auth.html#ag-use-oauth-pat
https://stackoverflow.com/questions/3044315/how-to-set-the-authorization-header-using-curl
----------------------------------------------
###### token


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
    "summary_fields": {
        "user": {
            "id": 4,
            "username": "ahnasr",
            "first_name": "Ahmed",
            "last_name": "Nasr"
        }
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
