# azure-kubernetes-service
terraform code(module format) to set up kubernetes cluster on azure

**What is azure AKS service ?**

Azure Kubernetes Service (AKS) manages your hosted Kubernetes environment, making it quick and easy to deploy and manage containerized applications without container orchestration expertise. 

**Why AKS ?**

It eliminates the burden of ongoing operations and maintenance by provisioning, upgrading, and scaling resources on demand, without taking your applications offline.

**How to Run the Terraform script ?**
1. go to dev folder and download all terraform plug-in.
```
   $terraform init
```
2. Verify the resources that will be created and create a plan.
   terraform plan -out plan.out
3. apply the above created plan and setup the infrastructure for the AKS 
   terraform apply "plan.out"
