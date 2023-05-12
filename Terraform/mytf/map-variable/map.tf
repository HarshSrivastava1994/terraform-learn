output "userAge"{

    value ="My name is ${var.userName} and my age is ${lookup(var.userAge,var.userName)}"
}

//terraform plan -var "userAge={"harsh":25,"aman":20}"