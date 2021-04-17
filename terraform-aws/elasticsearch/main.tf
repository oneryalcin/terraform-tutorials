# --- elastcisearch/main.tf ---

//ElasticSearch Access Policy
resource "aws_iam_policy" "es_access_policy" {
  name        = "es_access_policy_name"
  path        = "/"
  description = "ElasticSearch Access Policy"

  policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Effect = "Allow",
          Principal = {
            AWS = [
              var.search_ro_user_arn,
              var.glue_jobs_arn
            ]
          },
          Action = "es:*",
          Resource = "arn:aws:es:eu-west-1:858554011301:domain/*"
        }
      ]
    })
}


resource "aws_iam_role" "GlueRoleTest" {
  name = "Glue-test-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Effect = "Allow",
        Sid = ""
      }
    ]
  })
}