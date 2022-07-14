Openstack Diagram
- Presentation [HERE](https://slideplayer.com/slide/16571787/)
- Redhat Openstack Platform RHOSP
- [Installation Guide](https://docs.openstack.org/install-guide/index.html)
- latest guide for yoga [HERE](https://docs.openstack.org/yoga/admin/)

![](https://docs.openstack.org/arch-design/_images/osog_0001.png)
![Conceptual Architecture](https://docs.openstack.org/install-guide/_images/openstack_kilo_conceptual_arch.png)
![Logical Architecture](https://docs.openstack.org/install-guide/_images/openstack-arch-kilo-logical-v1.png)
![](https://object-storage-ca-ymq-1.vexxhost.net/swift/v1/6e4619c416ff4bd19e1c087f27a43eea/www-assets-prod/openstack-map/openstack-map-v20210201.svg)



**OVERVIEW**
OpenStack provides an Infrastructure-as-a-Service (IaaS) solution through a variety of complementary services. Each service offers an Application Programming Interface (API) that facilitates this integration.

**OpenStack Services:** 
An OpenStack deployment contains a number of components providing APIs to access infrastructure resources. This page lists the various services that can be deployed to provide such resources to cloud end users.

**Openstack Components**

|**OpenStack Services**| An OpenStack deployment contains a number of components providing APIs to access infrastructure resources.||
|---|---|---|
|**Compute**| ||
|NOVA| Compute Service |Core|
|ZUN|Containers Service|
|**Hardware Lifecycle**|
|IRONIC| Bare Metal Provisioning Service|
|CYBORG| Lifecycle management of accelerators|
|**Storage**|
|SWIFT|Object store|Core|
|CINDER|Block Storage|
|MANILA|Shared filesystems|
|**Networking**|
|NEUTRON|Networking|Core|
|OCTAVIA|Load balancer
|DESIGNATE|DNS service
|**Shared Services**
|KEYSTONE|Identity service|Core|
|PLACEMENT|Placement service
|GLANCE|Image service
|BARBICAN|Key management|Core|
|**Orchestration**
|HEAT|Orchestration|Core|
|SENLIN|Clustering service
|MISTRAL|Workflow service
|ZAQAR|Messaging Service
|BLAZAR|Resource reservation service
|AODH|Alarming Service
|**Workload Provisioning**|
|MAGNUM|Container Orchestration Engine Provisioning
|SAHARA|Big Data Processing Framework Provisioning
|TROVE|Database as a Service|
|**Application Lifecycle**|
|MASAKARI|Instances High Availability Service
|MURANO|Application Catalog
|SOLUM|Software Development Lifecycle Automation
|FREEZER|Backup, Restore, and Disaster Recovery
|**API Proxies**|
|EC2API|EC2 API proxy|
|**Web frontends**|
|HORIZON|Dashboard|Core|
|SKYLINE|Next generation dashboard (tech preview)|


|**Operations Tooling**|Those services deliver APIs primarily targeted to cloud admins and deployers, to help with cloud operations.||
|---|---| --- |
|**Monitoring services**|||
|CEILOMETER|Metering & Data Collection Service|Core|
|PANKO|Event, Metadata Indexing Service
|MONASCA|Monitoring
|**Resource optimization**|
|WATCHER|Optimization Service
|VITRAGE|Root Cause Analysis service
|**Billing / Business Logic**|
|ADJUTANT|Operations processes automation
|CLOUDKITTY|Billing and chargebacks
|**Testing / Benchmark**|
|RALLY|Benchmarking tool
|TEMPEST|The OpenStack Integration Test Suite
|PATROLE|The OpenStack RBAC Integration Test Suite

-------------------------------------------
## Devstack installation
1. spawn VM update and upgrade and [Instruction](https://docs.openstack.org/devstack/latest/#:~:text=DevStack%20is%20a%20series%20of,the%20OpenStack%20project's%20functional%20testing.)
2. `git clone https://opendev.org/openstack/devstack` and follow above Instruction.
3. to access the CLI you have to add ur AUTH follow [](https://docs.openstack.org/devstack/latest/configuration.html#openrc)
    - also u can download the project opensrack rc file from the UI and run it on server 

admin
ahnasr

### Some issues and solutions
1. for our VM run `sudo apt-get install --reinstall ca-certificates` since to get git to Work [REF](https://stackoverflow.com/questions/35821245/github-server-certificate-verification-failed)
2. `pip install --upgrade pip` to pip-failed-building-wheel
3. when restart -----> https://opendev.org/openstack/devstack/commit/9ba49cd82631ada84b8458b370ac535985d57725


-------------------
- [Services PDF OS 16.2](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.2/pdf/product_guide/red_hat_openstack_platform-16.2-product_guide-en-us.pdf)
- [OS 13](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/13/pdf/product_guide/red_hat_openstack_platform-13-product_guide-en-us.pdf)
- [Openstack.org](https://www.openstack.org/software/project-navigator/openstack-components#openstack-services)
