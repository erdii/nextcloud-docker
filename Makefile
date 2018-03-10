VERSION := $(shell jq -r '.version' deploy.json)
REGISTRY := $(shell jq -r '.registry' deploy.json)
REPO := $(shell jq -r '.repo' deploy.json)
BUILD_PATH := .build


.PHONY: build
build:
	sudo docker build . \
		--force-rm \
		-t $(REPO):latest \
		-t $(REPO):$(VERSION) \
		-t $(REGISTRY)/$(REPO):$(VERSION)

.PHONY: push
push:
	sudo docker push $(REGISTRY)/$(REPO):$(VERSION)
