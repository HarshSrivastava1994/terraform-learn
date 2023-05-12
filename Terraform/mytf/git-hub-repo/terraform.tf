provider "github" {
  token = ""
}

resource "github_repository" "terraform-first-repo" {
  name        = "FirstRepoFromTerraform"
  description = "repo 19 april 2023 from terraform"
  visibility  = "public"
  auto_init   = true
}

output "terraform-first-repo-url" {
  value = github_repository.terraform-first-repo.html_url
}

//terraform plan (read configuration file from project and do the task)

//terraform plan --var-file <file_name>(we are using different tfvars file)

//terraform providers

//terraform init(intializing provider plugins)

//terraform apply(apply and creat the tfstate file)

//tfstate file(get the information of the resource)

//terraform destroy

//let two resource are created and we want to delete only one of them ??
//answer --terraform destroy --target <resource_type>.<name of the label>

//terraform validate(check configuration is valid or not)

//terrafrom refresh(refresh to latest state)

//terraform console

//terraform fmt

//terraform taint <resource_name> <name>
//first destroy existing one and recreate it again


//terraform workspace list
//terraform workspace new dev
//terraform workspace show
//terraform workspace select dev



