data "aws_secretsmanager_secret" "secret" {
  name = "roboshop/all"
}

data "aws_secretsmanager_secret_version" "secret" {
  secret_id = data.aws_secretsmanager_secret.secret.id
}

data "terraform_remote_state" "main" {
  backend = "s3"
  config = {
    bucket = "terraform-rk01"
    key    = "terraform/mutable/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_instances" "main" {
  instance_tags = {
    Name = "${var.COMPONENT}-${var.ENV}"
  }

  instance_state_names = ["running"]
}