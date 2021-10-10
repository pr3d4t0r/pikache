# (c) Copyright 2021 Eugene Ciurana
# License:  https://raw.githubusercontent.com/pr3d4t0r/pikache/master/LICENSE

# vim: set fileencoding=utf-8:


SHELL=/bin/bash


DOCKER_IMAGE=pr3d4t0r/pikache
DOCKER_VERSION=3.1.1
DOCKER_INSTANCE=pikache_devpi

include build.mk

clean: ALWAYS
	rm -Rf ./devpi ./repository
	docker rm -f "$(DOCKER_INSTANCE)" || true
	docker rmi -f $(shell docker images | awk '/pikache/ { print($$3); exit(0); }') || true

ALWAYS:

