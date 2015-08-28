.PHONY: all plan apply

all:
	@echo 'Usage:'
	@echo 'make plan  - pull and plan'
	@echo 'make apply - apply and push'

plan:
	terraform remote pull && terraform plan

apply:
	terraform apply && terraform remote push
