variable "sfn_name" {
  type = string
}

data "template_file" "sfn_definition" {
  template = "${file("${path.module}/state-machine.asl.json")}"
}

resource "aws_sfn_state_machine" "example_step_function" {
  # type = "EXPRESS"
  name       = "${var.sfn_name}"
  role_arn   = aws_iam_role.sfn_role.arn
  definition = data.template_file.sfn_definition.rendered

  # logging_configuration {
  #   include_execution_data = true
  #   level = "ALL"
  #   log_destination = aws_cloudwatch_log_group.sfn_log_group.arn
  # }

  # depends_on = [ aws_cloudwatch_log_group.sfn_log_group ]
}

# resource "aws_cloudwatch_log_group" "sfn_log_group" {
#   name = "/aws/sfn/example_step_function"
# }

output "sfn_arn" {
  value = aws_sfn_state_machine.example_step_function.arn
}
