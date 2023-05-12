APP := $(shell basename $(shell git remote get-url origin))
REGISTRY := otrok
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux 

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v
get:
	go get

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}  --build-arg TARGETARCH=${TARGETARCH}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}


build: format
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH}	go build -v -o kbot -ldflags "-X="github.com/otrokov/kbot/cmd.appVersion=${VERSION}

clean:
	rm -rf kbot

