module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"
  # providers = {
  #   aws = aws.default
  # }

  name = local.name

  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  subnet_id                   = var.subnet_id
 # vpc_security_group_ids      = [module.security_group.security_group_id]
#  placement_group             = aws_placement_group.web.id
  associate_public_ip_address = true
  disable_api_stop            = false

#  create_iam_instance_profile = true
#  iam_role_description        = "IAM role for EC2 instance"
#  iam_role_policies = {
#    AdministratorAccess = "arn:aws:iam::aws:policy/AdministratorAccess"
#  }

  # only one of these can be enabled at a time
  hibernation = false
  # enclave_options_enabled = true

  user_data_base64            = base64encode(local.user_data)
  user_data_replace_on_change = true

  # cpu_options = {
  #   core_count       = 2
  #   threads_per_core = 1
  # }
  # enable_volume_tags = false
  # root_block_device = [
  #   {
  #     encrypted   = true
  #     volume_type = "gp3"
  #     throughput  = 200
  #     volume_size = 50
  #     tags = {
  #       Name = "my-root-block"
  #     }
  #   },
  # ]

  # ebs_block_device = [
  #   {
  #     device_name = "/dev/sdf"
  #     volume_type = "gp3"
  #     volume_size = 5
  #     throughput  = 200
  #     encrypted   = true
  #     kms_key_id  = aws_kms_key.this.arn
  #     tags = {
  #       MountPoint = "/mnt/data"
  #     }
  #   }
  # ]

  tags = local.tags
}