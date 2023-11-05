export const handler = async (event, context) => {
  console.log("Lambda Function Name: ", context.functionName);
  console.log("Event is: ", event);
  const body =
    typeof event["body"] === "string"
      ? JSON.parse(event["body"])
      : event["body"];
  const number1 = body["number1"];
  const number2 = body["number2"];

  const result = number1 + number2;

  console.log("Sum:", result);

  return {
    statusCode: 200,
    body: {
      message: "response lambda node!!!",
      result,
      // context,
    },
  };
};
