all: help

help: ## Show help
	@grep -E '(^[a-zA-Z0-9_\-\.]+:.*?##.*$$)|(^##)' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'


start: ## Starts app
	docker-compose up -d

stop: ## Stops app
	docker-compose down --remove-orphans

restart: stop start ## Restarts app

network.create: ## Creates app network
	docker network create app-proxy | exit 0
