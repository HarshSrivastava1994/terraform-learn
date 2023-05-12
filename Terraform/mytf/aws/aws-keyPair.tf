#create ssh-key

#ssh-keygen -t rsa
resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}.id_rsa.pub")
}

output "keyName" {
  value = aws_key_pair.key-tf.key_name
}

