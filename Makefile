APP := $(shell basename $(shell git remote get-url origin))
REGISTRY := ghcr.io/otrokov
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux
TARGETARCH =amd64
IMAGE := ghcr.io/otrokov/kbot:${VERSION}-${TARGETOS}-${TARGETARCH}
NAME := KBOT

format:
	gofmt -s -w ./


lint:
	golint

test:
	go test -v
get:
	go get


build: format
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH}	go build -v -o kbot -ldflags "-X="github.com/otrokov/kbot/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGETARCH}
push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGETARCH}



clean:
	rm -rf kbot
	docker rmi ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGETARCH}

