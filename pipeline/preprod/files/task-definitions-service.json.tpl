[
  {
    "name": "${name}",
    "image": "${account_id}.dkr.ecr.${region}.amazonaws.com/${name}:latest",
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${containerPort},
        "hostPort": ${hostPort}
      }
    ],
    "environment": [
      {
       "name": "INSTANA_AGENT_KEY",
       "value": "${instana_agent_key}"
      },
      {
       "name": "INSTANA_ENDPOINT_URL",
       "value": "${instana_agent_url}"
      },
      {
       "name": "INSTANA_TIMEOUT",
       "value": "${instana_timeout}"
      },
      {
       "name": "APP_NAME",
       "value": "preprod"
      },
      {
       "name": "CORALOGIX_LOG_URL",
       "value": "https://api.app.coralogix.in/api/v1/logs"
      },
      {
       "name": "CORALOGIX_TIME_DELTA_URL",
       "value": "https://api.app.coralogix.in/sdk/v1/time"
      },
      {
       "name": "PRIVATE_KEY",
       "value": "6ec6c6f0-339e-97b0-701a-f1cf8d033e5d"
      }
      ],
        "logConfiguration": {
          "logDriver": "awsfirelens",
          "options": {
            "privatekey": "6ec6c6f0-339e-97b0-701a-f1cf8d033e5d",
            "appname": "preprod",
            "is_json": "false",
            "@type": "coralogix",
            "subsystemname": "backend",
            "log_key_name": "log"
          }
        },
        "dependsOn": [
            {
                "containerName": "log_router",
                "condition": "START"
            }
        ]
    },
    {
        "name": "log_router",
        "image": "docker.io/coralogixrepo/fluentd-coralogix-ecs:latest",
        "firelensConfiguration": {
                "type": "fluentd",
                "options": null
              },
      "environment": [
            {
             "name": "CORALOGIX_LOG_URL",
             "value": "https://api.app.coralogix.in/api/v1/logs"
            },
            {
            "name": "CORALOGIX_TIME_DELTA_URL",
            "value": "https://api.app.coralogix.in/sdk/v1/time"
            }
      ]
    }
]
