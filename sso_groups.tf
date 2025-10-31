# Create SSO Groups
resource "aws_identitystore_group" "developers" {
  identity_store_id = tolist(aws_ssoadmin_instance.main.identity_store_ids)[0]
  display_name      = "Developers"
  description       = "Group for 5 developers"
}

resource "aws_identitystore_group" "devops_engineers" {
  identity_store_id = tolist(aws_ssoadmin_instance.main.identity_store_ids)[0]
  display_name      = "DevOpsEngineers"
  description       = "Group for 2 DevOps engineers"
}

resource "aws_identitystore_group" "solution_architects" {
  identity_store_id = tolist(aws_ssoadmin_instance.main.identity_store_ids)[0]
  display_name      = "SolutionArchitects"
  description       = "Group for solution architect"
}

resource "aws_identitystore_group" "project_managers" {
  identity_store_id = tolist(aws_ssoadmin_instance.main.identity_store_ids)[0]
  display_name      = "ProjectManagers"
  description       = "Group for project manager"
}