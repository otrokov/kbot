APP := $(shell basename $(shell git remote get-url origin))
REGISTRY := otrokov
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux
TARGETARCH =amd64
IMAGE := ghcr.io/otrokov/kbot:${VERSION}-${TARGETOS}-${TARGETARCH}

format:
	gofmt -s -w ./


lint:
	golint

test:
	go test -v
get:
	go get

image:
	docker build . -t ${IMAGE}
	docker push ${IMAGE}


build: format
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH}	go build -v -o kbot -ldflags "-X="github.com/otrokov/kbot/cmd.appVersion=${VERSION}

clean:
	rm -rf kbot
	docker rmi ${IMAGE}

