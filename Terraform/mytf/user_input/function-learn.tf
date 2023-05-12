output "printListUsingJoin"{
    value ="${upper(
        join("-->",var.users))}"
}