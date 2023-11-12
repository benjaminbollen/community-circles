## Community Circles

Notice: during the hackathon we worked out advanced specifications for the whole problem. Unfortunately we did not complete enough implementation parts to stitch together a minimal feasible working demo for the hackathon.

As Circles UBI is a public goods project, we thought we'd still write up the context and a highlevel of some of the specification in this readme and submit it to have a record at zkIstanbul.

## Context

Circles UBI ([joincircles.net](https://joincircles.net/)) is a cooperative project that has been supporting a novel idea for an unconditional income for all people for many years.

Circles uniquely addresses the sybil-resistance problem not with a global registry of unique humans, but with a local, ground-up symmetry property of the UBI token:

> Everyone can mint one token per hour - their own ERC20 token. To make these tokens fungible, other people need to trust your account explicitly to be unique to you.

By introducing a trust graph of unique people, they also commit to having their tokens to be 1-1 fungible with the tokens of the people they trust to be authentic.

That way we construct a path-fungibility where the tokens can be transferred to unknown people, if a trust path connecting sender and receiver can be found.

An illustrative example of a transfer occurring over a trust path can be found in the Circles UBI whitepaper and is reproduced below:

![](./assets/circles_diagram_3.png)
(from https://github.com/CirclesUBI/whitepaper)

## Problem

The existing implementation exposes the trust graph **publicly** in solidity on-chain. To advance the project, we need to come up with a proposal to shield this valuable asset of a social graph while still enabling path transfers.

## Our work at zkIstanbul

We introduce the idea of "*communities*" as a shielding contract on L1 (or L2 for scalability).

We used Aztec Noir to build the (recursive) proofs, but burned a lot of time on trying to convert provided higher-level types back to Field elements for the recursive proof public inputs (note to Aztec: the documentation and examples are sparse on this advanced topic, nor could we find example in the v3 code-base as reference).

### Flow matrix

By expressing the path transfer in a flow matrix where each row is a transfer of a specific token between two people (where the receiver trusts this token); and each column is a participant along the path-transfer, we can prove conservation of in-and-out flow for intermediate participants, and assert correct sender and receiver amounts at the start and end of the path.

This flow matrix can be extended from a single-path-transfer to a batch-path-transfer.

### Circle nodes

As each human has their own token, which other people can have a balance of, in addition for each token we need to track who accepts it as fungible for their own tokens.

To solve for this, the community shielding contract tracks the root of a community Merkle tree.

Each leaf in the community tree is a person who entered the shielded community


**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
