# Stonker - Automated DeFi Trading Bot on Sui

## Project Overview

Stonker (derived from "stock" + "trader") is a professional-grade automated DeFi trading bot system deployed on the Sui blockchain. The system integrates multiple DeFi protocols in the Sui ecosystem, supporting various trading strategies and risk management features.

**Contract Address**: `0xe3b9bd64ba2fb3256293c3fc0119994ec6fc7c96541680959de4d7052be65973`

## Core Features

### 1. Trading Capabilities
- **Multi-token Support**: Major tokens like SUI, USDC, DEEP
- **Order Types**:
  - Limit Order
  - Immediate or Cancel (IOC)
  - Post-only
- **Order Management**: Cancel orders, settle filled orders, query order status
- **DEEP Token Management**: Automatically purchase and manage DEEP tokens for paying Deepbook trading fees

### 2. Integrated Protocols
- **Deepbook**: Order book DEX (uses DEEP tokens for fee payment)
- **Cetus**: AMM protocol (supports low-fee and high-fee versions)
- **Turbos**: Liquidity pool protocol
- **Bluefin**: Trading protocol
- **MMT** (Move Market Trading): Trading protocol

### 3. Trading Strategies
- **Market Making Strategy**: Place Post-only orders on both buy and sell sides to capture bid-ask spread
- **Arbitrage Strategy**: Monitor price differences across multiple DEXes and execute cross-protocol arbitrage
- **Trend Following**: Use IOC orders to quickly enter trending markets
- **Auto-rebalancing**: Dynamically adjust order prices and quantities based on market conditions

### 4. Risk Management
- **Cooldown Period**: Prevent excessively frequent trading operations
- **Price Limits**: Avoid executing trades at abnormal prices
- **Trade Volume Limits**: Control per-trade and total position sizes
- **Time Control**: Order expiration time management

## Deployment and Initialization

### 1. Environment Requirements
- Sui CLI tools
- Sufficient SUI tokens for deployment and gas fees
- Testnet or mainnet environment

### 2. Deployment Steps
```bash
# Compile contract
sui move build

# Deploy contract
sui client publish --gas-budget 100000000
```

### 3. Initial Configuration
After deployment, you need to initialize the trading bot configuration parameters:

```move
// Create global configuration
public fun initialize_config(sender: &signer) {
    // Set trading parameters, limits, permissions, etc.
}

// Create trader account
public fun create_trader_account(is_public: bool, ctx: &mut TxContext) {
    // Initialize trader account
}
```

## Usage

### 1. Deposit
Deposit funds into the trading bot to start trading:

```move
// Deposit SUI
public fun deposit_sui(
    balance_manager: &mut BalanceManager,
    sui_coin: &mut Coin<SUI>,
    amount: u64,
    ctx: &mut TxContext
)

// Deposit USDC
public fun deposit_usdc(
    balance_manager: &mut BalanceManager,
    usdc_coin: &mut Coin<USDC>,
    amount: u64,
    ctx: &mut TxContext
)
```

### 2. Withdrawal
Withdraw funds from the trading bot:

```move
// Withdraw SUI
public fun withdraw_sui(
    balance_manager: &mut BalanceManager,
    amount: u64,
    ctx: &mut TxContext
)

// Withdraw USDC
public fun withdraw_usdc(
    balance_manager: &mut BalanceManager,
    amount: u64,
    ctx: &mut TxContext
)
```

### 3. Placing Orders

#### IOC Order (Immediate or Cancel)
```move
public fun place_ioc_order(
    trader: &TraderAccount,
    config: &GlobalConfig,
    balance_manager: &mut BalanceManager,
    pool: &mut Pool<SUI, USDC>,
    quantity: u64,
    price: u64,
    clock: &Clock,
    ctx: &mut TxContext
)
```

#### Post-only Order (Maker Only)
```move
public fun place_post_only_order(
    trader: &TraderAccount,
    config: &GlobalConfig,
    balance_manager: &mut BalanceManager,
    pool: &mut Pool<SUI, USDC>,
    quantity: u64,
    price: u64,
    clock: &Clock,
    ctx: &mut TxContext
)
```

### 4. Order Management

#### Cancel All Orders
```move
public fun cancel_all_orders(
    trader: &mut TraderAccount,
    config: &GlobalConfig,
    sui_coin: &mut Coin<SUI>,
    balance_manager: &mut BalanceManager,
    pool: &mut Pool<SUI, USDC>,
    // ... other parameters
)
```

