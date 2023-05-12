variable "age"{
    type =number
}

output "printAge"{
    value ="Hello ,your age is ${var.age}"
}

//if want to read from env-variable ,
//then set TF_VAR_age=25