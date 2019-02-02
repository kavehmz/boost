.PHONY: $(shell ls -d *)

default:
	@echo "Usage: make [command]"

build:
	docker build -t kavehmz/vscode .
	# docker push kavehmz/vscode

run:
	docker run -d -u`id -u`:`id -g` -ti --rm -e DISPLAY=$$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/kaveh:/home/kaveh kavehmz/vscode code -w $PWD
