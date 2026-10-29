.
├── azure-tree.txt
├── environments
│   ├── account.hcl
│   ├── customers
│   │   ├── UOT
│   │   │   ├── key-vault
│   │   │   │   └── terragrunt.hcl
│   │   │   ├── networking
│   │   │   │   ├── subnet
│   │   │   │   │   ├── gateway-subnet
│   │   │   │   │   │   └── terragrunt.hcl
│   │   │   │   │   └── vm-subnet
│   │   │   │   │       └── terragrunt.hcl
│   │   │   │   ├── virtual-network
│   │   │   │   │   └── terragrunt.hcl
│   │   │   │   └── vpn-network-gateway
│   │   │   │       └── terragrunt.hcl
│   │   │   ├── region.hcl
│   │   │   ├── resource-group
│   │   │   │   └── terragrunt.hcl
│   │   │   └── virtual-machine
│   │   │       └── windows
│   │   │           └── terragrunt.hcl
│   │   └── env.hcl
│   ├── development
│   │   ├── env.hcl
│   │   └── israel
│   │       ├── app-service
│   │       │   ├── api
│   │       │   │   └── terragrunt.hcl
│   │       │   ├── auth
│   │       │   │   └── terragrunt.hcl
│   │       │   ├── backoffice
│   │       │   │   └── terragrunt.hcl
│   │       │   ├── backoffice-api
│   │       │   │   └── terragrunt.hcl
│   │       │   ├── cron
│   │       │   │   └── terragrunt.hcl
│   │       │   ├── email
│   │       │   │   └── terragrunt.hcl
│   │       │   ├── incidents-api
│   │       │   │   └── terragrunt.hcl
│   │       │   ├── portal
│   │       │   │   └── terragrunt.hcl
│   │       │   ├── portal-api
│   │       │   │   └── terragrunt.hcl
│   │       │   ├── reports
│   │       │   │   └── terragrunt.hcl
│   │       │   ├── signal
│   │       │   │   └── terragrunt.hcl
│   │       │   ├── storage
│   │       │   │   └── terragrunt.hcl
│   │       │   └── ui
│   │       │       └── terragrunt.hcl
│   │       ├── app-service-plan
│   │       │   └── 01
│   │       │       └── terragrunt.hcl
│   │       ├── key-vault
│   │       │   └── terragrunt.hcl
│   │       ├── log-analytics-workspace
│   │       │   └── terragrunt.hcl
│   │       ├── mssql
│   │       │   ├── octopus
│   │       │   │   └── terragrunt.hcl
│   │       │   └── server
│   │       │       └── terragrunt.hcl
│   │       ├── networking
│   │       │   ├── subnet
│   │       │   │   ├── apps-subnet
│   │       │   │   │   └── terragrunt.hcl
│   │       │   │   └── vm-subnet
│   │       │   │       └── terragrunt.hcl
│   │       │   └── virtual-network
│   │       │       └── terragrunt.hcl
│   │       ├── region.hcl
│   │       └── resource-group
│   │           └── terragrunt.hcl
│   ├── devops
│   │   ├── canada
│   │   │   ├── key-vault
│   │   │   │   └── terragrunt.hcl
│   │   │   ├── region.hcl
│   │   │   ├── resource-group
│   │   │   │   └── terragrunt.hcl
│   │   │   └── storage-account
│   │   │       └── terragrunt.hcl
│   │   └── env.hcl
│   ├── internal
│   │   ├── env.hcl
│   │   └── israel
│   │       ├── app-service
│   │       │   ├── helpdesk
│   │       │   │   └── terragrunt.hcl
│   │       │   └── it
│   │       │       └── terragrunt.hcl
│   │       ├── app-service-plan
│   │       │   └── terragrunt.hcl
│   │       ├── identity
│   │       │   └── mysql
│   │       │       └── terragrunt.hcl
│   │       ├── key-vault
│   │       │   └── terragrunt.hcl
│   │       ├── mysql
│   │       │   └── terragrunt.hcl
│   │       ├── networking
│   │       │   ├── subnet
│   │       │   │   ├── aadds-subnet
│   │       │   │   │   └── terragrunt.hcl
│   │       │   │   ├── apps-subnet
│   │       │   │   │   └── terragrunt.hcl
│   │       │   │   └── vm-subnet
│   │       │   │       └── terragrunt.hcl
│   │       │   └── virtual-network
│   │       │       └── terragrunt.hcl
│   │       ├── private-dns-zone
│   │       │   └── mysql
│   │       │       └── terragrunt.hcl
│   │       ├── region.hcl
│   │       └── resource-group
│   │           └── terragrunt.hcl
│   └── production
│       ├── env.hcl
│       ├── europe
│       │   ├── networking
│       │   │   ├── peering
│       │   │   │   └── usa
│       │   │   │       └── terragrunt.hcl
│       │   │   ├── subnet
│       │   │   │   └── vm-subnet
│       │   │   │       └── terragrunt.hcl
│       │   │   └── virtual-network
│       │   │       └── terragrunt.hcl
│       │   ├── region.hcl
│       │   └── resource-group
│       │       └── terragrunt.hcl
│       ├── global
│       │   ├── iam-groups
│       │   │   └── admin
│       │   │       └── terragrunt.hcl
│       │   └── region.hcl
│       ├── israel
│       │   ├── app-service
│       │   │   ├── integration-axxon
│       │   │   │   └── terragrunt.hcl
│       │   │   └── oref
│       │   │       └── terragrunt.hcl
│       │   ├── app-service-plan
│       │   │   └── terragrunt.hcl
│       │   ├── networking
│       │   │   ├── peering
│       │   │   │   └── usa
│       │   │   │       └── terragrunt.hcl
│       │   │   ├── subnet
│       │   │   │   └── apps-subnet
│       │   │   │       └── terragrunt.hcl
│       │   │   └── virtual-network
│       │   │       └── terragrunt.hcl
│       │   ├── region.hcl
│       │   └── resource-group
│       │       └── terragrunt.hcl
│       └── usa
│           ├── app-service
│           │   ├── api
│           │   │   └── terragrunt.hcl
│           │   ├── auth
│           │   │   └── terragrunt.hcl
│           │   ├── backoffice
│           │   │   ├── cloudflare.sh
│           │   │   └── terragrunt.hcl
│           │   ├── backoffice-api
│           │   │   └── terragrunt.hcl
│           │   ├── connect-api
│           │   │   ├── cloudflare.sh
│           │   │   └── terragrunt.hcl
│           │   ├── cron
│           │   │   └── terragrunt.hcl
│           │   ├── events-api
│           │   │   └── terragrunt.hcl
│           │   ├── external-api
│           │   │   └── terragrunt.hcl
│           │   ├── feeds-api
│           │   │   └── terragrunt.hcl
│           │   ├── geolocate-api
│           │   │   └── terragrunt.hcl
│           │   ├── incidents-api
│           │   │   └── terragrunt.hcl
│           │   ├── kiosk-api
│           │   │   └── terragrunt.hcl
│           │   ├── mobile-api
│           │   │   └── terragrunt.hcl
│           │   ├── notify
│           │   │   ├── cloudflare.sh
│           │   │   └── terragrunt.hcl
│           │   ├── portal-api
│           │   │   └── terragrunt.hcl
│           │   ├── portal-ui
│           │   │   ├── cloudflare.sh
│           │   │   └── terragrunt.hcl
│           │   ├── reports
│           │   │   └── terragrunt.hcl
│           │   ├── signal
│           │   │   ├── cloudflare.sh
│           │   │   └── terragrunt.hcl
│           │   ├── storage
│           │   │   └── terragrunt.hcl
│           │   └── ui
│           │       ├── cloudflare.sh
│           │       └── terragrunt.hcl
│           ├── app-service-plan
│           │   ├── 01
│           │   │   └── terragrunt.hcl
│           │   └── 02
│           │       └── terragrunt.hcl
│           ├── communication-services
│           │   └── terragrunt.hcl
│           ├── database
│           │   └── pgsql
│           │       └── octopus
│           │           └── terragrunt.hcl
│           ├── function-app
│           │   └── triggers
│           │       └── terragrunt.hcl
│           ├── key-vault
│           │   └── terragrunt.hcl
│           ├── kubernetes
│           │   ├── 01
│           │   │   └── terragrunt.hcl
│           │   └── 02
│           │       └── terragrunt.hcl
│           ├── log-analytics-workspace
│           │   └── terragrunt.hcl
│           ├── networking
│           │   ├── nat-gateway
│           │   │   └── terragrunt.hcl
│           │   ├── peering
│           │   │   ├── europe
│           │   │   │   └── terragrunt.hcl
│           │   │   └── israel
│           │   │       └── terragrunt.hcl
│           │   ├── public-ip-prefix
│           │   │   └── terragrunt.hcl
│           │   ├── subnet
│           │   │   ├── apps-nat-subnet
│           │   │   │   └── terragrunt.hcl
│           │   │   ├── apps-subnet
│           │   │   │   └── terragrunt.hcl
│           │   │   ├── k8s-subnet
│           │   │   │   └── terragrunt.hcl
│           │   │   └── vm-subnet
│           │   │       └── terragrunt.hcl
│           │   └── virtual-network
│           │       └── terragrunt.hcl
│           ├── redis
│           │   └── 01
│           │       └── terragrunt.hcl
│           ├── region.hcl
│           ├── resource-group
│           │   └── terragrunt.hcl
│           ├── storage-account
│           │   └── terragrunt.hcl
│           ├── user-assigned-identity
│           │   └── pgsql-octopus
│           │       └── terragrunt.hcl
│           └── virtual-machine
│               └── terragrunt.hcl
├── modules
│   ├── app-service
│   │   ├── linux
│   │   │   ├── main.tf
│   │   │   └── variables.tf
│   │   └── windows
│   │       ├── main.tf
│   │       └── variables.tf
│   ├── app-service-plan
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── communication-services
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── database
│   │   ├── mssql
│   │   │   ├── database
│   │   │   │   ├── main.tf
│   │   │   │   └── variables.tf
│   │   │   └── server
│   │   │       ├── main.tf
│   │   │       ├── outputs.tf
│   │   │       └── variables.tf
│   │   ├── mysql
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── pgsql
│   │       ├── main.tf
│   │       └── variables.tf
│   ├── entra-id
│   │   └── group
│   │       ├── main.tf
│   │       └── variables.tf
│   ├── function-app
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── key-vault
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── kubernetes
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── log-analytics-workspace
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── logic-app
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── networking
│   │   ├── nat-gateway
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── peering
│   │   │   ├── main.tf
│   │   │   └── variables.tf
│   │   ├── public-ip-prefix
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── subnet
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── virtual-network
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── vpn-network-gateway
│   │       ├── main.tf
│   │       └── variables.tf
│   ├── private-dns-zone
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── redis
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── resource-group
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── storage-account
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── user-assigned-identity
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── virtual-machine
│       └── windows
│           ├── main.tf
│           ├── outputs.tf
│           └── variables.tf
└── root.hcl

178 directories, 186 files
