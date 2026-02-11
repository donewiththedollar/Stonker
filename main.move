module defi_package::main {
    public struct TraderAccount has store, key {
        id: 0x2::object::UID,
        config_id: 0x2::object::ID,
        order_sequence: u64,
        error_counter: u64,
        cumulative_price: u64,
        target_price: u64,
        target_amount: u64,
        priority_counter: u64,
        next_trade_time: u64,
        trading_state: defi_package::state::TradingState,
    }

    public struct BalanceInfo has copy, drop {
        amount: u64,
        balance_after: u64,
        is_sui: bool,
        is_deposit: bool,
    }

    public struct PositionInfo has copy, drop {
        current_balance: u64,
        adjusted_amount: u64,
    }

    public struct OrderDetails has copy, drop {
        market_price: u64,
        target_price: u64,
        target_amount: u64,
        timestamp_ms: u64,
        order_sequence: u64,
        order_type: u8,
        bid_prices: vector<u64>,
        bid_amounts: vector<u64>,
        ask_prices: vector<u64>,
        ask_amounts: vector<u64>,
        price_spread: u64,
        priority_weight: u64,
        balance_manager_id: 0x2::object::ID,
        expiry_timestamp: u64,
    }

    public struct DelayEvent has copy, drop {
        delay_duration: u64,
    }

    public fun execute_oracle_trade<T0, T1>(arg0: &mut TraderAccount, arg1: &defi_package::config::GlobalConfig, arg2: &mut 0x2::coin::Coin<0x2::sui::SUI>, arg3: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg4: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg5: u64, arg6: u8, arg7: u8, arg8: address, arg9: &mut 0xd899cf7d2b5db716bd2cf55599fb0d5ee38a3061e7b6bb6eebf73fa5bc4c81ca::storage::Storage, arg10: &mut 0xca441b44943c16be0e6e23c5a955bb971537ea3289ae8016fbf33fffe1fd210f::oracle::PriceOracle, arg11: &mut 0xd899cf7d2b5db716bd2cf55599fb0d5ee38a3061e7b6bb6eebf73fa5bc4c81ca::pool::Pool<T0>, arg12: &mut 0xd899cf7d2b5db716bd2cf55599fb0d5ee38a3061e7b6bb6eebf73fa5bc4c81ca::incentive_v2::Incentive, arg13: &mut 0xd899cf7d2b5db716bd2cf55599fb0d5ee38a3061e7b6bb6eebf73fa5bc4c81ca::incentive_v3::Incentive, arg14: &mut 0x3::sui_system::SuiSystemState, arg15: &mut 0xd899cf7d2b5db716bd2cf55599fb0d5ee38a3061e7b6bb6eebf73fa5bc4c81ca::pool::Pool<T1>, arg16: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg17: &0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::config::GlobalConfig, arg18: u64, arg19: &0x2::clock::Clock, arg20: &mut 0x2::tx_context::TxContext) {
        verify_config_and_owner(arg0, arg1, arg20);
        adjust_sui_balance_from_manager(arg0, arg1, arg3, arg2, true, arg20);
        if (0x2::clock::timestamp_ms(arg19) >= arg18) {
            defi_package::errors::a15c536f8ba435e85(b"expired");
            return
        };
        let v0 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::generate_proof_as_owner(arg3, arg20);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::cancel_all_orders<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg4, arg3, &v0, arg19, arg20);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::withdraw_settled_amounts<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg4, arg3, &v0);
        defi_package::oracle::execute_oracle_trade<T0, T1>(arg1, arg3, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg19, arg20);
    }

    fun verify_config_and_owner(arg0: &TraderAccount, arg1: &defi_package::config::GlobalConfig, arg2: &0x2::tx_context::TxContext) {
        assert!(arg0.config_id == 0x2::object::id<defi_package::config::GlobalConfig>(arg1), 13906835583092654079);
        defi_package::config::verify_owner(arg1, arg2);
    }

    public fun get_total_token_balances(arg0: &TraderAccount) : (u64, u64) {
        defi_package::state::a280ecc58e70fd664(&arg0.a0838fe09e8397d56)
    }

    public fun place_immediate_or_cancel_order(arg0: &TraderAccount, arg1: &defi_package::config::GlobalConfig, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg3: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg4: u64, arg5: u64, arg6: &0x2::clock::Clock, arg7: &mut 0x2::tx_context::TxContext) {
        verify_config_and_owner(arg0, arg1, arg7);
        let v0 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::generate_proof_as_owner(arg2, arg7);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::place_limit_order<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3, arg2, &v0, 0, 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::immediate_or_cancel(), 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::self_matching_allowed(), arg5, arg4, false, false, 0x2::clock::timestamp_ms(arg6) + 1000, arg6, arg7);
    }

    public fun deposit_sui(arg0: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg1: &mut 0x2::coin::Coin<0x2::sui::SUI>, arg2: u64, arg3: &mut 0x2::tx_context::TxContext) {
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::deposit<0x2::sui::SUI>(arg0, 0x2::coin::split<0x2::sui::SUI>(arg1, arg2, arg3), arg3);
        let v0 = BalanceInfo{
            amount : arg2,
            balance_after : 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::balance<0x2::sui::SUI>(arg0),
            is_sui : true,
            is_deposit : true,
        };
        0x2::event::emit<BalanceInfo>(v0);
    }

    public fun withdraw_sui(arg0: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg1: u64, arg2: &mut 0x2::tx_context::TxContext) {
        0x2::transfer::public_transfer<0x2::coin::Coin<0x2::sui::SUI>>(0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::withdraw<0x2::sui::SUI>(arg0, arg1, arg2), 0x2::tx_context::sender(arg2));
        let v0 = BalanceInfo{
            amount : arg1,
            balance_after : 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::balance<0x2::sui::SUI>(arg0),
            is_sui : true,
            is_deposit : false,
        };
        0x2::event::emit<BalanceInfo>(v0);
    }

    public fun update_trading_state(arg0: &mut TraderAccount, arg1: &defi_package::config::GlobalConfig, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg3: &mut 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg4: &0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::version::Version, arg5: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg6: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg7: &0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::config::GlobalConfig, arg8: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::rewarder::RewarderGlobalVault, arg9: &mut 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::fee500bps::FEE500BPS>, arg10: &0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Versioned, arg11: &mut 0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg12: &0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::config::GlobalConfig, arg13: &0x2::clock::Clock, arg14: &mut 0x2::tx_context::TxContext) {
        verify_config_and_owner(arg0, arg1, arg14);
        defi_package::helpers::a3b1c162091168a1d(arg2, &mut arg0.a0838fe09e8397d56, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
    }

    public fun replace_post_only_order(arg0: &TraderAccount, arg1: &defi_package::config::GlobalConfig, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg3: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg4: u64, arg5: u64, arg6: &0x2::clock::Clock, arg7: &mut 0x2::tx_context::TxContext) {
        verify_config_and_owner(arg0, arg1, arg7);
        let v0 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::generate_proof_as_owner(arg2, arg7);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::cancel_all_orders<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3, arg2, &v0, arg6, arg7);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::withdraw_settled_amounts<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3, arg2, &v0);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::place_limit_order<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3, arg2, &v0, 0, 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::post_only(), 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::cancel_taker(), arg5, arg4, true, false, 0x2::clock::timestamp_ms(arg6) + 10000000000, arg6, arg7);
    }

    fun adjust_sui_balance_from_manager(arg0: &TraderAccount, arg1: &defi_package::config::GlobalConfig, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg3: &mut 0x2::coin::Coin<0x2::sui::SUI>, arg4: bool, arg5: &mut 0x2::tx_context::TxContext) {
        let mut v0 = if (arg4) {
            defi_package::config::a035758c2df2aac0a(arg1)
        } else {
            defi_package::config::ab3241576c7b31a2f(arg1)
        };
        if (0x2::coin::value<0x2::sui::SUI>(arg3) >= v0) {
            return
        };
        let mut v1 = if (arg4) {
            defi_package::config::ab7f9bd571f575505(arg1)
        } else {
            defi_package::config::a56fd38bb12b204a1(arg1)
        };
        let v2 = v1 - 0x2::coin::value<0x2::sui::SUI>(arg3);
        let mut v3 = v2;
        let v4 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::balance<0x2::sui::SUI>(arg2);
        if (v4 < v2) {
            v3 = v4;
        };
        let v5 = PositionInfo{
            current_balance : v4,
            adjusted_amount : v3,
        };
        0x2::event::emit<PositionInfo>(v5);
        if (v3 == 0) {
            return
        };
        0x2::coin::join<0x2::sui::SUI>(arg3, 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::withdraw<0x2::sui::SUI>(arg2, v3, arg5));
    }

    public fun get_trading_state_mut(arg0: &mut TraderAccount, arg1: &defi_package::config::GlobalConfig, arg2: &mut 0x2::tx_context::TxContext) : &mut defi_package::state::TradingState {
        verify_config_and_owner(arg0, arg1, arg2);
        &mut arg0.a0838fe09e8397d56
    }

    public fun stake_liquidity(arg0: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg1: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg2: u64, arg3: &mut 0x2::tx_context::TxContext) {
        let v0 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::generate_proof_as_owner(arg0, arg3);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::stake<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg1, arg0, &v0, arg2, arg3);
    }

    public fun place_deep_immediate_or_cancel_order(arg0: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg1: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0xdeeb7a4662eec9f2f3def03fb937a663dddaa2e215b8078a284d026b7946c270::deep::DEEP, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg2: u64, arg3: u64, arg4: &0x2::clock::Clock, arg5: &mut 0x2::tx_context::TxContext) {
        let v0 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::generate_proof_as_owner(arg0, arg5);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::place_limit_order<0xdeeb7a4662eec9f2f3def03fb937a663dddaa2e215b8078a284d026b7946c270::deep::DEEP, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg1, arg0, &v0, 0, 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::immediate_or_cancel(), 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::self_matching_allowed(), arg3, arg2, true, false, 0x2::clock::timestamp_ms(arg4) + 1000, arg4, arg5);
    }

    public fun replace_post_only_order_sell(arg0: &TraderAccount, arg1: &defi_package::config::GlobalConfig, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg3: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg4: u64, arg5: u64, arg6: &0x2::clock::Clock, arg7: &mut 0x2::tx_context::TxContext) {
        verify_config_and_owner(arg0, arg1, arg7);
        let v0 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::generate_proof_as_owner(arg2, arg7);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::cancel_all_orders<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3, arg2, &v0, arg6, arg7);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::withdraw_settled_amounts<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3, arg2, &v0);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::place_limit_order<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3, arg2, &v0, 0, 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::post_only(), 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::cancel_taker(), arg5, arg4, false, false, 0x2::clock::timestamp_ms(arg6) + 10000000000, arg6, arg7);
    }

    public fun deposit_usdc(arg0: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg1: &mut 0x2::coin::Coin<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg2: u64, arg3: &mut 0x2::tx_context::TxContext) {
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::deposit<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg0, 0x2::coin::split<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg1, arg2, arg3), arg3);
        let v0 = BalanceInfo{
            amount : arg2,
            balance_after : 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::balance<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg0),
            is_sui : false,
            is_deposit : true,
        };
        0x2::event::emit<BalanceInfo>(v0);
    }

    public fun create_trader_account(arg0: bool, arg1: &mut 0x2::tx_context::TxContext) {
        let mut v0 = if (arg0) {
            defi_package::config::a8ca7876854a16d35(arg1)
        } else {
            defi_package::config::abc3ae4f61d07f772(arg1)
        };
        let v1 = v0;
        let v2 = TraderAccount{
            id                : 0x2::object::new(arg1),
            config_id : 0x2::object::id<defi_package::config::GlobalConfig>(&v1),
            order_sequence : 0,
            error_counter : 0,
            cumulative_price : 0,
            target_price : 0,
            target_amount : 0,
            priority_counter : 0,
            next_trade_time : 0,
            trading_state : defi_package::state::a75d4519aec44b4ef(),
        };
        0x2::transfer::share_object<TraderAccount>(v2);
        0x2::transfer::public_share_object<defi_package::config::GlobalConfig>(v1);
    }

    public fun place_immediate_or_cancel_order_buy(arg0: &TraderAccount, arg1: &defi_package::config::GlobalConfig, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg3: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg4: u64, arg5: u64, arg6: &0x2::clock::Clock, arg7: &mut 0x2::tx_context::TxContext) {
        verify_config_and_owner(arg0, arg1, arg7);
        let v0 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::generate_proof_as_owner(arg2, arg7);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::place_limit_order<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3, arg2, &v0, 0, 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::immediate_or_cancel(), 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::self_matching_allowed(), arg5, arg4, true, false, 0x2::clock::timestamp_ms(arg6) + 1000, arg6, arg7);
    }

    public fun delay_trading(arg0: &mut TraderAccount, arg1: &defi_package::config::GlobalConfig, arg2: &mut 0x2::coin::Coin<0x2::sui::SUI>, arg3: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg4: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg5: &0x2::clock::Clock, arg6: u64, arg7: u64, arg8: &mut 0x2::tx_context::TxContext) {
        verify_config_and_owner(arg0, arg1, arg8);
        adjust_sui_balance_from_manager(arg0, arg1, arg3, arg2, false, arg8);
        if (0x2::clock::timestamp_ms(arg5) >= arg7) {
            return
        };
        let v0 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::generate_proof_as_owner(arg3, arg8);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::cancel_all_orders<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg4, arg3, &v0, arg5, arg8);
        arg0.next_trade_time = 0x2::clock::timestamp_ms(arg5) + arg6;
        let v1 = DelayEvent{delay_duration: arg6};
        0x2::event::emit<DelayEvent>(v1);
    }

    public fun create_balance_manager(arg0: &mut 0x2::tx_context::TxContext) {
        0x2::transfer::public_share_object<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager>(0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::new(arg0));
    }

    public fun execute_trade(arg0: &mut TraderAccount, arg1: &defi_package::config::GlobalConfig, arg2: &mut 0x2::coin::Coin<0x2::sui::SUI>, arg3: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg4: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg5: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0xdeeb7a4662eec9f2f3def03fb937a663dddaa2e215b8078a284d026b7946c270::deep::DEEP, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg6: &mut 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg7: &0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::version::Version, arg8: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg9: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg10: &0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::config::GlobalConfig, arg11: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::rewarder::RewarderGlobalVault, arg12: &mut 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::fee500bps::FEE500BPS>, arg13: &0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Versioned, arg14: &mut 0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg15: &0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::config::GlobalConfig, arg16: &0x2::clock::Clock, arg17: u64, arg18: u64, arg19: u8, arg20: u64, arg21: u64, arg22: &mut 0x2::tx_context::TxContext) {
        verify_config_and_owner(arg0, arg1, arg22);
        adjust_sui_balance_from_manager(arg0, arg1, arg3, arg2, false, arg22);
        if (0x2::clock::timestamp_ms(arg16) >= arg21) {
            defi_package::errors::a15c536f8ba435e85(b"expired");
            return
        };
        if (0x2::clock::timestamp_ms(arg16) < arg0.a0ee193d93f88cdcb) {
            defi_package::errors::a15c536f8ba435e85(b"cannot_trade");
            return
        };
        if (arg20 > arg0.aac8da939a55f9e08) {
            arg0.target_price = arg17;
            arg0.target_amount = arg18;
            arg0.aac8da939a55f9e08 = arg20;
        };
        let v0 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::generate_proof_as_owner(arg3, arg22);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::withdraw_settled_amounts<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg4, arg3, &v0);
        let v1 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::get_account_order_details<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg4, arg3);
        let v2 = defi_package::math::create_market_data(arg1, arg4, &v1, 8, arg16);
        let mut v3 = defi_package::orders::a95d889fec9e5f721(arg1, arg3, v1, &v2, arg0.target_price, arg16);
        let v4 = OrderDetails{
            market_price : arg17,
            target_price : arg0.target_price,
            target_amount : arg0.target_amount,
            timestamp_ms      : 0x2::clock::timestamp_ms(arg16),
            order_sequence : arg0.order_sequence,
            order_type : arg19,
            bid_prices : *defi_package::math::bid_prices(&v2),
            bid_amounts : *defi_package::math::bid_amounts(&v2),
            ask_prices : *defi_package::math::ask_prices(&v2),
            ask_amounts : *defi_package::math::ask_amounts(&v2),
            price_spread : defi_package::math::bid_price(&v2) - defi_package::math::ask_price(&v2),
            priority_weight : arg20,
            balance_manager_id : 0x2::object::id<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager>(arg3),
            expiry_timestamp : arg21,
        };
        0x2::event::emit<OrderDetails>(v4);
        arg0.order_sequence = arg0.order_sequence + 1;
        defi_package::orders::a38a80653e93a075b(&mut v3, arg1, arg3, &v0, arg4, &mut arg0.a0838fe09e8397d56, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg0.target_price, arg0.target_amount, &v2, arg22);
        defi_package::helpers::a40f8bc58a06c8b33(arg1, &mut arg0.a0838fe09e8397d56, arg3, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg0.target_price, arg0.target_amount, arg16, arg22);
        defi_package::pricing::adc6afbc22cb36f39(arg1, &mut v3, arg3, &v0, &mut arg0.a0838fe09e8397d56, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg4, arg0.target_price, &mut arg0.cumulative_price, arg16, arg22);
        if (arg19 == 0 || arg19 == 1) {
            defi_package::errors::execute_trade_with_safety_checks(arg1, &mut v3, arg3, arg4, &v0, arg5, &mut arg0.a0838fe09e8397d56, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg0.target_price, arg19 == 0, &v2, &mut arg0.error_counter, arg22);
        };
    }

    public fun withdraw_usdc(arg0: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg1: u64, arg2: &mut 0x2::tx_context::TxContext) {
        0x2::transfer::public_transfer<0x2::coin::Coin<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>>(0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::withdraw<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg0, arg1, arg2), 0x2::tx_context::sender(arg2));
        let v0 = BalanceInfo{
            amount : arg1,
            balance_after : 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::balance<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg0),
            is_sui : false,
            is_deposit : false,
        };
        0x2::event::emit<BalanceInfo>(v0);
    }

    public fun get_total_balances(arg0: &TraderAccount, arg1: &0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg2: &0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>) : (u64, u64, u64) {
        let (v0, v1, _) = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::locked_balance<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg2, arg1);
        let (v3, v4) = defi_package::state::a280ecc58e70fd664(&arg0.a0838fe09e8397d56);
        (0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::balance<0x2::sui::SUI>(arg1) + v0 + v4, 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::balance<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg1) + v1 + v3, 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::balance<0xdeeb7a4662eec9f2f3def03fb937a663dddaa2e215b8078a284d026b7946c270::deep::DEEP>(arg1))
    }

    public fun withdraw_generic<T0>(arg0: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg1: u64, arg2: &mut 0x2::tx_context::TxContext) {
        0x2::transfer::public_transfer<0x2::coin::Coin<T0>>(0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::withdraw<T0>(arg0, arg1, arg2), 0x2::tx_context::sender(arg2));
    }

    public fun claim_rebates(arg0: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg1: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg2: &mut 0x2::tx_context::TxContext) {
        let v0 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::generate_proof_as_owner(arg0, arg2);
        0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::claim_rebates<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg1, arg0, &v0, arg2);
    }

    // decompiled from Move bytecode v6
}

