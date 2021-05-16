resource "aws_instance" "application_server" {
  ami             = var.ami_id # TODO: Bake our own AMI and use that
  instance_type   = "t2.micro"
  key_name        = var.key_pair_name
  user_data       = file("../../ec2/ws/userdata.sh")
  iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
  security_groups = ["${aws_security_group.application_server_ec2_instance.name}"]

  tags = {
    Description = "Application server"
  }
}

resource "aws_instance" "pose_recognition_server" {
  ami             = var.ami_id # TODO: Bake our own AMI and use that
  instance_type   = "t2.micro" # TODO: This will have to use a GPU instance type
  key_name        = var.key_pair_name
  user_data       = file("../../ec2/pose-recognition/userdata.sh")
  iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
  security_groups = ["${aws_security_group.application_server_ec2_instance.name}"]

  tags = {
    Description = "Pose recognition server"
  }
}

output "app_ip_public_addr" {
  value       = "${aws_instance.application_server.public_ip}"
  description = "The public ip address of the application instance"
}

output "app_ip_private_addr" {
  value       = "${aws_instance.application_server.private_ip}"
  description = "The private ip address of the application instance"
}

output "pose_recognition_ip_public_addr" {
  value       = "${aws_instance.pose_recognition_server.public_ip}"
  description = "The public ip address of the pose recognition instance"
}

output "pose_recognition_ip_private_addr" {
  value       = "${aws_instance.pose_recognition_server.private_ip}"
  description = "The private ip address of the pose recognition instance"
}
