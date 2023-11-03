awslocal=aws.exe --endpoint-url=http://localhost:4566

build:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o main main.go

zip:
	zip main.zip bin/main

deploy:
	$(awslocal) lambda create-function --function-name ExampleFunctionOne \
    --runtime go1.x --handler main \
    --role arn:aws:iam::123456789012:role/service-role/my-lambda-role \
    --zip-file fileb://myFunction.zip

deployhot:
	$(awslocal) lambda create-function
		--function-name ExampleFunctionOne \
    --code S3Bucket="hot-reload",S3Key="${PWD}/code/src/handlers/golang" \
    --runtime go1.x --handler main \
    --role arn:aws:iam::123456789012:role/service-role/my-lambda-role \

update:
	$(awslocal) lambda update-function-code \
		--function-name ExampleFunctionOne \
    --zip-file fileb://myFunction.zip

invoke: build
	$(awslocal) lambda invoke \
    --function-name ExampleFunctionOne \
    --payload '{ "name": "Bill" }' \
    /dev/stdout

delete:
	$(awslocal) lambda delete-function \
    --function-name ExampleFunctionOne

list:
	$(awslocal) lambda list-functions

create-url:
	$(awslocal) lambda create-function-url-config \
    --function-name ExampleFunctionOne \
		--auth-type "NONE" \

get-url:
	$(awslocal) lambda get-function-url-config \
    --function-name ExampleFunctionOne

nodemon:
	@npx nodemon --watch . -e go,js --exec make build
