{
  "Version": "2012-10-17",
  "Id": "key-default-1",
  "Statement": [
    {
      "Sid": "Enable EBS User Permissions",
      "Effect": "Allow",
      "Principal": {"AWS": "arn:aws:iam::${account_id}:root"},
      "Action": "kms:*",
      "Resource": "*"
    },
    {
      "Sid": "Allow attachment of persistent resources",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
            "arn:aws:iam::${account_id}:role/z5x_infra_jenkins",
            "arn:aws:iam::${account_id}:role/z5x_jenkins",
            "arn:aws:iam::${account_id}:role/JenkinsSlaveRole",
            "arn:aws:iam::${account_id}:role/z5x_iam_role_devops_engineer"
        ]
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
