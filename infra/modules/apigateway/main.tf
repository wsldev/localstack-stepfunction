data "template_file" step_api_swagger{
  template = "${file("${path.module}/OpenForAPIGateway.yml")}"
}

resource "aws_api_gateway_rest_api" "api-gateway-sfn" {
  name = "StepFuncAPI"
  description = "API to access step functions workflow"
  body = "${data.template_file.step_api_swagger.rendered}"
}

resource "aws_api_gateway_deployment" "sfn-api-gateway-deployment" {
  rest_api_id = "${aws_api_gateway_rest_api.api-gateway-sfn.id}"
  stage_name  = "dev"
}

output "api_gateway_sfn_url" {
  value = "http://localhost:4566/restapis/${aws_api_gateway_rest_api.api-gateway-sfn.id}/${aws_api_gateway_deployment.sfn-api-gateway-deployment.id}/_user_request_/startStepFunctions/"
}