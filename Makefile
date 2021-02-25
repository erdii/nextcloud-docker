VERSION = 20.0.7-apache
REPO = quay.io/erdii/nextcloud
BUILD_PATH := .build

.PHONY: all
all: | build push

.PHONY: build
build:
	docker build . \
		--force-rm \
		--build-arg VERSION="$(VERSION)" \
		-t $(REPO):latest \
		-t $(REPO):$(VERSION)

.PHONY: push
push:
	docker push $(REPO):$(VERSION)
