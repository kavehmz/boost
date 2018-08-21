.PHONY: $(shell ls -d *)

default:
	@echo "Usage: make [command]"

build:
	docker build -t drive .

run:
	docker run --rm --name drive -ti -v /opt/gdrive/kavehmz/:/gdrive drive --

pull:
	docker run --rm --name drive -ti -v /opt/gdrive/kavehmz/:/gdrive drive -- pull -hidden -desktop-links=false

pull-no-del:
	docker run --rm --name drive -ti -v /opt/gdrive/kavehmz/:/gdrive drive -- pull -hidden -desktop-links=false -exclude-ops "delete"

push:
	docker run --rm --name drive -ti -v /opt/gdrive/kavehmz/:/gdrive drive -- push -hidden

push-no-del:
	docker run --rm --name drive -ti -v /opt/gdrive/kavehmz/:/gdrive drive -- push -hidden -exclude-ops "delete"