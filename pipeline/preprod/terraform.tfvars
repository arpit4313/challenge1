account_id     = "********612"
name           = "test"
environment    = "preprod"
region         = "ap-south-1"
vpc_id         = "testvpc"
threshold_high = "80"
threshold_low  = "20"
target_type    = "instance"
instana_agent_key = "Fb5WxFMZSb6mECURLEEffw"
instana_agent_url = "https://serverless-blue-saas.instana.io"
instana_timeout   = "2000"
tags = {
  TechnicalOwner = "devops"
  Application    = "test"
  Environment    = "preprod"
  Tier           = "3"
  BusinessUnit   = "test"
  Created_using  = "TF"
}
