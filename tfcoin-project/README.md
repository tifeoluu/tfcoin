# tfcoin-project

A Clarinet-based Clarity project implementing `tfcoin`, a simple fungible token on Stacks.

## Project structure

- `Clarinet.toml` – Clarinet project configuration.
- `contracts/tfcoin.clar` – Main `tfcoin` fungible token smart contract.
- `settings/*.toml` – Network configuration for Devnet, Testnet, and Mainnet.
- `tests/` – Place for Clarinet/Vitest tests (TypeScript).

## Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) installed and available on your `PATH`.

Verify installation:

```bash
clarinet --version
```

## Using the project

From the `tfcoin-project` directory:

### Static analysis

Run Clarinet checks (type-checking and static analysis):

```bash
clarinet check
```

### REPL / sandbox

Open a Clarinet console to interact with the `tfcoin` contract in a local sandbox:

```bash
clarinet console
```

Inside the console, you can load and call contract functions, for example:

```clojure
(contract-call? .tfcoin mint u100 'ST3J2GVMMM2R07ZFBJDWTYEYAR8FZH5WKDTFJ9AHA)
(contract-call? .tfcoin transfer u50 'ST3J2GVMMM2R07ZFBJDWTYEYAR8FZH5WKDTFJ9AHA 'ST2J2GVMMM2R07ZFBJDWTYEYAR8FZH5WKDTFJ9AHB)
(clarity-repl.contract-call? 'ST3J2GVMMM2R07ZFBJDWTYEYAR8FZH5WKDTFJ9AHA .tfcoin get-balance 'ST2J2GVMMM2R07ZFBJDWTYEYAR8FZH5WKDTFJ9AHB)
```

> Note: Replace the example principals above with actual test principals relevant to your environment.

## Contract design

`tfcoin` is a simple fungible token contract:

- Uses `define-fungible-token tfcoin` to define the token.
- `mint` – mints new tokens to a recipient. Restricted so that only `contract-owner` may call it.
- `transfer` – transfers tokens between principals. The caller (`tx-sender`) must match the `sender` argument.
- `get-balance` – read-only helper that returns an account balance.
- `get-total-supply` – read-only helper that returns the global total supply.

### Error codes

- `u100` – `ERR-UNAUTHORIZED`: caller is not allowed to perform the requested action.

## Running tests

You can add TypeScript-based tests under `tests/` and run them with:

```bash
npm install
npm test
```

(Clarinet scaffolding includes a `package.json`, `tsconfig.json`, and `vitest.config.js` to help you get started.)
