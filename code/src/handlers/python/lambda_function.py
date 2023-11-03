import boto3
import json


def lambda_handler(event, context):
    print("Lambda Function Name: ", context.function_name)
    print("Event is: ", event)
    event_body = json.loads(event['body'])
    number1 = event_body["number1"]
    number2 = event_body["number2"]

    result = number1 + number2

    print("Sum:", result)

    return {
      "statusCode": 200,
      "body": json.dumps({ 'result': result })
    }