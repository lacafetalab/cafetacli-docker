.DEFAULT_GOAL := help

## GENERAL ##
OWNER 			= utp
SERVICE_NAME 	= gamma

## DEPLOY ##
ENV 			?= dev

## RESULT_VARS ##
PROJECT_NAME	         = $(OWNER)-$(ENV)-$(SERVICE_NAME)
export CONTAINER_NAME 	 = $(PROJECT_NAME)_dev
export IMAGE_DEV		 = $(PROJECT_NAME):dev


console: ## Run custom command in node image: make console run="command"
	@docker run --rm -t -v ${PWD}/application:/application $(IMAGE_DEV) ${run}

start: ## Up docker containers: make up
	docker-compose -f container/docker-compose.yml up -d --build

stop: ## Stop docker containers: make stop
	docker-compose -f container/docker-compose.yml stop

ssh: ## Connect to container for ssh protocol : make ssh
	docker exec -it $(CONTAINER_NAME) sh

stats: ## Connect to container for ssh protocol : make ssh
	docker stats $(CONTAINER_NAME)

## build
prd: ## Create producion files: make prd
	@make console run="yarn build"

## build qa

build-qa: ## Create qa files: make prd 
	@make console run="yarn build:qa"
## testing
test: ## Run unit testings : make test
	@make console run="yarn test"

test-ci: ## Run unit testings without watch mode : make test-ci
	@make console run="yarn test-ci"

test-coverage: ## Run unit testings coverage: make test-coverage
	@make console run="yarn test:coverage"

test-coverage-ci: ## Run unit testings coverage without watch mode: make test-coverage-ci
	@make console run="yarn test:coverage-ci"

## Tools docker##
docker-kill: ## Kill all docker containers : make docker-kill
	docker rm -f $$(docker ps -aq)

docker-clean: ## Kill all unused containers, images, storages, networks : make docker-clean
	docker system prune --volumes


build-firebase:  ## Build and prepare to deploy to firebase: make build-firebase env=qa|staging|production
	rm -rf ${PWD}/application/dist/*
	cd application/ && yarn install && yarn build:${env}
	cp -rf ${PWD}/application/dist deploy/
## Deploy QA 
deploy-firebase: ## Deploy to firebase: make deploy-firebase env=qa
	@make build-firebase env=${env}
	cd deploy/ && firebase deploy --only hosting:${env}


## Target Help ##
help:
	@printf "\033[31m%-16s %-59s %s\033[0m\n" "Target" "Help" "Usage"; \
	printf "\033[31m%-16s %-59s %s\033[0m\n" "------" "----" "-----"; \
	grep -hE '^\S+:.*## .*$$' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' | sort | awk 'BEGIN {FS = ":"}; {printf "\033[32m%-16s\033[0m %-58s \033[34m%s\033[0m\n", $$1, $$2, $$3}'


