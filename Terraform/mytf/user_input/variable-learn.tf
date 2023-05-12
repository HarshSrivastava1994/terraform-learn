variable "userNameDefault"{
    type=string
    default ="world"
}

variable "userNameAge"{
    type=number
}

//["harsh","aman"]
variable "users"{
    type =list
}


output "printFirst"{
    value ="First user is ${var.users[0]}"
}

output "printNameDefault"{
    value ="Hello,${var.userNameDefault} your age is ${var.userNameAge}"
}




//types of vairable

//string,number,list,object,map,tuple,boolean