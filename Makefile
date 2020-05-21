VERSION := $(shell jq -r '.version' deploy.json)
REPO := $(shell jq -r '.repo' deploy.json)
BUILD_PATH := .build

.PHONY: all
all: | build push

.PHONY: build
build:
	docker build . \
		--force-rm \
		-t $(REPO):latest \
		-t $(REPO):$(VERSION)

.PHONY: push
push:
	docker push $(REPO):$(VERSION)
