//Shared credentials file may vary for different
provider "aws" {
  profile                 = "phone-project"
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
}