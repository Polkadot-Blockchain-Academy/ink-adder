.PHONY: help
help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: watch
watch: # watcher on the contract code
watch:
	cargo watch -s "cargo contract check" -c

.PHONY: release
release: # build release binary and contract artifacts
release:
	cargo +nightly contract build --release

.PHONY: clean-azero
clean-azero: # Remove azero node data
clean-azero:
	cd devnet-azero && rm -rf \
	5*/chains/a0dnet1/db \
	5*/chains/a0dnet1/network \
	5*/backup-stash \
	5*/chainspec.json \
	&& echo "Done azero clean"

.PHONY: clean
clean: # Remove all node data
clean: clean-azero

.PHONY: bootstrap-azero
bootstrap-azero: # Bootstrap the node data
bootstrap-azero:
	cd devnet-azero && \
	cp azero_chainspec.json 5D34dL5prEUaGNQtPPZ3yN5Y6BnkfXunKXXz6fo7ZJbLwRRH/chainspec.json

.PHONY: devnet-azero
devnet-azero: # Run azero devnet
devnet-azero: bootstrap-azero
	docker-compose -f ./devnet-azero/devnet-azero-compose.yml up
