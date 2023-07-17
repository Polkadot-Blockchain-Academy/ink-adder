watch:
	cargo watch -s "cargo contract check" -c

release:
	cargo +nightly contract build --release
