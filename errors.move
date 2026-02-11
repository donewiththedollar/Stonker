module defi_package::errors {
    public struct ErrorEvent has copy, drop {
        error_message: 0x1::string::String,
    }

    public struct DeepTradeEvent has copy, drop {
        deep_amount: u64,
        quote_amount: u64,
    }

    public(friend) fun emit_error(arg0: vector<u8>) {
        let v0 = ErrorEvent{error_message: 0x1::string::utf8(arg0)};
        0x2::event::emit<ErrorEvent>(v0);
    }

    public(friend) fun execute_trade_with_safety_checks(arg0: &defi_package::config::GlobalConfig, arg1: &mut defi_package::orders::OrderManager, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg3: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg4: &0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::TradeProof, arg5: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0xdeeb7a4662eec9f2f3def03fb937a663dddaa2e215b8078a284d026b7946c270::deep::DEEP, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg6: &mut defi_package::state::TradingState, arg7: &mut 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg8: &0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::version::Version, arg9: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg10: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg11: &0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::config::GlobalConfig, arg12: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::rewarder::RewarderGlobalVault, arg13: &mut 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::fee500bps::FEE500BPS>, arg14: &0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Versioned, arg15: &mut 0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg16: &0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::config::GlobalConfig, arg17: &0x2::clock::Clock, arg18: u64, arg19: bool, arg20: &defi_package::math::MarketData, arg21: &mut u64, arg22: &mut 0x2::tx_context::TxContext) {
        if (!defi_package::config::is_active(arg0)) {
            return
        };
        let v0 = arg18 * defi_package::config::fee_rate_bps(arg0) / 1000 / 10000;
        if (arg19 && defi_package::math::bid_price(arg20) + v0 < arg18) {
            let (v1, v2, _) = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::pool_book_params<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3);
            let v4 = (arg18 - v0) / v1 * v1;
            let v5 = defi_package::orders::calculate_order_quantity(arg1, arg0, arg2, defi_package::config::sui_threshold_a(arg0) + 1000000 * (arg18 - defi_package::math::bid_price(arg20) - v0) / defi_package::math::bid_price(arg20) * defi_package::config::sui_threshold_b(arg0) / 100, true);
            let mut v6 = v5;
            defi_package::orders::execute_buy_order(arg1, arg0, arg2, arg4, arg3, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, defi_package::utils::calculate_fee_adjustment(arg0, v5, v4), arg17, arg22);
            let v7 = defi_package::utils::calculate_amount_from_price(arg0, defi_package::utils::get_available_usdc_balance(arg0, arg2), v4);
            let mut v8 = v7;
            let v9 = defi_package::utils::calculate_amount_from_price(arg0, defi_package::config::usdc_threshold(arg0), v4);
            let v10 = defi_package::utils::get_available_sui_balance(arg0, arg2);
            if (v10 >= v9) {
                v8 = 0;
            } else {
                let v11 = v9 - v10;
                if (v7 > v11) {
                    v8 = v11;
                };
            };
            if (v5 > v8) {
                v6 = v8;
            };
            let v12 = v6 / v2 * v2;
            if (v12 < defi_package::config::sui_threshold_a(arg0)) {
                a15c536f8ba435e85(b"at_limit");
                return
            };
            if (v4 > defi_package::config::max_price_tick(arg0)) {
                a15c536f8ba435e85(b"price_limit");
                return
            };
            if (0x2::clock::timestamp_ms(arg17) < *arg21 + defi_package::config::order_expiry_ms(arg0)) {
                a15c536f8ba435e85(b"within_cooldown");
                return
            };
            if (!defi_package::config::is_price_filter_enabled(arg0)) {
                a15c536f8ba435e85(b"not_allowed");
                return
            };
            let (v13, _) = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::get_order_deep_required<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3, v12, v4);
            ensure_deep_balance(arg2, arg4, arg5, v13 * 2, arg17, arg22);
            0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::place_limit_order<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3, arg2, arg4, 0, 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::immediate_or_cancel(), 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::cancel_maker(), v4, v12, true, true, 0x2::clock::timestamp_ms(arg17) + 1000, arg17, arg22);
            *arg21 = 0x2::clock::timestamp_ms(arg17);
        };
        if (!arg19 && arg18 + v0 < defi_package::math::ask_price(arg20)) {
            let (v15, v16, _) = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::pool_book_params<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3);
            let v18 = (arg18 + v0 + v15 - 1) / v15 * v15;
            let v19 = defi_package::orders::calculate_order_quantity(arg1, arg0, arg2, defi_package::config::sui_threshold_a(arg0) + 1000000 * (defi_package::math::ask_price(arg20) - v0 - arg18) / defi_package::math::bid_price(arg20) * defi_package::config::sui_threshold_b(arg0) / 100, false);
            let mut v20 = v19;
            defi_package::orders::execute_sell_order(arg1, arg0, arg2, arg4, arg3, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, v19, arg17, arg22);
            let v21 = defi_package::utils::get_available_sui_balance(arg0, arg2);
            if (v19 > v21) {
                v20 = v21;
            };
            let v22 = v20 / v16 * v16;
            if (v22 < defi_package::config::sui_threshold_a(arg0)) {
                a15c536f8ba435e85(b"at_limit");
                return
            };
            if (v18 < defi_package::config::min_price_tick(arg0)) {
                a15c536f8ba435e85(b"price_limit");
                return
            };
            if (0x2::clock::timestamp_ms(arg17) < *arg21 + defi_package::config::order_expiry_ms(arg0)) {
                a15c536f8ba435e85(b"within_cooldown");
                return
            };
            let (v23, _) = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::get_order_deep_required<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3, v22, v18);
            ensure_deep_balance(arg2, arg4, arg5, v23, arg17, arg22);
            0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::place_limit_order<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg3, arg2, arg4, 0, 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::immediate_or_cancel(), 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::self_matching_allowed(), v18, v22, false, true, 0x2::clock::timestamp_ms(arg17) + 1000, arg17, arg22);
            *arg21 = 0x2::clock::timestamp_ms(arg17);
        };
    }

    fun ensure_deep_balance(arg0: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg1: &0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::TradeProof, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0xdeeb7a4662eec9f2f3def03fb937a663dddaa2e215b8078a284d026b7946c270::deep::DEEP, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg3: u64, arg4: &0x2::clock::Clock, arg5: &0x2::tx_context::TxContext) {
        let v0 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::balance<0xdeeb7a4662eec9f2f3def03fb937a663dddaa2e215b8078a284d026b7946c270::deep::DEEP>(arg0);
        if (v0 >= arg3) {
            return
        };
        let v1 = (arg3 - v0) * 2;
        let mut v2 = v1;
        if (v1 < 10 * 1000000) {
            v2 = 10 * 1000000;
        };
        let (_, v4, _) = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::pool_book_params<0xdeeb7a4662eec9f2f3def03fb937a663dddaa2e215b8078a284d026b7946c270::deep::DEEP, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg2);
        let v6 = v2 / v4 * v4;
        let v7 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::place_market_order<0xdeeb7a4662eec9f2f3def03fb937a663dddaa2e215b8078a284d026b7946c270::deep::DEEP, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg2, arg0, arg1, 0, 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::constants::self_matching_allowed(), v6, true, false, arg4, arg5);
        let v8 = DeepTradeEvent{
            deep_amount : v6,
            quote_amount : 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::order_info::cumulative_quote_quantity(&v7),
        };
        0x2::event::emit<DeepTradeEvent>(v8);
    }

    // decompiled from Move bytecode v6
}

