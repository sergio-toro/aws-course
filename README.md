# aws-course

This repository has the Terraform code for the AWS Technical Essentials.


## AWS Technical Essentials

This Terraform code creates all the resources required by the project "AWS Technical Essentials Project – Server Monitoring"

### Deploying the resources

- Rename the file `./technical-essentials/terraform.tfvars.template` to `./technical-essentials/terraform.tfvars`
- Provide all the values needed
  - Make sure you choose a region that t3.micro is on free tier
  - You need to create a manual user for terraform and generate an AWS Access key
- Set working directory `cd ./technical-essentials`
- Run `terraform init`
- Run `terraform plan -out=tfplan`
- Run `terraform apply tfplan`


## AWS Solutions Architect Wordpress

This Terraform code creates all the resources required by the project "Set Up and Monitor a WordPress Instance for Your Organization"

### Deploying the resources

- Rename the file `./solutions-architect/wordpress/terraform.tfvars.template` to `./solutions-architect/wordpress/terraform.tfvars`
- Provide all the values needed
  - Make sure you choose a region that t3.micro is on free tier
  - You need to create a manual user for terraform and generate an AWS Access key
- Set working directory `cd ./solutions-architect/wordpress`
- Run `terraform init`
- Run `terraform plan -out=tfplan`
- Run `terraform apply tfplan`

### Cleanup

- Run `terraform plan -out=tfplan -destroy`
- Run `terraform apply tfplan`



## AWS Solutions Architect Kinesis DynamoDB

This Terraform code creates all the resources required by the project "Infrastructure Deployment for Real-time Data Management Requirements on the AWS Cloud"

### Deploying the resources

- Rename the file `./solutions-architect/kinesis-dynamodb/terraform.tfvars.template` to `./solutions-architect/kinesis-dynamodb/terraform.tfvars`
- Provide all the values needed
  - You need to create a manual user for terraform and generate an AWS Access key
- Set working directory `cd ./solutions-architect/kinesis-dynamodb`
- Run `terraform init`
- Run `terraform plan -out=tfplan`
- Run `terraform apply tfplan`

### Cleanup

- Run `terraform plan -out=tfplan -destroy`
- Run `terraform apply tfplan`