#### Set Trading Cooldown
```move
public fun set_trading_cooldown(
    trader: &mut TraderAccount,
    config: &GlobalConfig,
    sui_coin: &mut Coin<SUI>,
    balance_manager: &mut BalanceManager,
    pool: &mut Pool<SUI, USDC>,
    clock: &Clock,
    cooldown_duration: u64,
    expiry_time: u64,
    ctx: &mut TxContext
)
```

### 5. Query Functions

#### Query Account Balances
```move
public fun get_account_balances(
    trader: &TraderAccount,
    balance_manager: &BalanceManager,
    pool: &Pool<SUI, USDC>
) : (u64, u64, u64)  // Returns (SUI balance, USDC balance, DEEP balance)
```

#### Query Account State
```move
public fun get_account_state(trader: &TraderAccount) : (u64, u64)
```

## Configuration Parameters

### Trading Parameters
- **Min/Max Trade Volume**: Quantity limits per trade
- **Price Slippage Tolerance**: Allowed price fluctuation range
- **Order Expiry Time**: Order validity period
- **Cooldown Period**: Minimum interval between trades

### Risk Management Parameters
- **Maximum Position**: Total position size limit
- **Price Limits**: Allowed trading price range
- **Gas Price Limit**: Maximum acceptable gas price

### Protocol Configuration
- Parameter settings for each integrated protocol
- Fee rate configuration
- Liquidity pool selection

## Event System

The trading bot emits various events for monitoring and auditing:

### 1. Balance Events
```move
struct BalanceEvent has copy, drop {
    amount: u64,          // Change amount
    balance: u64,         // Balance after change
    is_sui: bool,         // Whether it's SUI token
    is_deposit: bool,     // Deposit or withdrawal
}
```

### 2. Trade Events
```move
struct TradeEvent has copy, drop {
    target_price: u64,    // Target price
    current_price: u64,   // Current price
    usdc_amount: u64,     // USDC amount
    timestamp_ms: u64,    // Timestamp
    // ... other trade details
}
```

### 3. Error Events
```move
struct ErrorEvent has copy, drop {
    error_message: vector<u8>,  // Error message
}
```

## Security Features

### Permission Control
- Only contract owner can modify global configuration
- Trader accounts are bound to configuration to prevent unauthorized access
- Signature verification ensures operation legitimacy

### Input Validation
- Price and quantity validity checks
- Timestamp verification to prevent replay attacks
- Balance checks to prevent overtrading

### Error Handling
- Detailed error messages and event logging
- Safe rollback on transaction failure
- Fund protection in exceptional conditions

## Code Structure

```
src/
├── main.move          # Main trading logic module
├── config.move        # Configuration management module
├── orders.move        # Order management module
├── pricing.move       # Price management module
├── errors.move        # Error handling module
├── state.move         # State management module
├── swap.move          # Swap operations module
├── oracle.move        # Oracle integration module
└── protocols/         # Protocol adapters
    ├── deepbook.move  # Deepbook integration
    ├── cetus.move     # Cetus integration
    ├── turbos.move    # Turbos integration
    ├── bluefin.move   # Bluefin integration
    └── mmt.move       # MMT integration
```

## Development Guidelines

### Code Style
- Struct naming: PascalCase (e.g., `TraderAccount`, `GlobalConfig`)
- Function naming: snake_case (e.g., `deposit_sui`, `place_limit_order`)
- Field naming: snake_case (e.g., `balance_sui`, `total_pnl`)
- Constant naming: SCREAMING_SNAKE_CASE

### Testing Recommendations
1. **Unit Testing**: Test core functionality of each module
2. **Integration Testing**: Test cross-module interaction logic
3. **Simulation Testing**: Test trading strategies using simulated environments
4. **Stress Testing**: Test system stability under high concurrency

## Important Notes

### Risk Warnings
1. **Market Risk**: DeFi markets are highly volatile and may cause capital loss
2. **Protocol Risk**: Dependent external protocols may have security issues
3. **Technical Risk**: Smart contract code may contain undiscovered vulnerabilities
4. **Operational Risk**: Incorrect configuration may lead to unintended trading behavior

### Best Practices
1. **Start Small**: Begin with small amounts for testing before full deployment
2. **Regular Monitoring**: Periodically check the trading bot's operation status
3. **Parameter Adjustment**: Adjust trading parameters appropriately based on market conditions
4. **Fund Diversification**: Do not allocate all funds to a single trading bot

## Support and Feedback

If you have questions or suggestions, please contact us through the following channels:

1. Submit a GitHub Issue
2. Check contract event logs
3. Analyze transaction history

---

*Note: This is an automated trading tool. Ensure you fully understand the associated risks before using it. The author is not responsible for any losses incurred from using this system.*