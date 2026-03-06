provider "aws" {
  region = "us-east-2"
  shared_credentials_files = ["/workspaces/workspace2/awsfolder/access_code.sh"]
}