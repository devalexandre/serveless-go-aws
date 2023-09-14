.PHONY: build clean deploy 

build:
	go get ./...
	go mod vendor
	env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o bootstrap -tags lambda.norpc cmd/main.go

clean:
	rm -rf ./bin ./vendor

deploy: clean build 
	sls deploy --verbose --aws-profile itelite

