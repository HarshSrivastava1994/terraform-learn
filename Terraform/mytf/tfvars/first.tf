variable "age"{
    type=number
}

output "printName"{
    value ="Hello ,your age is ${var.age}"
}