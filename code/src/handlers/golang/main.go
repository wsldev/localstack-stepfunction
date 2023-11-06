package main

import (
	"encoding/json"
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

type Payload struct {
	Body RequestBody
}

type RequestBody struct {
	FirstName string `json:"firstName"`
	Number1   int    `json:"number1"`
	Number2   int    `json:"number2"`
}

type Response struct {
	StatusCode int               `json:"statusCode,omitempty"`
	Headers    map[string]string `json:"headers,omitempty"`
	Body       ResponseBody      `json:"body,omitempty"`
}

type ResponseBody struct {
	Message string `json:"message"`
	Result  int    `json:"result"`
}

func HandleRequest(request map[string]interface{}) (Response, error) {
	var payload Payload

	jsonStr, err := json.Marshal(request)
	if err != nil {
		fmt.Println(err)
	}

	if err := json.Unmarshal(jsonStr, &payload); err != nil {
		fmt.Println(err)
	}

	sum := soma(payload.Body.Number1, payload.Body.Number2)

	msg := fmt.Sprintf("Hello %s !!!!", payload.Body.FirstName)

	lambdaResponse := ResponseBody{
		Message: msg,
		Result:  sum,
	}

	response := Response{
		StatusCode: 200,
		Body:       lambdaResponse,
	}

	return response, nil
}

func main() {
	lambda.Start(HandleRequest)
}

func soma(number1, number2 int) int {
	return number1 + number2
}
