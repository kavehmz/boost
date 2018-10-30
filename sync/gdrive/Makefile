.PHONY: $(shell ls -d *)

default:
	@echo "Usage: make [command]"

build:
	docker build -t kavehmz/drive .
	docker push kavehmz/drive

run:
	docker run --rm --name drive -ti -v /opt/gdrive/kavehmz/:/gdrive kavehmz/drive --

pull:
	docker run --rm --name drive -ti -v /opt/gdrive/kavehmz/:/gdrive kavehmz/drive -- pull -hidden -verbose -desktop-links=false

pull-no-del:
	docker run --rm --name drive -ti -v /opt/gdrive/kavehmz/:/gdrive kavehmz/drive -- pull -hidden -verbose -desktop-links=false -exclude-ops "delete"

push:
	docker run --rm --name drive -ti -v /opt/gdrive/kavehmz/:/gdrive kavehmz/drive -- push -hidden -verbose

push-no-del:
	docker run --rm --name drive -ti -v /opt/gdrive/kavehmz/:/gdrive kavehmz/drive -- push -hidden -verbose -exclude-ops "delete"
