format:make
	gofmt -s -w ./



build: 
	go build -v -o kbot -ldflags "-X="github.com/otrokov/kbot/cmd.appVersion=v1.0.5

