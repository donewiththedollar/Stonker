# Field and Function Name Mapping Documentation

## Project Overview
This is a Sui Move smart contract project named "Stonker", an automated DeFi trading bot system. The project integrates multiple DeFi protocols including Deepbook, Cetus, Turbos, Bluefin, MMT, etc., implementing automated market making, arbitrage, and trend following trading strategies.

## Major Module Recovery Status

### config.move
**Struct: GlobalConfig**
- `a028c32870d59a6e8` → `min_price_tick`
- `a82053465eda9bdc4` → `max_price_tick`
- `aaa372af3148e91d6` → `order_expiry_ms`
- `ab3241576c7b31a2f` → `sui_limit_a`
- `a56fd38bb12b204a1` → `sui_limit_b`
- `a035758c2df2aac0a` → `sui_limit_large_a`
- `ab7f9bd571f575505` → `sui_limit_large_b`
- `a7cea368357b7d971` → `is_trading_enabled`
- `a7f1f6920b2de2e7c` → `is_monitoring_enabled`
- `ad4b2d799016f877d` → `config_param_d`
- `ad2616e93a0796e5b` → `scale_factor`
- `a2059360c1827f292` → `multiplier_factor`
- `aa8d95a01d0a32dc8` → `sui_precision`
- `a24721a1521e81292` → `usdc_threshold`
- `a31f95bf83694efb8` → `sui_threshold_a`
- `a95922dffece9e7da` → `sui_threshold_b`
- `a3a9b9d10c7fad14a` → `is_price_filter_enabled`
- `a028c32870d59a6e8` → `price_factor_a`
- `a82053465eda9bdc4` → `price_factor_b`
- `aaa372af3148e91d6` → `trade_multiplier`
- `ab3241576c7b31a2f` → `sui_min_trade_amount`
- `a56fd38bb12b204a1` → `sui_medium_limit`
- `a035758c2df2aac0a` → `sui_small_limit`
- `ab7f9bd571f575505` → `sui_mid_limit`
- `a7cea368357b7d971` → `sui_large_threshold`

**Functions:**
- `a8ca7876854a16d35` → `create_global_config`
- `abc3ae4f61d07f772` → `create_default_config`
- `a1d4036cdf86e784c` → `verify_owner`
- `a7cea368357b7d971` → `is_active`
- `a7f1f6920b2de2e7c` → `is_trading_enabled`
- `a3a9b9d10c7fad14a` → `is_price_filter_enabled`
- `a028c32870d59a6e8` → `min_price_tick`
- `a82053465eda9bdc4` → `max_price_tick`
- `aaa372af3148e91d6` → `order_expiry_ms`
- `ab3241576c7b31a2f` → `sui_limit_a`
- `a56fd38bb12b204a1` → `sui_limit_b`
- `a035758c2df2aac0a` → `sui_limit_large_a`
- `ab7f9bd571f575505` → `sui_limit_large_b`
- `ad4b2d799016f877d` → `config_param_d`
- `ad2616e93a0796e5b` → `scale_factor`
- `a2059360c1827f292` → `multiplier_factor`
- `aa8d95a01d0a32dc8` → `sui_precision`
- `a24721a1521e81292` → `usdc_threshold`
- `a31f95bf83694efb8` → `sui_threshold_a`
- `a95922dffece9e7da` → `sui_threshold_b`

### main.move
**Struct:TraderAccount**
- `a0838fe09e8397d56` → `trading_state` (TradingState type)
- `a0ee193d93f88cdcb` → `next_trade_time`
- `aac8da939a55f9e08` → `priority_counter`

**Struct:OrderDetails**
- `a27ddd31886860775` → `market_price`
- `a863166978b7b5c02` → `order_type`
- `a8c11751b5c54d9f3` → `bid_prices`
- `a4ad9d24a601f5a60` → `bid_amounts`
- `a7995ce3041d46cb2` → `ask_prices`
- `a52aea689b5e0eb4e` → `ask_amounts`
- `ac21553e7b18debdd` → `price_spread`
- `ae5a8c85f7339c42f` → `priority_weight`
- `a7d027a58611a0718` → `balance_manager_id`
- `a74b4e85f3b283ef9` → `expiry_timestamp`

