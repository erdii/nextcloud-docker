# werise-nextcloud

* copy `deploy.sample.json` to `deploy.json` and fill in the correct values
* to build the container: `make build`
* to push the container: `make push`
* to run the container:
	```
	sudo docker run -d \
		-v /opt/nextcloud-werise/nextcloud:/var/www/html \
		-v /opt/nextcloud-werise/nextcloud_config:/var/www/html/config \
		-v /opt/nextcloud-werise/nextcloud_apps:/var/www/html/custom_apps \
		-v /opt/nextcloud-werise/nextcloud_data:/var/www/html/data \
		-p 8080:80 \
		--restart always \
		--name nextcloud \
		your-docker-repo/your-repository:version
	```
