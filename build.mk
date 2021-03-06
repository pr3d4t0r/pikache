# (c) Copyright 2021 Eugene Ciurana
# License:  https://raw.githubusercontent.com/pr3d4t0r/pikache/master/LICENSE

# vim: set fileencoding=utf-8:


image:
	docker build --compress --force-rm -t $(DOCKER_IMAGE):$(DOCKER_VERSION) .
	docker tag $(DOCKER_IMAGE):$(DOCKER_VERSION) $(DOCKER_IMAGE):latest


push:
	docker push $(DOCKER_IMAGE):$(DOCKER_VERSION)
	docker push $(DOCKER_IMAGE):latest

