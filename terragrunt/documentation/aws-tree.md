.
├── aws-tree.txt
├── environments
│   ├── account.hcl
│   └── production
│       ├── env.hcl
│       └── usa
│           ├── ec2
│           │   └── corsight
│           │       └── terragrunt.hcl
│           ├── iam
│           ├── networking
│           │   ├── subnet
│           │   │   └── vm-subnet
│           │   │       └── terragrunt.hcl
│           │   └── vpc
│           │       └── terragrunt.hcl
│           ├── region.hcl
│           ├── s3
│           └── ses
├── modules
│   ├── cloudwatch
│   │   └── main.tf
│   ├── ec2
│   │   ├── data.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── eks
│   │   ├── data.tf
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   ├── iam
│   │   ├── main.tf
│   │   └── variable.tf
│   ├── networking
│   │   ├── subnet
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── vpc
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── opensearch
│   │   ├── data.tf
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   ├── rds
│   │   ├── data.tf
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   ├── resourceexplorer
│   │   ├── data.tf
│   │   └── main.tf
│   ├── s3
│   │   ├── data.tf
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   ├── sg
│   │   ├── data.tf
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   └── vpc
│       ├── data.tf
│       ├── main.tf
│       ├── output.tf
│       └── variable.tf
├── octopusapp
├── octopusapp_dev
│   ├── account.hcl
│   └── development
│       ├── env.hcl
│       └── us-east-1
│           ├── dev-01
│           │   ├── eks
│           │   │   └── terragrunt.hcl
│           │   ├── iam
│           │   │   └── terragrunt.hcl
│           │   ├── opensearch
│           │   │   └── terragrunt.hcl
│           │   ├── rds
│           │   │   └── terragrunt.hcl
│           │   ├── s3
│           │   │   └── terragrunt.hcl
│           │   ├── sg
│           │   │   └── terragrunt.hcl
│           │   └── vpc
│           │       └── terragrunt.hcl
│           └── region.hcl
├── octopusapp_devops
│   └── development
│       └── ca-central-1
│           └── s3
├── octopusapp_manage
│   └── us-east-1
└── root.hcl

44 directories, 57 files
