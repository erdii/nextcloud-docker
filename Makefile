VERSION = 25.0.5-apache
REPO = ghcr.io/erdii/nextcloud

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