**Functions:**
- `a1d4036cdf86e784c` → `verify_config_and_owner`
- `a40f8bc58a06c8b33` → `execute_trade`
- `a280ecc58e70fd664` → `get_total_balances`
- `a75d4519aec44b4ef` → `create_trader_account`
- `a3b1c162091168a1d` → `update_trading_state`
- `a94cdf867cab7cc5c` → `adjust_sui_balance_from_manager`
- `a40f8bc58a06c8b33` → `get_trading_state_mut`
- `a94cdf867cab7cc5c` → `stake_liquidity`
- `a40f8bc58a06c8b33` → `place_deep_immediate_or_cancel_order`
- `a94cdf867cab7cc5c` → `replace_post_only_order_sell`
- `a40f8bc58a06c8b33` → `deposit_usdc`
- `a75d4519aec44b4ef` → `create_balance_manager`
- `a40f8bc58a06c8b33` → `place_immediate_or_cancel_order_buy`
- `a94cdf867cab7cc5c` → `delay_trading`
- `a40f8bc58a06c8b33` → `withdraw_usdc`
- `a280ecc58e70fd664` → `get_total_token_balances`
- `a94cdf867cab7cc5c` → `withdraw_generic`
- `a40f8bc58a06c8b33` → `claim_rebates`

### errors.move
**Struct:**
- `ErrorEvent` (already recovered)
  - `a717f51b034470d1f` → `error_message`
- `DeepTradeEvent` (already recovered)
  - `a70d631a34fc90610` → `deep_amount`
  - `a1907c3c9dbf507be` → `quote_amount`

**Functions:**
- `a15c536f8ba435e85` → `emit_error`
- `a4f6e7e0f807d8009` → `execute_trade_with_safety_checks`
- `a5cbb92dc76b371c3` → `ensure_deep_balance`

### orders.move
**Struct:OrderManager**
- `a0c4b816b0a50ba9c` → `order_slots` (vector<Option<Order>>)
- `ab814e822c301efb4` → `best_bid`
- `a021d28fd92bb1654` → `best_ask`
- `ad24db9c79e9012ee` → `total_position`

**Functions:**
- `a2719df4ae928c371` → `calculate_order_quantity`
- `a7b7e6cc5534d020a` → `execute_buy_order`
- `a7e4799d1951fe624` → `execute_sell_order`
- `a95d889fec9e5f721` → `create_order_manager`
- `a38a80653e93a075b` → `manage_orders`

### math.move
**Struct: MarketData** (original Aacc01655d0dfbab1)
- `a49526e8be3cf123e` → `bid_prices`
- `aa784e08665117e43` → `bid_amounts`
- `afc35d9b0ccb52fbe` → `ask_prices`
- `a650b4a54924e6b42` → `ask_amounts`
- `ask_price` (already recovered)
- `bid_price` (already recovered)
- `ab814e822c301efb4` → `best_bid`
- `a021d28fd92bb1654` → `best_ask`

**Functions:**
- `a05c79de03729de86` → `calculate_buy_amount`
- `a27098c94605e3b6a` → `calculate_sell_amount`
- `a2daef4381117fe2e` → `create_market_data`
- `ad2b2505b5ae4a829` → `adjust_price`
- `a49526e8be3cf123e` → `bid_prices` (getter)
- `aa784e08665117e43` → `bid_amounts` (getter)
- `afc35d9b0ccb52fbe` → `ask_prices` (getter)
- `a650b4a54924e6b42` → `ask_amounts` (getter)
- `ab814e822c301efb4` → `best_bid` (getter)
- `a021d28fd92bb1654` → `best_ask` (getter)

### utils.move
**Functions:**
- `ac89fc20276c7e30c` → `calculate_amount_from_price`
- `abe7ab0b8cf6b9d08` → `calculate_fee_adjustment`
- `a9d9f98ebd95b9dad` → `get_available_usdc_balance`
- `ab78d0325509532d4` → `get_available_sui_balance`

## Project Functionality Summary

1. **Automated Trading**: Supports automated market making and arbitrage for SUI/USDC trading pair
2. **Multi-Protocol Integration**: Integrates multiple DeFi protocols including Deepbook, Cetus, Turbos, Bluefin, MMT, etc.
3. **Risk Management**: Includes price limits, quantity limits, cooldown periods, and other risk control mechanisms
4. **Order Management**: Supports various order types including limit orders, market orders, Immediate or Cancel (IOC), Post-only (POST_ONLY), etc.
5. **Fund Management**: Automatically adjusts SUI and USDC balances to ensure sufficient funds in trading accounts
6. **Event-Driven**: Records trading activities, error information, and latency events through an event system
7. **Configuration Management**: Flexible global configuration system supporting dynamic adjustment of trading parameters

## Code Readability Recovery Status

Field and function name recovery for major modules has been completed, significantly improving code readability. Remaining encrypted names primarily involve utility functions and minor fields, which do not affect overall understanding.

Note: Backup files are located in the `backup_field_rename/` and `backup_struct_rename/` directories, containing the original encrypted code.