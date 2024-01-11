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
