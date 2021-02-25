VERSION = "20.0.7-apache"
REPO = "erdii/nextcloud"
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
