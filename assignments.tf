# Assign Developers to Dev Account
resource "aws_ssoadmin_account_assignment" "developers_dev" {
  instance_arn       = aws_ssoadmin_instance.main.arn
  permission_set_arn = aws_ssoadmin_permission_set.developer.arn
  principal_id       = aws_identitystore_group.developers.group_id
  principal_type     = "GROUP"
  target_id          = var.dev_account_id  # YOUR dev account
  target_type        = "AWS_ACCOUNT"
}

# Assign DevOps to Both Accounts
resource "aws_ssoadmin_account_assignment" "devops_dev" {
  instance_arn       = aws_ssoadmin_instance.main.arn
  permission_set_arn = aws_ssoadmin_permission_set.devops.arn
  principal_id       = aws_identitystore_group.devops_engineers.group_id
  principal_type     = "GROUP"
  target_id          = var.dev_account_id  # YOUR dev account
  target_type        = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "devops_prod" {
  instance_arn       = aws_ssoadmin_instance.main.arn
  permission_set_arn = aws_ssoadmin_permission_set.devops.arn
  principal_id       = aws_identitystore_group.devops_engineers.group_id
  principal_type     = "GROUP"
  target_id          = var.prod_account_id  # YOUR prod account
  target_type        = "AWS_ACCOUNT"
}

# Assign Solution Architect to Prod Account
resource "aws_ssoadmin_account_assignment" "architect_prod" {
  instance_arn       = aws_ssoadmin_instance.main.arn
  permission_set_arn = aws_ssoadmin_permission_set.solution_architect.arn
  principal_id       = aws_identitystore_group.solution_architects.group_id
  principal_type     = "GROUP"
  target_id          = var.prod_account_id  # YOUR prod account
  target_type        = "AWS_ACCOUNT"
}

# Assign Project Manager to Prod Account  
resource "aws_ssoadmin_account_assignment" "pm_prod" {
  instance_arn       = aws_ssoadmin_instance.main.arn
  permission_set_arn = aws_ssoadmin_permission_set.project_manager.arn
  principal_id       = aws_identitystore_group.project_managers.group_id
  principal_type     = "GROUP"
  target_id          = var.prod_account_id  # YOUR prod account
  target_type        = "AWS_ACCOUNT"
}