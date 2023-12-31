.PHONY: clean build run

APP_NAME = mqttbackend
BUILD_DIR = $(PWD)/bin
clean:
	rm -rf $(BUILD_DIR)

build: 
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o $(BUILD_DIR)/$(APP_NAME) main.go

build-mac: 
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -ldflags="-w -s" -o $(BUILD_DIR)/$(APP_NAME) main.go

build-mx_mac: 
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -ldflags="-w -s" -o $(BUILD_DIR)/$(APP_NAME) main.go

run: 
	$(BUILD_DIR)/$(APP_NAME)