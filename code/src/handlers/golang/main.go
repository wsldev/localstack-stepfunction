package main

import (
	"context"
	"encoding/json"
	"fmt"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

type Person struct {
	FirstName *string `json:"firstName"`
	LastName  *string `json:"lastName"`
	Numero1   *int    `json:"numero1"`
	Numero2   *int    `json:"numero2"`
}

type ResponseBody struct {
	Message *string `json:"message"`
	Result  int     `json:"result"`
}

func HandleRequest(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	var person Person

	err := json.Unmarshal([]byte(request.Body), &person)
	if err != nil {
		return events.APIGatewayProxyResponse{}, err
	}

	msg := fmt.Sprintf("Hello %v %v!!!!", *person.FirstName, *person.LastName)

	responseBody := ResponseBody{
		Message: &msg,
		Result:  soma(*person.Numero1, *person.Numero2),
	}

	jbytes, _ := json.Marshal(responseBody)

	jstr := string(jbytes)

	response := events.APIGatewayProxyResponse{
		StatusCode: 200,
		Body:       jstr,
	}

	return response, nil
}

func main() {
	lambda.Start(HandleRequest)
}

func soma(number1, number2 int) int {
	return number1 + number2
}
