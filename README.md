# nextcloud

* version is tracked in makefile
* to build the container: `make build`
* to push the container: `make push`
* to run the container:
	```
	sudo docker run -d \
		-v /opt/nextcloud/html:/var/www/html \
		-v /opt/nextcloud/config:/var/www/html/config \
		-v /opt/nextcloud/custom_apps:/var/www/html/custom_apps \
		-v /opt/nextcloud/data:/var/www/html/data \
		-p 8080:80 \
		--restart always \
		--name nextcloud \
		your-docker-repo/your-repository:version
	```
