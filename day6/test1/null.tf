resource "null_resource "cluster" {
  provisioner "file" {
    source      = "user-data.sh"
    destination = "/tmp/user-data.sh"
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("LaptopKey.pem")
    host        = element(aws_instance.public-server.*.public_ip, count.index)
  }
 }
}