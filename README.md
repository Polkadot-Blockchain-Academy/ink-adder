# Prerequisites

## Make sure you have Rust installed:

```bash
curl https://sh.rustup.rs -sSf | sh
rustup default stable
rustup update
rustup update nightly
rustup target add wasm32-unknown-unknown --toolchain nightly
```

## Make sure you have `cargo-contract`:

### Install it's dependencies:

```bash
sudo apt install binaryen
cargo install cargo-dylint dylint-link
```

### And install this version of c-c:

```bash
cargo +nightly install cargo-contract --vers 3.2.0 --force --locked
```

## Install file watcher:

```bash
cargo install cargo-watch
```

# Instructions

- Fill in the blanks creating a contract the keeps track of a counter, adding a value to it with every `add` transaction.
- Build the contract instance `make release`.
- Go to the [ContractsUI](https://contracts-ui.substrate.io/?rpc=wss://ws.test.azero.dev).
- Deploy and interact with the contract by adding a value. Retrieve the updated value.
 - Use the `//Alice` (`bottom drive obey lake curtain smoke basket hold race lonely fit walk/Alice`) account to sign your transactions, it has some funds to cover the gas fees. Add it to [polkadot.js extension](https://polkadot.js.org/extension/) .

## AlephZero devnet deployment

Run devnet:

```bash
make devnet
```

Compile & deploy:

```bash
make compile
make deploy
```

## AlephZero testnet deployment

```bash
make compile
ENV=test make deploy
```

# License

Licensed under the terms of the [GPL-3](./LICENSE.md) or later.
