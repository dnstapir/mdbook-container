CONTAINER=	ghcr.io/dnstapir/mdbook-container:latest


build:
	docker build -t $(CONTAINER) .
