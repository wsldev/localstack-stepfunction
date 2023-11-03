export const handler = async (event, context) => {
  console.log("Lambda Function Name: ", context.function_name);
  console.log("Event is: ", event);
  const event_body = JSON.parse(event["body"]);
  const number1 = event_body["number1"];
  const number2 = event_body["number2"];

  const result = number1 + number2;

  console.log("Sum:", result);

  return {
    statusCode: 200,
    body: JSON.stringify({ result: result }),
  };
};
