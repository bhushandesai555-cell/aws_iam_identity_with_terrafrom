# Create AWS Organization with your existing accounts
resource "aws_organizations_organization" "main" {
  aws_service_access_principals = [
    "sso.amazonaws.com",
    "cloudtrail.amazonaws.com"
  ]
  feature_set = "ALL"
}

# Enable AWS SSO
resource "aws_ssoadmin_instance" "main" {}

# Create Permission Sets
resource "aws_ssoadmin_permission_set" "developer" {
  name             = "DeveloperAccess"
  description      = "Read-only access for developers"
  instance_arn     = aws_ssoadmin_instance.main.arn
  session_duration = "PT8H"
}

resource "aws_ssoadmin_permission_set" "devops" {
  name             = "DevOpsAccess"
  description      = "Full access for DevOps engineers"
  instance_arn     = aws_ssoadmin_instance.main.arn
  session_duration = "PT8H"
}

resource "aws_ssoadmin_permission_set" "solution_architect" {
  name             = "SolutionArchitectAccess"
  description      = "Full access for solution architect"
  instance_arn     = aws_ssoadmin_instance.main.arn
  session_duration = "PT8H"
}

resource "aws_ssoadmin_permission_set" "project_manager" {
  name             = "ProjectManagerAccess"
  description      = "Read-only + billing access for PM"
  instance_arn     = aws_ssoadmin_instance.main.arn
  session_duration = "PT8H"
}