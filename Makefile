ENV ?= dev

init:
	terraform init ${ENV}

plan:
	terraform plan ${ENV}

apply:
	terraform apply --auto-approve ${ENV}

kill:
	terraform destroy --auto-approve ${ENV}