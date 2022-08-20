CURRENT_DIRECTORY:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))
ANSIBLE_DIRECTORY:=$(CURRENT_DIRECTORY)/ansible
ANSIBLE_PLAYBOOK_PATH:=$(ANSIBLE_DIRECTORY)/playbook.yml
ANSIBLE_INVENTORY_PATH:=$(ANSIBLE_DIRECTORY)/inventory.yml
ANSIBLE_REQUIREMENTS_PATH:=$(ANSIBLE_DIRECTORY)/requirements.yml

help:
	@echo "Please use 'make <target>' where <target> is one of the following:"
	@echo "  ansible-galaxy       install sublime-text role dependency"
	@echo "  ansible-playbook     provision sublime-text editor"
	@echo "  sublime              setup and configure sublime-text editor"

.PHONY: ansible-galaxy
ansible-galaxy:
	@ansible-galaxy install -r $(ANSIBLE_REQUIREMENTS_PATH)

.PHONY: ansible-playbook
ansible-playbook:
	@ansible-playbook -K -i $(ANSIBLE_INVENTORY_PATH) $(ANSIBLE_PLAYBOOK_PATH)

.PHONY: sublime
sublime: ansible-galaxy ansible-playbook
