APP := $(shell basename $(shell git remote get-url origin))
REGISTRY := otrokovanton
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux 
TARGETARCH=arm64
linux:
	${MAKE} build TARGETOS=linux TARGETARCH=${TARGETARCH}

macos:
	${MAKE} build TARGETOS=darwin TARGETARCH=${TARGETARCH}

windows:
	${MAKE} build TARGETOS=windows TARGETARCH=${TARGETARCH}

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
	docker rmi ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

