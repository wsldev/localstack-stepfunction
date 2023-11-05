module "lambda_node" {
  source           = "./modules/lambda"
  function_name    = "nodeFunction"
  code_path        = "code/src/handlers/node"
  LAMBDA_MOUNT_CWD = var.LAMBDA_MOUNT_CWD
}

# module "lambda_python" {
#   source           = "./modules/lambda"
#   function_name    = "pythonFunction"
#   code_path        = "code/src/handlers/python"
#   runtime          = "python3.11"
#   handler          = "lambda_function.lambda_handler"
#   LAMBDA_MOUNT_CWD = var.LAMBDA_MOUNT_CWD
# }

# module "lambda_golang" {
#   source           = "./modules/lambda"
#   function_name    = "golangFunction"
#   code_path        = "code/src/handlers/golang"
#   runtime          = "go1.x"
#   handler          = "main"
#   LAMBDA_MOUNT_CWD = var.LAMBDA_MOUNT_CWD
# }

module "sfn_localstack" {
  source   = "./modules/sfepfunction"
  sfn_name = "localstackStepFunction"
}

module "api_gateway" {
  source = "./modules/apigateway"
}
