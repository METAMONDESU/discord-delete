BIN_DIR=bin
BIN_NAME=discord-delete
GOFLAGS=-trimpath

all: clean test build

clean:
	rm -rf $(BIN_DIR)

test:
	go test -failfast -race ./...

build: build-linux build-darwin build-windows

build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build $(GOFLAGS) -o $(BIN_DIR)/$(BIN_NAME)-linux

build-darwin:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build $(GOFLAGS) -o $(BIN_DIR)/$(BIN_NAME)-darwin

build-windows:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build $(GOFLAGS) -o $(BIN_DIR)/$(BIN_NAME)-windows.exe

.PHONY: clean test build build-linux build-darwin build-windows
