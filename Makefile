
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) bin

EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml home $(wildcard .??*~) $(wildcard *~)
# home は homeshick 用

DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
DEPLOY_DIR := $(HOME)
CMD_LS = /bin/ls
CMD_GIT = git

.DEFAULT_GOAL := help

.PHONY: all list deploy init test update install clean help

# bin/:
# 	mkdir -p $@

all:

demo:
	@echo $(CFLAGS)

## Show dot files in this repo
list: # $(DOTFILES)
	@$(foreach val, $(DOTFILES), $(CMD_LS) -dF $(val);)

## Create symlink to home directory
deploy: # $(DOTFILES)
	@echo $(DEPLOY_DIR)
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(abspath $(DEPLOY_DIR))/$(val);)

rm_deploy_files:
	@$(foreach val, $(DOTFILES), rm $(CFLAGS) $(abspath $(DEPLOY_DIR))/$(val);)


init: ## Setup environment settings
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/init/init.sh

test: ## Test dotfiles and init scripts
	@#DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/test/test.sh
	@echo "test is inactive temporarily"

update: ## Fetch changes for this repo
	$(CMD_GIT) pull origin master
	$(CMD_GIT) submodule init
	$(CMD_GIT) submodule update
	$(CMD_GIT) submodule foreach git pull origin master

install: update deploy init ## Run make update, deploy, init
	@exec $$SHELL

clean: ## Remove the dot files and this repo
	@echo 'Remove dot files in your home directory...'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
