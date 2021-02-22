ifndef ENVIRONMENT
  override ENVIRONMENT=development
endif

define check_workspace
	mkdir logs 2>/dev/null || true
	if [ "$(ENVIRONMENT)" != $$(terraform workspace show) ]; \
	then \
		echo; \
		echo "Exiting - Environment set for $(ENVIRONMENT); however, workspace is $$(terraform workspace show).\nWorkspace and Environment must match"; \
		echo; \
		exit 1; \
	fi;
endef

.PHONY: apply destroy graph help init outputs plan show taint workspace

default: help

apply:
	@$(call check_workspace)
	@start="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	terraform apply out/$(ENVIRONMENT).out 2>&1 | tee logs/apply-$${start}.log; \
	enddate="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	echo; \
	echo "Started apply at  : $$start"; \
	echo "Finished apply at : $$enddate"; \
	echo "Log file name     : logs/apply-$${start}.log"; \
	echo

# Examples:
# make destroy ENVIRONMENT=nprd EXTRA_ARGS="-var VAULT_TOKEN=$VAULT_TOKEN"
# make destroy ENVIRONMENT=prd EXTRA_ARGS="-var VAULT_TOKEN=$VAULT_TOKEN"
destroy:
	@$(call check_workspace)
	@start="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	terraform destroy \
		-var-file=$(ENVIRONMENT).tfvars \
		 $(EXTRA_ARGS) 2>&1 | tee logs/destroy-$${start}.log; \
	enddate="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	echo; \
	echo "Started destroy at  : $$start"; \
	echo "Finished destroy at : $$enddate"; \
	echo "Log file name       : logs/destroy-$${start}.log"; \
	echo

# Examples:
# make graph ENVIRONMENT=nprd
graph:
	@$(call check_workspace)
	@start="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	terraform graph \
		-type=plan \
		out/$(ENVIRONMENT).out; \
	enddate="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	echo; \
	echo "Started graph at  : $$start"; \
	echo "Finished graph at : $$enddate"; \
	echo

help:
	@start="`date`"; \
	echo ""; \
	echo "Make options are:"; \
	echo "----------------:"; \
	echo "apply     - apply a saved terraform plan"; \
	echo "destroy   - destroy an existing Azure infrastructure"; \
	echo "graph     - show(save) the dependency graph"; \
	echo "help      - show this text"; \
	echo "init      - initialize the terraform workspace"; \
	echo "outputs   - show the outputs from the last applied terraform plan"; \
	echo "plan      - run the terraform plan and compare desired (code) to actual (Azure)"; \
	echo "show      - outputs a terraform state or plan file in a human-readable form"; \
	echo "taint     - taint one or more terraform modules"; \
	echo "workspace - select a terraform workspace"; \
	echo ""

init:
	@start="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	rm -rf .terraform/modules/ ; \
	terraform init -backend-config=backend.tf $(EXTRA_ARGS); \
	enddate="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	echo; \
	echo "Started init at  : $$start"; \
	echo "Finished init at : $$enddate"; \
	echo

# Examples:
# make outputs ENVIRONMENT=nprd EXTRA_ARGS="-json"
# make outputs ENVIRONMENT=nprd
outputs:
	@start="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	terraform output $(EXTRA_ARGS) 2>&1 | tee logs/outputs-$${start}.log; \
	enddate="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	echo; \
	echo "Started outputs at  : $$start"; \
	echo "Finished outputs at : $$enddate"; \
	echo "Log file name       : logs/outputs-$${start}.log"; \
	echo

# Examples:
# make plan ENVIRONMENT=nprd EXTRA_ARGS="-var VAULT_TOKEN=$VAULT_TOKEN"
# make plan ENVIRONMENT=prd EXTRA_ARGS="-var VAULT_TOKEN=$VAULT_TOKEN"
plan:
	@$(call check_workspace)
	@start="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	terraform plan \
		-var-file=$(ENVIRONMENT).tfvars \
		-out=out/$(ENVIRONMENT).out $(EXTRA_ARGS) 2>&1 | tee logs/plan-$${start}.log; \
	enddate="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	echo; \
	echo "Started plan at  : $$start"; \
	echo "Finished plan at : $$enddate"; \
	echo "Log file name    : logs/plan-$${start}.log"; \
	echo

show:
	@$(call check_workspace)
	@start="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	echo "$(startdate)"; \
	terraform show $(EXTRA_ARGS) out/$(ENVIRONMENT).out; \
	enddate="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	echo; \
	echo "Started show at  : $$start"; \
	echo "Finished show at : $$enddate"; \
	echo

taint:
	@start="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	terraform taint $(EXTRA_ARGS); \
	enddate="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	echo; \
	echo "Started taint at  : $$start"; \
	echo "Finished taint at : $$enddate"; \
	echo

workspace:
	@start="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	terraform workspace select $(ENVIRONMENT) ; \
	enddate="`date +"%Y-%m-%dT%H:%M:%S%Z"`"; \
	echo; \
	echo "Started workspace at  : $$start"; \
	echo "Finished workspace at : $$enddate"; \
	echo