variable "userName"{

}

output "printName"{
    //value =var.userName
    value ="Hello,${var.userName}"
}

//terraform plan -var "userName=Harsh"

//terraform plan -var "userName=Harsh" -var "age=20"