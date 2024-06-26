data "local_file" "keyfile" {
    filename = "${path.module}/ssh-key/ec2_rsa.pub"
}