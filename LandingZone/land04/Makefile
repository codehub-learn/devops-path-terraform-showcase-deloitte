## Before we start test that we have the mandatory executables available
.ONESHELL:

TERRAFORM ?= terraform
ACCOUNT ?= athtech
ENV_TYPE ?= dev
VPC_NAME ?= demovpc
TARGET_PATH = accounts/$(ACCOUNT)/$(ENV_TYPE)/$(VPC_NAME)

check_vars:
ifndef AWS_PROFILE
    $(info "AWS_PROFILE is not set")
endif
	$(info "Using $(TF_VERSION)")
	$(info "Target_command: ")
	$(info "Account: $(ACCOUNT)")
	$(info "Env Type: $(ENV_TYPE)")
	$(info "VPC Name: $(VPC_NAME)")

init:
	@echo "initialize remote state file"
	mkdir -p $(TARGET_PATH)
	cd $(TARGET_PATH) 
	rm -rf .terraform/modules/ 
	$(TERRAFORM) init

fmt:
	@echo "Formating files"
	cd $(TARGET_PATH)
	$(TERRAFORM) fmt -recursive

validate: fmt init
	@echo "running terraform validate"
	cd $(TARGET_PATH) 
	$(TERRAFORM) validate

plan: validate
	@echo "running terraform plan"
	cd $(TARGET_PATH) 
	$(TERRAFORM) plan 

apply: validate
	@echo "running terraform apply"
	cd $(TARGET_PATH) 
	$(TERRAFORM) apply -auto-approve 

plan-destroy: validate
	@echo "running terraform plan -destroy"
	cd $(TARGET_PATH) 
	$(TERRAFORM) plan -destroy 

destroy: init
	@echo "running terraform destroy"
	cd $(TARGET_PATH) 
	$(TERRAFORM) destroy 
