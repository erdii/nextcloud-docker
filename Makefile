VERSION := $(shell jq -r '.version' deploy.json)
REPO := $(shell jq -r '.repo' deploy.json)
BUILD_PATH := .build

.PHONY: all
all: | build push

.PHONY: build
build:
	sudo docker build . \
		--force-rm \
		-t $(REPO):latest \
		-t $(REPO):$(VERSION)

.PHONY: push
push:
	sudo docker push $(REPO):$(VERSION)
