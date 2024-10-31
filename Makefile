.PHONY: build run stop clean

IMAGE_NAME=json-server-mock
PORT=3000
DOCKER_CMD = docker

help:
	@echo "Comandos disponíveis:"
	@echo "  make build    - Build the Docker image for the JSON Server."
	@echo "  make run      - Start the container and map port: $(PORT)."
	@echo "  make stop     - Stop the JSON Server container."
	@echo "  make clean    - Remove all container and image: $(IMAGE_NAME)."

build:
	$(DOCKER_CMD) build -t $(IMAGE_NAME) .

run:
	$(DOCKER_CMD) run -it -p $(PORT):3000 $(IMAGE_NAME)

stop:
	$(DOCKER_CMD) stop $$(podman ps -q --filter ancestor=$(IMAGE_NAME))

clean:
	$(DOCKER_CMD) rm -f $(shell $(DOCKER_CMD) ps -a -q --filter ancestor=$(IMAGE_NAME))
	$(DOCKER_CMD) rmi -f $(IMAGE_NAME)
