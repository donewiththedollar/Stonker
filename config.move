module defi_package::config {
    public struct FeatureConfig has store {
        is_active: bool,
        is_mandatory: bool,
        threshold_value: u64,
    }

    public struct TradingConfig has store {
        trading_bool_a: bool,
        trading_bool_b: bool,
        price_threshold_a: u64,
        price_threshold_b: u64,
        max_trade_amount_sui: u64,
        max_trade_amount_usdc: u64,
        trade_multiplier: u64,
        trade_fee: u64,
        secondary_trade_limit_sui: u64,
        feature_config_a: FeatureConfig,
        feature_config_b: FeatureConfig,
        feature_config_c: FeatureConfig,
        feature_config_d: FeatureConfig,
        feature_config_e: FeatureConfig,
        feature_config_f: FeatureConfig,
    }

    public struct AccountConfig has store {
        is_account_active: bool,
        min_sui_balance: u64,
        min_usdc_balance: u64,
        allow_withdrawals: bool,
        allow_deposits: bool,
        withdrawal_limit_sui: u64,
        deposit_limit_sui: u64,
    }

    public struct GlobalConfig has store, key {
        id: 0x2::object::UID,
        owner_address: address,
        is_active: bool,
        fee_rate_bps: u64,
        min_price_tick: u64,
        max_price_tick: u64,
        order_expiry_ms: u64,
        sui_limit_a: u64,
        sui_limit_b: u64,
        sui_limit_large_a: u64,
        sui_limit_large_b: u64,
        is_trading_enabled: bool,
        is_monitoring_enabled: bool,
        config_param_d: u64,
        scale_factor: u64,
        multiplier_factor: u64,
        sui_precision: u64,
        usdc_threshold: u64,
        sui_threshold_a: u64,
        sui_threshold_b: u64,
        is_price_filter_enabled: bool,
        price_factor_a: u64,
        price_factor_b: u64,
        trade_multiplier: u64,
        sui_min_trade_amount: u64,
        sui_medium_limit: u64,
        sui_small_limit: u64,
        sui_mid_limit: u64,
        sui_large_threshold: u64,
        trading_config: TradingConfig,
        config_rate_bps: u64,
        account_config: AccountConfig,
    }

    public fun min_price_tick(arg0: &GlobalConfig) : u64 {
        arg0.min_price_tick
    }

    public fun allow_deposits(arg0: &GlobalConfig) : bool {
        arg0.account_config.allow_deposits
    }

    public fun withdrawal_limit_sui(arg0: &GlobalConfig) : u64 {
        arg0.account_config.withdrawal_limit_sui
    }

    public fun set_config_param_d(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.config_param_d = arg1;
    }

    public fun set_feature_config_d_is_mandatory(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_d.is_mandatory = arg1;
    }

    public fun fee_rate_bps(arg0: &GlobalConfig) : u64 {
        arg0.fee_rate_bps
    }

    public fun set_order_expiry_ms(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.order_expiry_ms = arg1;
    }

    public fun sui_threshold_b(arg0: &GlobalConfig) : u64 {
        arg0.sui_threshold_b
    }

    public fun set_secondary_trade_limit_sui(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.secondary_trade_limit_sui = arg1;
    }

    public fun price_threshold_a(arg0: &GlobalConfig) : u64 {
        arg0.trading_config.price_threshold_a
    }

    public fun feature_config_c(arg0: &GlobalConfig) : &FeatureConfig {
        &arg0.trading_config.feature_config_c
    }

    public fun set_fee_rate_bps(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.fee_rate_bps = arg1;
    }

    public fun set_is_account_active(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.account_config.is_account_active = arg1;
    }

    public fun set_sui_precision(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.sui_precision = arg1;
    }

    public fun set_feature_config_e_is_mandatory(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_e.is_mandatory = arg1;
    }

    public fun feature_config_f(arg0: &GlobalConfig) : &FeatureConfig {
        &arg0.trading_config.feature_config_f
    }

    public fun is_mandatory(arg0: &FeatureConfig) : bool {
        arg0.is_mandatory
    }

    public fun verify_owner(arg0: &GlobalConfig, arg1: &0x2::tx_context::TxContext) {
        assert!(arg0.owner_address == 0x2::tx_context::sender(arg1), 13906835381229191167);
    }

    public fun sui_min_trade_amount(arg0: &GlobalConfig) : u64 {
        arg0.sui_min_trade_amount
    }

    public fun set_scale_factor(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.scale_factor = arg1;
    }

    public fun config_rate_bps(arg0: &GlobalConfig) : u64 {
        arg0.config_rate_bps
    }

    public fun sui_threshold_a(arg0: &GlobalConfig) : u64 {
        arg0.sui_threshold_a
    }

    public fun min_sui_balance(arg0: &GlobalConfig) : u64 {
        arg0.account_config.min_sui_balance
    }

    public fun set_withdrawal_limit_sui(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.account_config.withdrawal_limit_sui = arg1;
    }

    public fun set_price_threshold_b(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.price_threshold_b = arg1;
    }

    public fun set_deposit_limit_sui(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.account_config.deposit_limit_sui = arg1;
    }

    public fun config_param_d(arg0: &GlobalConfig) : u64 {
        arg0.config_param_d
    }

    public fun set_min_usdc_balance(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.account_config.min_usdc_balance = arg1;
    }

    public fun set_sui_limit_large_b(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.sui_limit_large_b = arg1;
    }

    public fun set_multiplier_factor(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.multiplier_factor = arg1;
    }

    public fun max_trade_amount_usdc(arg0: &GlobalConfig) : u64 {
        arg0.trading_config.max_trade_amount_usdc
    }

    public fun scale_factor(arg0: &GlobalConfig) : u64 {
        arg0.scale_factor
    }

    public fun set_feature_config_b_threshold_value(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_b.threshold_value = arg1;
    }

    public fun is_account_active(arg0: &GlobalConfig) : bool {
        arg0.account_config.is_account_active
    }

    public fun set_sui_large_threshold(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.sui_large_threshold = arg1;
    }

    public fun set_feature_config_d_is_active(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_d.is_active = arg1;
    }

    public fun set_sui_limit_b(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.sui_limit_b = arg1;
    }

    public fun set_feature_config_b_is_mandatory(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_b.is_mandatory = arg1;
    }

    public fun set_trading_config_trade_multiplier(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.trade_multiplier = arg1;
    }

    public fun set_max_price_tick(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.max_price_tick = arg1;
    }

    public fun feature_config_e(arg0: &GlobalConfig) : &FeatureConfig {
        &arg0.trading_config.feature_config_e
    }

    public fun set_feature_config_d_threshold_value(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_d.threshold_value = arg1;
    }

    public fun set_trading_config_trading_bool_b(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.trading_bool_b = arg1;
    }

    public fun sui_mid_limit(arg0: &GlobalConfig) : u64 {
        arg0.sui_mid_limit
    }

    public fun set_is_monitoring_enabled(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.is_monitoring_enabled = arg1;
    }

    public fun set_trading_enabled_with_cancel(arg0: &mut GlobalConfig, arg1: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg3: bool, arg4: &0x2::clock::Clock, arg5: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg5);
        arg0.is_trading_enabled = arg3;
        arg0.trading_config.trading_bool_b = arg3;
        if (!arg3) {
            let v0 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::generate_proof_as_owner(arg1, arg5);
            0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::cancel_all_orders<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg2, arg1, &v0, arg4, arg5);
        };
    }

    public fun set_account_config_allow_deposits(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.account_config.allow_deposits = arg1;
    }

    public fun allow_withdrawals(arg0: &GlobalConfig) : bool {
        arg0.account_config.allow_withdrawals
    }

    public fun set_min_price_tick(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.min_price_tick = arg1;
    }

    public fun trading_bool_a(arg0: &GlobalConfig) : bool {
        arg0.trading_config.trading_bool_a
    }

    public fun set_sui_medium_limit(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.sui_medium_limit = arg1;
    }

    public fun set_config_rate_bps(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.config_rate_bps = arg1;
    }

    public fun set_feature_config_f_is_mandatory(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_f.is_mandatory = arg1;
    }

    public fun trading_bool_b(arg0: &GlobalConfig) : bool {
        arg0.trading_config.trading_bool_b
    }

    public fun threshold_value(arg0: &FeatureConfig) : u64 {
        arg0.threshold_value
    }

    public fun set_feature_config_c_is_active(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_c.is_active = arg1;
    }

    public fun set_feature_config_f_threshold_value(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_f.threshold_value = arg1;
    }

    public fun price_threshold_b(arg0: &GlobalConfig) : u64 {
        arg0.trading_config.price_threshold_b
    }

    public fun set_account_config_allow_withdrawals(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.account_config.allow_withdrawals = arg1;
    }

    public fun is_trading_enabled(arg0: &GlobalConfig) : bool {
        arg0.is_trading_enabled
    }

    public fun set_feature_config_a_is_mandatory(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_a.is_mandatory = arg1;
    }

    public fun max_trade_amount_sui(arg0: &GlobalConfig) : u64 {
        arg0.trading_config.max_trade_amount_sui
    }

    public fun is_monitoring_enabled(arg0: &GlobalConfig) : bool {
        arg0.is_monitoring_enabled
    }

    public fun price_factor_b(arg0: &GlobalConfig) : u64 {
        arg0.price_factor_b
    }

    public fun set_is_active(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.is_active = arg1;
    }

    public fun new_default_config(arg0: &mut 0x2::tx_context::TxContext) : GlobalConfig {
        let v0 = 1000000000;
        let v1 = FeatureConfig{
            is_active : true,
            is_mandatory : true,
            threshold_value : 1000,
        };
        let v2 = FeatureConfig{
            is_active : true,
            is_mandatory : true,
            threshold_value : 1000,
        };
        let v3 = FeatureConfig{
            is_active : true,
            is_mandatory : true,
            threshold_value : 1000,
        };
        let v4 = FeatureConfig{
            is_active : true,
            is_mandatory : true,
            threshold_value : 1000,
        };
        let v5 = FeatureConfig{
            is_active : true,
            is_mandatory : true,
            threshold_value : 1000,
        };
        let v6 = FeatureConfig{
            is_active : true,
            is_mandatory : true,
            threshold_value : 1000,
        };
        let v7 = TradingConfig{
            trading_bool_a : true,
            trading_bool_b : true,
            price_threshold_a : 500,
            price_threshold_b : 500,
            max_trade_amount_sui : 100 * 1000000000,
            max_trade_amount_usdc : 500 * 1000000000,
            trade_multiplier : 1,
            trade_fee : 200 * 1000000,
            secondary_trade_limit_sui : 200 * 1000000000,
            feature_config_a : v1,
            feature_config_b : v2,
            feature_config_c : v3,
            feature_config_d : v4,
            feature_config_e : v5,
            feature_config_f : v6,
        };
        let v8 = AccountConfig{
            is_account_active : true,
            min_sui_balance : 230000 * 1000000,
            min_usdc_balance : 20000 * 1000000,
            allow_withdrawals : true,
            allow_deposits : true,
            withdrawal_limit_sui : 90 * 1000000000,
            deposit_limit_sui : 100 * 1000000000,
        };
        GlobalConfig{
            id                : 0x2::object::new(arg0),
            owner_address : 0x2::tx_context::sender(arg0),
            is_active : true,
            fee_rate_bps : 500,
            min_price_tick : 1000,
            max_price_tick : 5000,
            numeric_param_c : 60000,
            sui_limit_a : 100 * v0,
            sui_limit_b : 500 * v0,
            sui_limit_large_a : 20000 * v0,
            sui_limit_large_b : 20000 * v0,
            is_trading_enabled : true,
            is_monitoring_enabled : true,
            config_param_d : 2000,
            scale_factor : 10000,
            multiplier_factor : 5,
            sui_precision : v0,
            usdc_threshold : 200000 * 1000000,
            sui_threshold_a : 380 * v0,
            sui_threshold_b : 500 * v0,
            is_price_filter_enabled : true,
            price_factor_a : 100 * 10000,
            price_factor_b : 390 * 10000,
            trade_multiplier : 1,
            sui_min_trade_amount : 500 * 1000000,
            sui_medium_limit : 500 * v0,
            sui_small_limit : 1000000000 / 4,
            sui_mid_limit : 1000000000 / 2,
            sui_large_threshold : 10 * v0,
            trading_config : v7,
            config_rate_bps : 500,
            account_config : v8,
        }
    }

    public fun secondary_trade_limit_sui(arg0: &GlobalConfig) : u64 {
        arg0.trading_config.secondary_trade_limit_sui
    }

    public fun set_feature_config_a_is_active(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_a.is_active = arg1;
    }

    public fun set_account_config_min_sui_balance(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.account_config.min_sui_balance = arg1;
    }

    public fun feature_config_b(arg0: &GlobalConfig) : &FeatureConfig {
        &arg0.trading_config.feature_config_b
    }

    public fun multiplier_factor(arg0: &GlobalConfig) : u64 {
        arg0.multiplier_factor
    }

    public fun set_sui_threshold_b(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.sui_threshold_b = arg1;
    }

    public fun sui_limit_large_a(arg0: &GlobalConfig) : u64 {
        arg0.sui_limit_large_a
    }

    public fun set_feature_config_e_is_active(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_e.is_active = arg1;
    }

    public fun set_trade_multiplier(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trade_multiplier = arg1;
    }

    public fun usdc_threshold(arg0: &GlobalConfig) : u64 {
        arg0.usdc_threshold
    }

    public fun set_sui_threshold_a(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.sui_threshold_a = arg1;
    }

    public fun set_is_price_filter_enabled(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.is_price_filter_enabled = arg1;
    }

    public fun set_sui_limit_large_a(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.sui_limit_large_a = arg1;
    }

    public fun sui_medium_limit(arg0: &GlobalConfig) : u64 {
        arg0.sui_medium_limit
    }

    public fun sui_limit_a(arg0: &GlobalConfig) : u64 {
        arg0.sui_limit_a
    }

    public fun order_expiry_ms(arg0: &GlobalConfig) : u64 {
        arg0.order_expiry_ms
    }

    public fun is_price_filter_enabled(arg0: &GlobalConfig) : bool {
        arg0.is_price_filter_enabled
    }

    public fun set_usdc_threshold(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.usdc_threshold = arg1;
    }

    public fun set_trading_config_trading_bool_a(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.trading_bool_a = arg1;
    }

    public fun set_trading_config_max_trade_amount_sui(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.max_trade_amount_sui = arg1;
    }

    public fun sui_small_limit(arg0: &GlobalConfig) : u64 {
        arg0.sui_small_limit
    }

    public fun sui_limit_large_b(arg0: &GlobalConfig) : u64 {
        arg0.sui_limit_large_b
    }

    public fun sui_limit_b(arg0: &GlobalConfig) : u64 {
        arg0.sui_limit_b
    }

    public fun deposit_limit_sui(arg0: &GlobalConfig) : u64 {
        arg0.account_config.deposit_limit_sui
    }

    public fun set_feature_config_a_threshold_value(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_a.threshold_value = arg1;
    }

    public fun new_custom_config(arg0: &mut 0x2::tx_context::TxContext) : GlobalConfig {
        let mut v0 = new_default_config(arg0);
        v0.sui_threshold_a = 1 * 1000000000;
        v0.sui_threshold_b = 0 * 1000000000;
        v0.sui_min_trade_amount = 5 * 1000000;
        v0.sui_medium_limit = 5 * 1000000000;
        v0.sui_limit_a = 1 * 1000000000;
        v0.sui_limit_b = 1 * 1000000000;
        v0.sui_limit_large_a = 1 * 1000000000;
        v0.sui_limit_large_b = 1 * 1000000000;
        v0.trading_config.max_trade_amount_sui = 2 * 1000000000;
        v0.trading_config.max_trade_amount_usdc = 0 * 1000000000;
        v0.is_active = false;
        v0.is_trading_enabled = false;
        v0.trading_config.trading_bool_a = true;
        v0.trading_config.trading_bool_b = true;
        v0.trading_config.trade_fee = 2 * 1000000;
        v0.trading_config.secondary_trade_limit_sui = 2 * 1000000000;
        v0.trading_config.feature_config_a.is_mandatory = false;
        v0.trading_config.feature_config_a.is_active = false;
        v0.trading_config.feature_config_b.is_mandatory = false;
        v0.trading_config.feature_config_b.is_active = false;
        v0.trading_config.feature_config_d.is_mandatory = false;
        v0.trading_config.feature_config_d.is_active = false;
        v0.trading_config.feature_config_c.is_mandatory = false;
        v0.trading_config.feature_config_c.is_active = false;
        v0.trading_config.feature_config_e.is_mandatory = false;
        v0.trading_config.feature_config_e.is_active = true;
        v0.trading_config.feature_config_f.is_mandatory = false;
        v0.trading_config.feature_config_f.is_active = false;
        v0.sui_small_limit = 3 * 1000000000;
        v0.sui_mid_limit = 4 * 1000000000;
        v0
    }

    public fun set_trading_config_trade_fee(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.trade_fee = arg1;
    }

    public fun set_trading_config_price_threshold_a(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.price_threshold_a = arg1;
    }

    public fun trade_multiplier(arg0: &GlobalConfig) : u64 {
        arg0.trade_multiplier
    }

    public fun set_sui_mid_limit(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.sui_mid_limit = arg1;
    }

    public fun set_feature_config_f_is_active(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_f.is_active = arg1;
    }

    public fun set_trading_config_max_trade_amount_usdc(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.max_trade_amount_usdc = arg1;
    }

    public fun sui_large_threshold(arg0: &GlobalConfig) : u64 {
        arg0.sui_large_threshold
    }

    public fun is_active(arg0: &FeatureConfig) : bool {
        arg0.is_active
    }

    public fun min_usdc_balance(arg0: &GlobalConfig) : u64 {
        arg0.account_config.min_usdc_balance
    }

    public fun sui_precision(arg0: &GlobalConfig) : u64 {
        arg0.sui_precision
    }

    public fun max_price_tick(arg0: &GlobalConfig) : u64 {
        arg0.max_price_tick
    }

    public fun set_feature_config_c_threshold_value(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_c.threshold_value = arg1;
    }

    public fun set_sui_small_limit(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.sui_small_limit = arg1;
    }

    public fun is_active(arg0: &GlobalConfig) : bool {
        arg0.is_active
    }

    public fun trade_fee(arg0: &GlobalConfig) : u64 {
        arg0.trading_config.trade_fee
    }

    public fun set_feature_config_c_is_mandatory(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_c.is_mandatory = arg1;
    }

    public fun set_feature_config_e_threshold_value(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_e.threshold_value = arg1;
    }

    public fun set_price_factor_b(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.price_factor_b = arg1;
    }

    public fun feature_config_d(arg0: &GlobalConfig) : &FeatureConfig {
        &arg0.trading_config.feature_config_d
    }

    public fun set_feature_config_b_is_active(arg0: &mut GlobalConfig, arg1: bool, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.trading_config.feature_config_b.is_active = arg1;
    }

    public fun set_sui_min_trade_amount(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.sui_min_trade_amount = arg1;
    }

    public fun trading_config_trade_multiplier(arg0: &GlobalConfig) : u64 {
        arg0.trading_config.trade_multiplier
    }

    public fun set_price_factor_a(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.price_factor_a = arg1;
    }

    public fun feature_config_a(arg0: &GlobalConfig) : &FeatureConfig {
        &arg0.trading_config.feature_config_a
    }

    public fun price_factor_a(arg0: &GlobalConfig) : u64 {
        arg0.price_factor_a
    }

    public fun set_sui_limit_a(arg0: &mut GlobalConfig, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        verify_owner(arg0, arg2);
        arg0.sui_limit_a = arg1;
    }

    // decompiled from Move bytecode v6
}

