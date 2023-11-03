locals {
  modules = {
    # node: module.lambda_node
    # python: module.lambda_python
    golang: module.lambda_golang
    # sfn: module.api_gateway
  }
}

output "lambdas_output" {
  value = [for i in local.modules: i ]
}

