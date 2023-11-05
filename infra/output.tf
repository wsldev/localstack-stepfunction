locals {
  modules = {
    node: module.lambda_node
    python: module.lambda_python
    # golang: module.lambda_golang
    sfn: module.sfn_localstack
    gateway: module.api_gateway
  }
}

output "resources_output" {
  value = [for i in local.modules: i ]
}

