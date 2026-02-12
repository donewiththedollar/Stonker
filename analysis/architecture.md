# Stonker Package Architecture

Package: `0xe3b9bd64ba2fb3256293c3fc0119994ec6fc7c96541680959de4d7052be65973`

Generated from on-chain bytecode analysis using [sui-sandbox](https://github.com/Evan-Kim2028/sui-sandbox) and [sui-move-interface-extractor](https://github.com/Evan-Kim2028/sui-move-interface-extractor).

## Internal Dependency Graph

Which modules import types from which other internal modules:

| Module | Depends On |
|--------|-----------|
| main | config, state |
| swap | config, state |
| protocol_mmt | config, state |
| orders | config, math, state |
| pricing | config, orders, state |
| errors | config, math, orders, state |
| helpers | config, state |
| protocol_bluefin | config |
| protocol_turbos | config |
| math | config |
| oracle | config |
| utils | config |
| config | _(none)_ |
| state | _(none)_ |

## Friend Graph (Access Control)

Friend declarations control which modules can call `public(friend)` functions:

| Module | Grants Friend Access To |
|--------|------------------------|
| state | swap, pricing, protocol_turbos, protocol_bluefin, protocol_mmt, helpers, **main** |
| swap | pricing, oracle, helpers |
| protocol_mmt | pricing, helpers |
| protocol_bluefin | pricing |
| protocol_turbos | pricing |
| utils | errors, orders, pricing, oracle, math, helpers |
| orders | errors, pricing, **main** |
| math | orders, **main** |
| oracle | **main** |
| helpers | orders, **main** |
| errors | **main** |
| pricing | **main** |

Key observations:
- **`main`** is the most privileged module -- it has friend access to 6 other modules (state, orders, math, oracle, helpers, errors, pricing)
- **`pricing`** has friend access to 5 modules (state, swap, protocol_mmt, protocol_bluefin, protocol_turbos) -- it orchestrates cross-DEX routing
- **`state`** is the most permissive -- 7 modules can access its internal functions
- **`config`** grants no friend access -- all its functions are fully public

## External Dependencies

### Protocol Integration Map

| Protocol | Package Address | Modules Used |
|----------|----------------|-------------|
| Deepbook v3 | `0x2c8d603b...` | balance_manager, order, pool |
| Cetus CLMM | `0x1eabed72...` | config, pool, position, rewarder |
| Turbos | `0x91bfbc38...` | fee500bps, pool |
| Bluefin | `0x3492c874...` | config, pool |
| MMT | `0x70285592...` | pool, position, version |
| NAVI Lending | `0xd899cf7d...` | incentive_v2, incentive_v3, pool, storage |
| NAVI Oracle | `0xca441b44...` | oracle |
| Pyth Network | `0x8d97f1cd...` | hot_potato_vector, price_info, state |
| Wormhole | `0x5306f64e...` | state |
| Integer Mate | `0x714a63a0...` | i32 |

### Linkage Table (Dependency Versions)

12 out of 25 dependencies use upgraded (non-original) storage addresses:

| Dependency | Original ID | Upgraded Storage ID | Version |
|-----------|-------------|-------------------|---------|
| Sui Framework | `0x0001...` | _(same)_ | 20 |
| Sui Core | `0x0002...` | _(same)_ | 48 |
| Sui System | `0x0003...` | _(same)_ | 28 |
| Deepbook v3 | `0x2c8d603b...` | `0x00c1a56e...` | 4 |
| Cetus CLMM | `0x1eabed72...` | `0x25ebb9a7...` | 14 |
| Turbos | `0x91bfbc38...` | `0xa5a0c25c...` | 22 |
| Bluefin | `0x3492c874...` | `0xd075338d...` | 17 |
| MMT | `0x70285592...` | `0xcf60a40f...` | 5 |
| NAVI | `0xd899cf7d...` | `0xee004123...` | 23 |
| NAVI Oracle | `0xca441b44...` | `0xc2d49bf5...` | 3 |
| NAVI Utils | `0xbe21a061...` | `0x8569b7ef...` | 5 |
| Integer Mate | `0x714a63a0...` | `0xdfaadf86...` | 7 |
| Pyth | `0x8d97f1cd...` | `0x04e20ddf...` | 2 |
| USDC | `0xdba34672...` | _(same)_ | 1 |
| DEEP Token | `0xdeeb7a46...` | _(same)_ | 1 |

## Module Size Summary

| Module | Structs | Fields | Functions | Role |
|--------|---------|--------|-----------|------|
| config | 4 | 57 | 118 | Global configuration (53 getters, 61 setters) |
| state | 3 | 20 | 30 | LP position management (Cetus, MMT, Bluefin) |
| swap | 1 | 1 | 24 | Flash swap execution across DEXes |
| main | 5 | 31 | 21 | Entry point: deposit, withdraw, trade orchestration |
| protocol_mmt | 1 | 1 | 21 | MMT/Turbos DEX adapter |
| utils | 0 | 0 | 18 | Balance and fee utilities |
| protocol_bluefin | 1 | 1 | 13 | Bluefin DEX adapter |
| math | 1 | 8 | 12 | Market data calculations |
| protocol_turbos | 1 | 1 | 11 | Turbos DEX adapter |
| orders | 2 | 9 | 8 | Order management and book interaction |
| oracle | 3 | 25 | 7 | Pyth oracle + NAVI liquidation |
| helpers | 0 | 0 | 3 | Balance management helpers |
| errors | 2 | 3 | 2 | Error event emission |
| pricing | 4 | 19 | 2 | Cross-DEX price aggregation and routing |
| **Total** | **28** | **176** | **302** | |
