# Tasks

create instance
ssh-key(firstKey)
assign ssh-key to newly created instance
create a security group
assign that group to instance

terraform plan (read configuration file from project and do the task)
terraform providers
terraform init(intializing provider plugins)
terraform apply(apply and creat the tfstate file)
tfstate file(get the information of the resource)
terraform destroy

let two resource are created and we want to delete only one of them ??
answer --terraform destroy --target <resource_type>.<name of the label>

terraform validate(check configuration is valid or not)
terrafrom refresh(refresh to latest state)
terraform console
terraform fmt

terraform taint <resource_name> <name>
first destroy existing one and recreate it again

terraform graph | dot -Tpdf > graph.pdf

terraform backends 

terraform init -migrate-state