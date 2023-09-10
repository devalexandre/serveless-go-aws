.PHONY: build clean deploy

build:
	go get ./...
	go mod vendor
	env GOARCH=amd64 GOOS=linux go build -v -ldflags '-d -s -w' -a -tags netgo -installsuffix netgo -o bin/app cmd/main.go

clean:
	rm -rf ./bin ./vendor

deploy: clean build
	sls deploy --verbose
