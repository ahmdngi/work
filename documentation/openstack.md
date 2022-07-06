
Openstack Diagram
- Presentation [HERE](https://slideplayer.com/slide/16571787/)
- Redhat Openstack Platform RHOSP

![](https://docs.openstack.org/arch-design/_images/osog_0001.png)




**OpenStack Services:** 
An OpenStack deployment contains a number of components providing APIs to access infrastructure resources. This page lists the various services that can be deployed to provide such resources to cloud end users.

**Openstack Components**

|**OpenStack Services**| An OpenStack deployment contains a number of components providing APIs to access infrastructure resources. This page lists the various services that can be deployed to provide such resources to cloud end users.|
|---|---|
|**Compute**| |
|NOVA| Compute Service |
|ZUN|Containers Service|
|**Hardware Lifecycle**|
|IRONIC| Bare Metal Provisioning Service|
|CYBORG| Lifecycle management of accelerators|
|**Storage**|
|SWIFT|Object store|
|CINDER|Block Storage|
|MANILA|Shared filesystems|
|**Networking**|
|NEUTRON|Networking
|OCTAVIA|Load balancer
|DESIGNATE|DNS service
|**Shared Services**
|KEYSTONE|Identity service
|PLACEMENT|Placement service
|GLANCE|Image service
|BARBICAN|Key management
|**Orchestration**
|HEAT|Orchestration||----------|--------|-------|Framework Provisioning|
|TROVE|Database as a Service|
|**Application Lifecycle**|
|MASAKARI|Instances High Availability Service
|MURANO|Application Catalog
|SOLUM|Software Development Lifecycle Automation
|FREEZER|Backup, Restore, and Disaster Recovery
|**API Proxies**|https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/13/pdf/product_guide/red_hat_openstack_platform-13-product_guide-en-us.pdf
|EC2API|EC2 API proxy|
|**Web frontends**|
|HORIZON|Dashboard|
|SKYLINE|Next generation dashboard (tech preview)|


|**Operations Tooling**|Those services deliver APIs primarily targeted to cloud admins and deployers, to help with cloud operations.|
|---|---|
|**Monitoring services**||
|CEILOMETER|Metering & Data Collection Service
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

- [Services PDF OS 16.2](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.2/pdf/product_guide/red_hat_openstack_platform-16.2-product_guide-en-us.pdf)
- [OS 13](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/13/pdf/product_guide/red_hat_openstack_platform-13-product_guide-en-us.pdf)
- [Openstack.org](https://www.openstack.org/software/project-navigator/openstack-components#openstack-services)
