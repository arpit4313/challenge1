{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": ["ecs-tasks.amazonaws.com" , "ec2.amazonaws.com"]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}

