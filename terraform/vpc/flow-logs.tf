resource "aws_flow_log" "services" {
  iam_role_arn    = aws_iam_role.flow_logs_allow.arn
  log_destination = aws_cloudwatch_log_group.vpc_flow_logs.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.main.id
}

resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name_prefix       = "${aws_vpc.main.tags_all.Name}-flow-logs"
  retention_in_days = 7
}

data "aws_iam_policy_document" "service_flow_logs" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "flow_logs_allow" {
  name               = "${aws_vpc.main.tags_all.Name}-allow-flow-logs"
  assume_role_policy = data.aws_iam_policy_document.service_flow_logs.json
}

data "aws_iam_policy_document" "allow_logging" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "example" {
  name   = "allow-logging"
  role   = aws_iam_role.flow_logs_allow.name
  policy = data.aws_iam_policy_document.allow_logging.json
}