module defi_package::pricing {
    public struct PriceInfo has copy, drop {
        ac7f210fc32637b79: bool,
        pool: 0x1::string::String,
        aefb8102bf036ff88: u64,
        a8108687c4de4ea83: u128,
        a300f5009218579d6: u128,
        a44bce80f10717132: bool,
        ada1b3c8a2397a876: bool,
    }

    public struct Ae5270409c4a31d29 has copy, drop {
        a31f11751781e6c71: u64,
        a9df70c4191cc59c8: u64,
        ac7f210fc32637b79: bool,
        pool: 0x1::string::String,
        a1c7efc41c3937d9d: u64,
        a7d027a58611a0718: 0x2::object::ID,
    }

    public struct A44dc07697c5e5041 has copy, drop {
        price: u64,
        a4c9f6a30dfcb26d4: u64,
    }

    public struct Ab0784991b4b97608 has copy, drop {
        aab80f1dc57a77584: vector<A44dc07697c5e5041>,
        a8ea67a9d479b4cc3: vector<A44dc07697c5e5041>,
        a888bd220dbabe932: vector<PriceInfo>,
        a1c7efc41c3937d9d: u64,
    }

    fun a143d34c56ac6fc77(arg0: &defi_package::config::GlobalConfig, arg1: &mut defi_package::orders::OrderManager, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg3: &0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::TradeProof, arg4: &mut defi_package::state::TradingState, arg5: &mut 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg6: &0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::version::Version, arg7: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg8: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg9: &0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::config::GlobalConfig, arg10: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::rewarder::RewarderGlobalVault, arg11: &mut 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::fee500bps::FEE500BPS>, arg12: &0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Versioned, arg13: &mut 0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg14: &0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::config::GlobalConfig, arg15: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg16: u64, arg17: &vector<A44dc07697c5e5041>, arg18: u64, arg19: &mut Ab0784991b4b97608, arg20: &0x2::clock::Clock, arg21: &mut 0x2::tx_context::TxContext) {
        let mut v0 = 0;
        while (v0 < 0x1::vector::length<A44dc07697c5e5041>(arg17)) {
            let v1 = 0x1::vector::borrow<A44dc07697c5e5041>(arg17, v0);
            if (defi_package::config::is_price_filter_enabled(arg0) && v1.price + arg18 <= arg16) {
                let v2 = v1.a4c9f6a30dfcb26d4;
                if (v2 == defi_package::state::aab87bac9248ea5a8()) {
                    let v3 = defi_package::swap::a099d08408fdb4a75(0);
                    let v4 = &v3;
                    let mut v5 = PriceInfo{
                        ac7f210fc32637b79 : true,
                        pool              : defi_package::swap::a29522d5809d7e86e(v4),
                        aefb8102bf036ff88 : 0,
                        a8108687c4de4ea83 : 0,
                        a300f5009218579d6 : defi_package::swap::a8a8b4bfff2e7f9e6(v4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14),
                        a44bce80f10717132 : false,
                        ada1b3c8a2397a876 : false,
                    };
                    let mut v5 = if (!defi_package::config::ad3e49cf279957e7d(defi_package::swap::a7ab2afdf1e994bfb(v4, arg0))) {
                        v5
                    } else {
                        let v6 = defi_package::swap::a8a8b4bfff2e7f9e6(v4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                        let v7 = defi_package::config::a0ea1f46e048fbf21(arg0) * arg16 / 10000 / 1000;
                        let v8 = arg16 - v7 - arg16 * defi_package::swap::get_fee_rate(v4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14) / 1000000;
                        v5.aefb8102bf036ff88 = v8;
                        let v9 = defi_package::swap::ac019152139aa990a(v4, v6, v8);
                        v5.a8108687c4de4ea83 = v9;
                        if (defi_package::swap::a3bf20a19fec6c3ca(v4) && v6 >= v9 || !defi_package::swap::a3bf20a19fec6c3ca(v4) && v6 <= v9) {
                            v5
                        } else {
                            let (mut v10, _) = defi_package::swap::ae3e8a1f78ac1be2d(v4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                            let v12 = a3cd6d91ca7350f3f(arg0, arg1, arg2, v10, arg16, true);
                            let mut v13 = v12;
                            let v14 = arg16 - v7;
                            defi_package::orders::a7b7e6cc5534d020a(arg1, arg0, arg2, arg3, arg15, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, defi_package::utils::abe7ab0b8cf6b9d08(arg0, v12, v14), arg20, arg21);
                            let v15 = defi_package::utils::ac89fc20276c7e30c(arg0, defi_package::utils::a9d9f98ebd95b9dad(arg0, arg2), v14);
                            if (v12 > v15) {
                                v13 = v15;
                            };
                            if (v13 < 1 * 1000000000) {
                                v5.a44bce80f10717132 = true;
                                v5
                            } else {
                                let (mut v16, v17) = defi_package::swap::a44e5f8062dd6fde6(v4, arg2, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v13, defi_package::utils::abe7ab0b8cf6b9d08(arg0, v13, v14), v9, arg20, arg21);
                                let v18 = Ae5270409c4a31d29{
                                    a31f11751781e6c71 : v16,
                                    a9df70c4191cc59c8 : v17,
                                    ac7f210fc32637b79 : true,
                                    pool              : defi_package::swap::a29522d5809d7e86e(v4),
                                    a1c7efc41c3937d9d : 0x2::clock::timestamp_ms(arg20),
                                    a7d027a58611a0718 : 0x2::object::id<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager>(arg2),
                                };
                                0x2::event::emit<Ae5270409c4a31d29>(v18);
                                v5.ada1b3c8a2397a876 = true;
                                v5
                            }
                        }
                    };
                    0x1::vector::push_back<PriceInfo>(&mut arg19.a888bd220dbabe932, v5);
                } else if (v2 == defi_package::state::a761ed5468043598f()) {
                    let v19 = defi_package::swap::a099d08408fdb4a75(1);
                    let mut v20 = &v19;
                    let mut v21 = PriceInfo{
                        ac7f210fc32637b79 : true,
                        pool              : defi_package::swap::a29522d5809d7e86e(v20),
                        aefb8102bf036ff88 : 0,
                        a8108687c4de4ea83 : 0,
                        a300f5009218579d6 : defi_package::swap::a8a8b4bfff2e7f9e6(v20, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14),
                        a44bce80f10717132 : false,
                        ada1b3c8a2397a876 : false,
                    };
                    let mut v21 = if (!defi_package::config::ad3e49cf279957e7d(defi_package::swap::a7ab2afdf1e994bfb(v20, arg0))) {
                        v21
                    } else {
                        let v22 = defi_package::swap::a8a8b4bfff2e7f9e6(v20, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                        let v23 = defi_package::config::a0ea1f46e048fbf21(arg0) * arg16 / 10000 / 1000;
                        let v24 = arg16 - v23 - arg16 * defi_package::swap::get_fee_rate(v20, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14) / 1000000;
                        v21.aefb8102bf036ff88 = v24;
                        let mut v25 = defi_package::swap::ac019152139aa990a(v20, v22, v24);
                        v21.a8108687c4de4ea83 = v25;
                        if (defi_package::swap::a3bf20a19fec6c3ca(v20) && v22 >= v25 || !defi_package::swap::a3bf20a19fec6c3ca(v20) && v22 <= v25) {
                            v21
                        } else {
                            let (v26, _) = defi_package::swap::ae3e8a1f78ac1be2d(v20, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                            let v28 = a3cd6d91ca7350f3f(arg0, arg1, arg2, v26, arg16, true);
                            let mut v29 = v28;
                            let v30 = arg16 - v23;
                            defi_package::orders::a7b7e6cc5534d020a(arg1, arg0, arg2, arg3, arg15, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, defi_package::utils::abe7ab0b8cf6b9d08(arg0, v28, v30), arg20, arg21);
                            let v31 = defi_package::utils::ac89fc20276c7e30c(arg0, defi_package::utils::a9d9f98ebd95b9dad(arg0, arg2), v30);
                            if (v28 > v31) {
                                v29 = v31;
                            };
                            if (v29 < 1 * 1000000000) {
                                v21.a44bce80f10717132 = true;
                                v21
                            } else {
                                let (v32, v33) = defi_package::swap::a44e5f8062dd6fde6(v20, arg2, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v29, defi_package::utils::abe7ab0b8cf6b9d08(arg0, v29, v30), v25, arg20, arg21);
                                let v34 = Ae5270409c4a31d29{
                                    a31f11751781e6c71 : v32,
                                    a9df70c4191cc59c8 : v33,
                                    ac7f210fc32637b79 : true,
                                    pool              : defi_package::swap::a29522d5809d7e86e(v20),
                                    a1c7efc41c3937d9d : 0x2::clock::timestamp_ms(arg20),
                                    a7d027a58611a0718 : 0x2::object::id<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager>(arg2),
                                };
                                0x2::event::emit<Ae5270409c4a31d29>(v34);
                                v21.ada1b3c8a2397a876 = true;
                                v21
                            }
                        }
                    };
                    0x1::vector::push_back<PriceInfo>(&mut arg19.a888bd220dbabe932, v21);
                } else if (v2 == defi_package::state::a9706b71488d40615()) {
                    let v35 = defi_package::protocol_mmt::a099d08408fdb4a75();
                    let v36 = &v35;
                    let mut v37 = PriceInfo{
                        ac7f210fc32637b79 : true,
                        pool              : defi_package::protocol_mmt::a29522d5809d7e86e(v36),
                        aefb8102bf036ff88 : 0,
                        a8108687c4de4ea83 : 0,
                        a300f5009218579d6 : defi_package::protocol_mmt::a8a8b4bfff2e7f9e6(v36, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14),
                        a44bce80f10717132 : false,
                        ada1b3c8a2397a876 : false,
                    };
                    let mut v37 = if (!defi_package::config::ad3e49cf279957e7d(defi_package::protocol_mmt::a7ab2afdf1e994bfb(v36, arg0))) {
                        v37
                    } else {
                        let v38 = defi_package::protocol_mmt::a8a8b4bfff2e7f9e6(v36, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                        let v39 = defi_package::config::a0ea1f46e048fbf21(arg0) * arg16 / 10000 / 1000;
                        let v40 = arg16 - v39 - arg16 * defi_package::protocol_mmt::get_fee_rate(v36, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14) / 1000000;
                        v37.aefb8102bf036ff88 = v40;
                        let v41 = defi_package::protocol_mmt::ac019152139aa990a(v36, v38, v40);
                        v37.a8108687c4de4ea83 = v41;
                        if (defi_package::protocol_mmt::a3bf20a19fec6c3ca(v36) && v38 >= v41 || !defi_package::protocol_mmt::a3bf20a19fec6c3ca(v36) && v38 <= v41) {
                            v37
                        } else {
                            let (v42, _) = defi_package::protocol_mmt::ae3e8a1f78ac1be2d(v36, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                            let v44 = a3cd6d91ca7350f3f(arg0, arg1, arg2, v42, arg16, true);
                            let mut v45 = v44;
                            let v46 = arg16 - v39;
                            defi_package::orders::a7b7e6cc5534d020a(arg1, arg0, arg2, arg3, arg15, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, defi_package::utils::abe7ab0b8cf6b9d08(arg0, v44, v46), arg20, arg21);
                            let v47 = defi_package::utils::ac89fc20276c7e30c(arg0, defi_package::utils::a9d9f98ebd95b9dad(arg0, arg2), v46);
                            if (v44 > v47) {
                                v45 = v47;
                            };
                            if (v45 < 1 * 1000000000) {
                                v37.a44bce80f10717132 = true;
                                v37
                            } else {
                                let (v48, v49) = defi_package::protocol_mmt::a44e5f8062dd6fde6(v36, arg2, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v45, defi_package::utils::abe7ab0b8cf6b9d08(arg0, v45, v46), v41, arg20, arg21);
                                let v50 = Ae5270409c4a31d29{
                                    a31f11751781e6c71 : v48,
                                    a9df70c4191cc59c8 : v49,
                                    ac7f210fc32637b79 : true,
                                    pool              : defi_package::protocol_mmt::a29522d5809d7e86e(v36),
                                    a1c7efc41c3937d9d : 0x2::clock::timestamp_ms(arg20),
                                    a7d027a58611a0718 : 0x2::object::id<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager>(arg2),
                                };
                                0x2::event::emit<Ae5270409c4a31d29>(v50);
                                v37.ada1b3c8a2397a876 = true;
                                v37
                            }
                        }
                    };
                    0x1::vector::push_back<PriceInfo>(&mut arg19.a888bd220dbabe932, v37);
                } else if (v2 == defi_package::state::afe80a6b6b615d930()) {
                    let v51 = defi_package::protocol_turbos::a099d08408fdb4a75();
                    let v52 = &v51;
                    let mut v53 = PriceInfo{
                        ac7f210fc32637b79 : true,
                        pool              : defi_package::protocol_turbos::a29522d5809d7e86e(v52),
                        aefb8102bf036ff88 : 0,
                        a8108687c4de4ea83 : 0,
                        a300f5009218579d6 : defi_package::protocol_turbos::a8a8b4bfff2e7f9e6(v52, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14),
                        a44bce80f10717132 : false,
                        ada1b3c8a2397a876 : false,
                    };
                    let mut v53 = if (!defi_package::config::ad3e49cf279957e7d(defi_package::protocol_turbos::a7ab2afdf1e994bfb(v52, arg0))) {
                        v53
                    } else {
                        let v54 = defi_package::protocol_turbos::a8a8b4bfff2e7f9e6(v52, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                        let v55 = defi_package::config::a0ea1f46e048fbf21(arg0) * arg16 / 10000 / 1000;
                        let v56 = arg16 - v55 - arg16 * defi_package::protocol_turbos::get_fee_rate(v52, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14) / 1000000;
                        v53.aefb8102bf036ff88 = v56;
                        let v57 = defi_package::protocol_turbos::ac019152139aa990a(v52, v54, v56);
                        v53.a8108687c4de4ea83 = v57;
                        if (defi_package::protocol_turbos::a3bf20a19fec6c3ca(v52) && v54 >= v57 || !defi_package::protocol_turbos::a3bf20a19fec6c3ca(v52) && v54 <= v57) {
                            v53
                        } else {
                            let (v58, _) = defi_package::protocol_turbos::ae3e8a1f78ac1be2d(v52, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                            let v60 = a3cd6d91ca7350f3f(arg0, arg1, arg2, v58, arg16, true);
                            let mut v61 = v60;
                            let v62 = arg16 - v55;
                            defi_package::orders::a7b7e6cc5534d020a(arg1, arg0, arg2, arg3, arg15, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, defi_package::utils::abe7ab0b8cf6b9d08(arg0, v60, v62), arg20, arg21);
                            let v63 = defi_package::utils::ac89fc20276c7e30c(arg0, defi_package::utils::a9d9f98ebd95b9dad(arg0, arg2), v62);
                            if (v60 > v63) {
                                v61 = v63;
                            };
                            if (v61 < 1 * 1000000000) {
                                v53.a44bce80f10717132 = true;
                                v53
                            } else {
                                let (v64, v65) = defi_package::protocol_turbos::a44e5f8062dd6fde6(v52, arg2, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v61, defi_package::utils::abe7ab0b8cf6b9d08(arg0, v61, v62), v57, arg20, arg21);
                                let v66 = Ae5270409c4a31d29{
                                    a31f11751781e6c71 : v64,
                                    a9df70c4191cc59c8 : v65,
                                    ac7f210fc32637b79 : true,
                                    pool              : defi_package::protocol_turbos::a29522d5809d7e86e(v52),
                                    a1c7efc41c3937d9d : 0x2::clock::timestamp_ms(arg20),
                                    a7d027a58611a0718 : 0x2::object::id<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager>(arg2),
                                };
                                0x2::event::emit<Ae5270409c4a31d29>(v66);
                                v53.ada1b3c8a2397a876 = true;
                                v53
                            }
                        }
                    };
                    0x1::vector::push_back<PriceInfo>(&mut arg19.a888bd220dbabe932, v53);
                } else if (v2 == defi_package::state::af95ffd01d13caab1()) {
                    let v67 = defi_package::protocol_bluefin::a099d08408fdb4a75();
                    let v68 = &v67;
                    let mut v69 = PriceInfo{
                        ac7f210fc32637b79 : true,
                        pool              : defi_package::protocol_bluefin::a29522d5809d7e86e(v68),
                        aefb8102bf036ff88 : 0,
                        a8108687c4de4ea83 : 0,
                        a300f5009218579d6 : defi_package::protocol_bluefin::a8a8b4bfff2e7f9e6(v68, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14),
                        a44bce80f10717132 : false,
                        ada1b3c8a2397a876 : false,
                    };
                    let mut v69 = if (!defi_package::config::ad3e49cf279957e7d(defi_package::protocol_bluefin::a7ab2afdf1e994bfb(v68, arg0))) {
                        v69
                    } else {
                        let v70 = defi_package::protocol_bluefin::a8a8b4bfff2e7f9e6(v68, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                        let v71 = defi_package::config::a0ea1f46e048fbf21(arg0) * arg16 / 10000 / 1000;
                        let v72 = arg16 - v71 - arg16 * defi_package::protocol_bluefin::get_fee_rate(v68, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14) / 1000000;
                        v69.aefb8102bf036ff88 = v72;
                        let v73 = defi_package::protocol_bluefin::ac019152139aa990a(v68, v70, v72);
                        v69.a8108687c4de4ea83 = v73;
                        if (defi_package::protocol_bluefin::a3bf20a19fec6c3ca(v68) && v70 >= v73 || !defi_package::protocol_bluefin::a3bf20a19fec6c3ca(v68) && v70 <= v73) {
                            v69
                        } else {
                            let (v74, _) = defi_package::protocol_bluefin::ae3e8a1f78ac1be2d(v68, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                            let v76 = a3cd6d91ca7350f3f(arg0, arg1, arg2, v74, arg16, true);
                            let mut v77 = v76;
                            let v78 = arg16 - v71;
                            defi_package::orders::a7b7e6cc5534d020a(arg1, arg0, arg2, arg3, arg15, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, defi_package::utils::abe7ab0b8cf6b9d08(arg0, v76, v78), arg20, arg21);
                            let v79 = defi_package::utils::ac89fc20276c7e30c(arg0, defi_package::utils::a9d9f98ebd95b9dad(arg0, arg2), v78);
                            if (v76 > v79) {
                                v77 = v79;
                            };
                            if (v77 < 1 * 1000000000) {
                                v69.a44bce80f10717132 = true;
                                v69
                            } else {
                                let (v80, v81) = defi_package::protocol_bluefin::a44e5f8062dd6fde6(v68, arg2, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v77, defi_package::utils::abe7ab0b8cf6b9d08(arg0, v77, v78), v73, arg20, arg21);
                                let v82 = Ae5270409c4a31d29{
                                    a31f11751781e6c71 : v80,
                                    a9df70c4191cc59c8 : v81,
                                    ac7f210fc32637b79 : true,
                                    pool              : defi_package::protocol_bluefin::a29522d5809d7e86e(v68),
                                    a1c7efc41c3937d9d : 0x2::clock::timestamp_ms(arg20),
                                    a7d027a58611a0718 : 0x2::object::id<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager>(arg2),
                                };
                                0x2::event::emit<Ae5270409c4a31d29>(v82);
                                v69.ada1b3c8a2397a876 = true;
                                v69
                            }
                        }
                    };
                    0x1::vector::push_back<PriceInfo>(&mut arg19.a888bd220dbabe932, v69);
                };
            };
            v0 = v0 + 1;
        };
    }

    public(friend) fun a3cd6d91ca7350f3f(arg0: &defi_package::config::GlobalConfig, arg1: &defi_package::orders::OrderManager, arg2: &0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg3: u64, arg4: u64, arg5: bool) : u64 {
        if (arg5 && arg3 >= arg4) {
            return 0
        };
        if (!arg5 && arg3 <= arg4) {
            return 0
        };
        let v0 = defi_package::utils::ad3e462cd25333e7f(arg3, arg4) * 1000 / arg4 / 10000;
        if (v0 < defi_package::config::a0ea1f46e048fbf21(arg0)) {
            return 0
        };
        defi_package::orders::a2719df4ae928c371(arg1, arg0, arg2, defi_package::config::a7e35067d3a47eeae(arg0) + defi_package::config::a3710772f3b618373(arg0) * (v0 - defi_package::config::a0ea1f46e048fbf21(arg0)) / 1000, arg5)
    }

    fun aa0de02ced96ab01c(arg0: &defi_package::config::GlobalConfig, arg1: &mut defi_package::orders::OrderManager, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg3: &0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::TradeProof, arg4: &mut defi_package::state::TradingState, arg5: &mut 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg6: &0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::version::Version, arg7: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg8: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg9: &0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::config::GlobalConfig, arg10: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::rewarder::RewarderGlobalVault, arg11: &mut 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::fee500bps::FEE500BPS>, arg12: &0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Versioned, arg13: &mut 0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg14: &0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::config::GlobalConfig, arg15: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg16: u64, arg17: &vector<A44dc07697c5e5041>, arg18: u64, arg19: &mut Ab0784991b4b97608, arg20: &0x2::clock::Clock, arg21: &mut 0x2::tx_context::TxContext) {
        let mut v0 = 0;
        while (v0 < 0x1::vector::length<A44dc07697c5e5041>(arg17)) {
            let v1 = 0x1::vector::borrow<A44dc07697c5e5041>(arg17, v0);
            if (v1.price >= arg16 + arg18) {
                let v2 = v1.a4c9f6a30dfcb26d4;
                if (v2 == defi_package::state::aab87bac9248ea5a8()) {
                    let v3 = defi_package::swap::a099d08408fdb4a75(0);
                    let mut v4 = &v3;
                    let mut v5 = PriceInfo{
                        ac7f210fc32637b79 : false,
                        pool              : defi_package::swap::a29522d5809d7e86e(v4),
                        aefb8102bf036ff88 : 0,
                        a8108687c4de4ea83 : 0,
                        a300f5009218579d6 : defi_package::swap::a8a8b4bfff2e7f9e6(v4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14),
                        a44bce80f10717132 : false,
                        ada1b3c8a2397a876 : false,
                    };
                    let mut v5 = if (!defi_package::config::ad3e49cf279957e7d(defi_package::swap::a7ab2afdf1e994bfb(v4, arg0))) {
                        v5
                    } else {
                        let v6 = defi_package::swap::a8a8b4bfff2e7f9e6(v4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                        let v7 = arg16 + defi_package::config::a0ea1f46e048fbf21(arg0) * arg16 / 10000 / 1000 + arg16 * defi_package::swap::get_fee_rate(v4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14) / 1000000;
                        v5.aefb8102bf036ff88 = v7;
                        let v8 = defi_package::swap::a213fd2a6b463b66d(v4, v6, v7);
                        v5.a8108687c4de4ea83 = v8;
                        if (defi_package::swap::a3bf20a19fec6c3ca(v4) && v6 <= v8 || !defi_package::swap::a3bf20a19fec6c3ca(v4) && v6 >= v8) {
                            v5
                        } else {
                            let (mut _, v10) = defi_package::swap::ae3e8a1f78ac1be2d(v4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                            let v11 = a3cd6d91ca7350f3f(arg0, arg1, arg2, v10, arg16, false);
                            let mut v12 = v11;
                            defi_package::orders::a7e4799d1951fe624(arg1, arg0, arg2, arg3, arg15, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v11, arg20, arg21);
                            let v13 = defi_package::utils::ab78d0325509532d4(arg0, arg2);
                            if (v11 > v13) {
                                v12 = v13;
                            };
                            if (v12 < 1 * 1000000000) {
                                v5.a44bce80f10717132 = true;
                                v5
                            } else {
                                let (v14, mut v15) = defi_package::swap::af81a08da76e37dc0(v4, arg2, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v12, v8, arg20, arg21);
                                let v16 = Ae5270409c4a31d29{
                                    a31f11751781e6c71 : v14,
                                    a9df70c4191cc59c8 : v15,
                                    ac7f210fc32637b79 : false,
                                    pool              : defi_package::swap::a29522d5809d7e86e(v4),
                                    a1c7efc41c3937d9d : 0x2::clock::timestamp_ms(arg20),
                                    a7d027a58611a0718 : 0x2::object::id<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager>(arg2),
                                };
                                0x2::event::emit<Ae5270409c4a31d29>(v16);
                                v5.ada1b3c8a2397a876 = true;
                                v5
                            }
                        }
                    };
                    0x1::vector::push_back<PriceInfo>(&mut arg19.a888bd220dbabe932, v5);
                } else if (v2 == defi_package::state::a761ed5468043598f()) {
                    let v17 = defi_package::swap::a099d08408fdb4a75(1);
                    let v18 = &v17;
                    let mut v19 = PriceInfo{
                        ac7f210fc32637b79 : false,
                        pool              : defi_package::swap::a29522d5809d7e86e(v18),
                        aefb8102bf036ff88 : 0,
                        a8108687c4de4ea83 : 0,
                        a300f5009218579d6 : defi_package::swap::a8a8b4bfff2e7f9e6(v18, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14),
                        a44bce80f10717132 : false,
                        ada1b3c8a2397a876 : false,
                    };
                    let mut v19 = if (!defi_package::config::ad3e49cf279957e7d(defi_package::swap::a7ab2afdf1e994bfb(v18, arg0))) {
                        v19
                    } else {
                        let v20 = defi_package::swap::a8a8b4bfff2e7f9e6(v18, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                        let v21 = arg16 + defi_package::config::a0ea1f46e048fbf21(arg0) * arg16 / 10000 / 1000 + arg16 * defi_package::swap::get_fee_rate(v18, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14) / 1000000;
                        v19.aefb8102bf036ff88 = v21;
                        let v22 = defi_package::swap::a213fd2a6b463b66d(v18, v20, v21);
                        v19.a8108687c4de4ea83 = v22;
                        if (defi_package::swap::a3bf20a19fec6c3ca(v18) && v20 <= v22 || !defi_package::swap::a3bf20a19fec6c3ca(v18) && v20 >= v22) {
                            v19
                        } else {
                            let (mut _, v24) = defi_package::swap::ae3e8a1f78ac1be2d(v18, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                            let v25 = a3cd6d91ca7350f3f(arg0, arg1, arg2, v24, arg16, false);
                            let mut v26 = v25;
                            defi_package::orders::a7e4799d1951fe624(arg1, arg0, arg2, arg3, arg15, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v25, arg20, arg21);
                            let v27 = defi_package::utils::ab78d0325509532d4(arg0, arg2);
                            if (v25 > v27) {
                                v26 = v27;
                            };
                            if (v26 < 1 * 1000000000) {
                                v19.a44bce80f10717132 = true;
                                v19
                            } else {
                                let (v28, v29) = defi_package::swap::af81a08da76e37dc0(v18, arg2, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v26, v22, arg20, arg21);
                                let v30 = Ae5270409c4a31d29{
                                    a31f11751781e6c71 : v28,
                                    a9df70c4191cc59c8 : v29,
                                    ac7f210fc32637b79 : false,
                                    pool              : defi_package::swap::a29522d5809d7e86e(v18),
                                    a1c7efc41c3937d9d : 0x2::clock::timestamp_ms(arg20),
                                    a7d027a58611a0718 : 0x2::object::id<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager>(arg2),
                                };
                                0x2::event::emit<Ae5270409c4a31d29>(v30);
                                v19.ada1b3c8a2397a876 = true;
                                v19
                            }
                        }
                    };
                    0x1::vector::push_back<PriceInfo>(&mut arg19.a888bd220dbabe932, v19);
                } else if (v2 == defi_package::state::a9706b71488d40615()) {
                    let v31 = defi_package::protocol_mmt::a099d08408fdb4a75();
                    let v32 = &v31;
                    let mut v33 = PriceInfo{
                        ac7f210fc32637b79 : false,
                        pool              : defi_package::protocol_mmt::a29522d5809d7e86e(v32),
                        aefb8102bf036ff88 : 0,
                        a8108687c4de4ea83 : 0,
                        a300f5009218579d6 : defi_package::protocol_mmt::a8a8b4bfff2e7f9e6(v32, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14),
                        a44bce80f10717132 : false,
                        ada1b3c8a2397a876 : false,
                    };
                    let mut v33 = if (!defi_package::config::ad3e49cf279957e7d(defi_package::protocol_mmt::a7ab2afdf1e994bfb(v32, arg0))) {
                        v33
                    } else {
                        let v34 = defi_package::protocol_mmt::a8a8b4bfff2e7f9e6(v32, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                        let v35 = arg16 + defi_package::config::a0ea1f46e048fbf21(arg0) * arg16 / 10000 / 1000 + arg16 * defi_package::protocol_mmt::get_fee_rate(v32, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14) / 1000000;
                        v33.aefb8102bf036ff88 = v35;
                        let v36 = defi_package::protocol_mmt::a213fd2a6b463b66d(v32, v34, v35);
                        v33.a8108687c4de4ea83 = v36;
                        if (defi_package::protocol_mmt::a3bf20a19fec6c3ca(v32) && v34 <= v36 || !defi_package::protocol_mmt::a3bf20a19fec6c3ca(v32) && v34 >= v36) {
                            v33
                        } else {
                            let (_, v38) = defi_package::protocol_mmt::ae3e8a1f78ac1be2d(v32, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                            let v39 = a3cd6d91ca7350f3f(arg0, arg1, arg2, v38, arg16, false);
                            let mut v40 = v39;
                            defi_package::orders::a7e4799d1951fe624(arg1, arg0, arg2, arg3, arg15, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v39, arg20, arg21);
                            let v41 = defi_package::utils::ab78d0325509532d4(arg0, arg2);
                            if (v39 > v41) {
                                v40 = v41;
                            };
                            if (v40 < 1 * 1000000000) {
                                v33.a44bce80f10717132 = true;
                                v33
                            } else {
                                let (v42, v43) = defi_package::protocol_mmt::af81a08da76e37dc0(v32, arg2, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v40, v36, arg20, arg21);
                                let v44 = Ae5270409c4a31d29{
                                    a31f11751781e6c71 : v42,
                                    a9df70c4191cc59c8 : v43,
                                    ac7f210fc32637b79 : false,
                                    pool              : defi_package::protocol_mmt::a29522d5809d7e86e(v32),
                                    a1c7efc41c3937d9d : 0x2::clock::timestamp_ms(arg20),
                                    a7d027a58611a0718 : 0x2::object::id<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager>(arg2),
                                };
                                0x2::event::emit<Ae5270409c4a31d29>(v44);
                                v33.ada1b3c8a2397a876 = true;
                                v33
                            }
                        }
                    };
                    0x1::vector::push_back<PriceInfo>(&mut arg19.a888bd220dbabe932, v33);
                } else if (v2 == defi_package::state::afe80a6b6b615d930()) {
                    let v45 = defi_package::protocol_turbos::a099d08408fdb4a75();
                    let v46 = &v45;
                    let mut v47 = PriceInfo{
                        ac7f210fc32637b79 : false,
                        pool              : defi_package::protocol_turbos::a29522d5809d7e86e(v46),
                        aefb8102bf036ff88 : 0,
                        a8108687c4de4ea83 : 0,
                        a300f5009218579d6 : defi_package::protocol_turbos::a8a8b4bfff2e7f9e6(v46, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14),
                        a44bce80f10717132 : false,
                        ada1b3c8a2397a876 : false,
                    };
                    let mut v47 = if (!defi_package::config::ad3e49cf279957e7d(defi_package::protocol_turbos::a7ab2afdf1e994bfb(v46, arg0))) {
                        v47
                    } else {
                        let v48 = defi_package::protocol_turbos::a8a8b4bfff2e7f9e6(v46, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                        let v49 = arg16 + defi_package::config::a0ea1f46e048fbf21(arg0) * arg16 / 10000 / 1000 + arg16 * defi_package::protocol_turbos::get_fee_rate(v46, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14) / 1000000;
                        v47.aefb8102bf036ff88 = v49;
                        let v50 = defi_package::protocol_turbos::a213fd2a6b463b66d(v46, v48, v49);
                        v47.a8108687c4de4ea83 = v50;
                        if (defi_package::protocol_turbos::a3bf20a19fec6c3ca(v46) && v48 <= v50 || !defi_package::protocol_turbos::a3bf20a19fec6c3ca(v46) && v48 >= v50) {
                            v47
                        } else {
                            let (_, v52) = defi_package::protocol_turbos::ae3e8a1f78ac1be2d(v46, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                            let v53 = a3cd6d91ca7350f3f(arg0, arg1, arg2, v52, arg16, false);
                            let mut v54 = v53;
                            defi_package::orders::a7e4799d1951fe624(arg1, arg0, arg2, arg3, arg15, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v53, arg20, arg21);
                            let v55 = defi_package::utils::ab78d0325509532d4(arg0, arg2);
                            if (v53 > v55) {
                                v54 = v55;
                            };
                            if (v54 < 1 * 1000000000) {
                                v47.a44bce80f10717132 = true;
                                v47
                            } else {
                                let (v56, v57) = defi_package::protocol_turbos::af81a08da76e37dc0(v46, arg2, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v54, v50, arg20, arg21);
                                let v58 = Ae5270409c4a31d29{
                                    a31f11751781e6c71 : v56,
                                    a9df70c4191cc59c8 : v57,
                                    ac7f210fc32637b79 : false,
                                    pool              : defi_package::protocol_turbos::a29522d5809d7e86e(v46),
                                    a1c7efc41c3937d9d : 0x2::clock::timestamp_ms(arg20),
                                    a7d027a58611a0718 : 0x2::object::id<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager>(arg2),
                                };
                                0x2::event::emit<Ae5270409c4a31d29>(v58);
                                v47.ada1b3c8a2397a876 = true;
                                v47
                            }
                        }
                    };
                    0x1::vector::push_back<PriceInfo>(&mut arg19.a888bd220dbabe932, v47);
                } else if (v2 == defi_package::state::af95ffd01d13caab1()) {
                    let v59 = defi_package::protocol_bluefin::a099d08408fdb4a75();
                    let v60 = &v59;
                    let mut v61 = PriceInfo{
                        ac7f210fc32637b79 : false,
                        pool              : defi_package::protocol_bluefin::a29522d5809d7e86e(v60),
                        aefb8102bf036ff88 : 0,
                        a8108687c4de4ea83 : 0,
                        a300f5009218579d6 : defi_package::protocol_bluefin::a8a8b4bfff2e7f9e6(v60, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14),
                        a44bce80f10717132 : false,
                        ada1b3c8a2397a876 : false,
                    };
                    let mut v61 = if (!defi_package::config::ad3e49cf279957e7d(defi_package::protocol_bluefin::a7ab2afdf1e994bfb(v60, arg0))) {
                        v61
                    } else {
                        let v62 = defi_package::protocol_bluefin::a8a8b4bfff2e7f9e6(v60, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                        let v63 = arg16 + defi_package::config::a0ea1f46e048fbf21(arg0) * arg16 / 10000 / 1000 + arg16 * defi_package::protocol_bluefin::get_fee_rate(v60, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14) / 1000000;
                        v61.aefb8102bf036ff88 = v63;
                        let v64 = defi_package::protocol_bluefin::a213fd2a6b463b66d(v60, v62, v63);
                        v61.a8108687c4de4ea83 = v64;
                        if (defi_package::protocol_bluefin::a3bf20a19fec6c3ca(v60) && v62 <= v64 || !defi_package::protocol_bluefin::a3bf20a19fec6c3ca(v60) && v62 >= v64) {
                            v61
                        } else {
                            let (_, v66) = defi_package::protocol_bluefin::ae3e8a1f78ac1be2d(v60, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
                            let v67 = a3cd6d91ca7350f3f(arg0, arg1, arg2, v66, arg16, false);
                            let mut v68 = v67;
                            defi_package::orders::a7e4799d1951fe624(arg1, arg0, arg2, arg3, arg15, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v67, arg20, arg21);
                            let v69 = defi_package::utils::ab78d0325509532d4(arg0, arg2);
                            if (v67 > v69) {
                                v68 = v69;
                            };
                            if (v68 < 1 * 1000000000) {
                                v61.a44bce80f10717132 = true;
                                v61
                            } else {
                                let (v70, v71) = defi_package::protocol_bluefin::af81a08da76e37dc0(v60, arg2, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, v68, v64, arg20, arg21);
                                let v72 = Ae5270409c4a31d29{
                                    a31f11751781e6c71 : v70,
                                    a9df70c4191cc59c8 : v71,
                                    ac7f210fc32637b79 : false,
                                    pool              : defi_package::protocol_bluefin::a29522d5809d7e86e(v60),
                                    a1c7efc41c3937d9d : 0x2::clock::timestamp_ms(arg20),
                                    a7d027a58611a0718 : 0x2::object::id<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager>(arg2),
                                };
                                0x2::event::emit<Ae5270409c4a31d29>(v72);
                                v61.ada1b3c8a2397a876 = true;
                                v61
                            }
                        }
                    };
                    0x1::vector::push_back<PriceInfo>(&mut arg19.a888bd220dbabe932, v61);
                };
            };
            v0 = v0 + 1;
        };
    }

    public(friend) fun adc6afbc22cb36f39(arg0: &defi_package::config::GlobalConfig, arg1: &mut defi_package::orders::OrderManager, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg3: &0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::TradeProof, arg4: &mut defi_package::state::TradingState, arg5: &mut 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg6: &0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::version::Version, arg7: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg8: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg9: &0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::config::GlobalConfig, arg10: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::rewarder::RewarderGlobalVault, arg11: &mut 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::fee500bps::FEE500BPS>, arg12: &0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Versioned, arg13: &mut 0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg14: &0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::config::GlobalConfig, arg15: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg16: u64, arg17: &mut u64, arg18: &0x2::clock::Clock, arg19: &mut 0x2::tx_context::TxContext) {
        if (!defi_package::config::a633fa15402372c35(arg0)) {
            return
        };
        if (0x2::clock::timestamp_ms(arg18) < *arg17 + defi_package::config::ae9a4ee60c1c9da40(arg0)) {
            return
        };
        let mut v0 = 0x1::vector::empty<A44dc07697c5e5041>();
        let mut v1 = 0x1::vector::empty<A44dc07697c5e5041>();
        let v2 = defi_package::state::aab87bac9248ea5a8();
        let v3 = defi_package::swap::a099d08408fdb4a75(0);
        let (v4, v5) = defi_package::swap::ae3e8a1f78ac1be2d(&v3, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
        let v6 = A44dc07697c5e5041{
            price             : v4,
            a4c9f6a30dfcb26d4 : v2,
        };
        0x1::vector::push_back<A44dc07697c5e5041>(&mut v0, v6);
        let v7 = A44dc07697c5e5041{
            price             : v5,
            a4c9f6a30dfcb26d4 : v2,
        };
        0x1::vector::push_back<A44dc07697c5e5041>(&mut v1, v7);
        let v8 = defi_package::state::a761ed5468043598f();
        let v9 = defi_package::swap::a099d08408fdb4a75(1);
        let (v10, v11) = defi_package::swap::ae3e8a1f78ac1be2d(&v9, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
        let v12 = A44dc07697c5e5041{
            price             : v10,
            a4c9f6a30dfcb26d4 : v8,
        };
        0x1::vector::push_back<A44dc07697c5e5041>(&mut v0, v12);
        let v13 = A44dc07697c5e5041{
            price             : v11,
            a4c9f6a30dfcb26d4 : v8,
        };
        0x1::vector::push_back<A44dc07697c5e5041>(&mut v1, v13);
        let v14 = defi_package::state::a9706b71488d40615();
        let v15 = defi_package::protocol_mmt::a099d08408fdb4a75();
        let (v16, v17) = defi_package::protocol_mmt::ae3e8a1f78ac1be2d(&v15, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
        let v18 = A44dc07697c5e5041{
            price             : v16,
            a4c9f6a30dfcb26d4 : v14,
        };
        0x1::vector::push_back<A44dc07697c5e5041>(&mut v0, v18);
        let v19 = A44dc07697c5e5041{
            price             : v17,
            a4c9f6a30dfcb26d4 : v14,
        };
        0x1::vector::push_back<A44dc07697c5e5041>(&mut v1, v19);
        let v20 = defi_package::state::afe80a6b6b615d930();
        let v21 = defi_package::protocol_turbos::a099d08408fdb4a75();
        let (v22, v23) = defi_package::protocol_turbos::ae3e8a1f78ac1be2d(&v21, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
        let v24 = A44dc07697c5e5041{
            price             : v22,
            a4c9f6a30dfcb26d4 : v20,
        };
        0x1::vector::push_back<A44dc07697c5e5041>(&mut v0, v24);
        let v25 = A44dc07697c5e5041{
            price             : v23,
            a4c9f6a30dfcb26d4 : v20,
        };
        0x1::vector::push_back<A44dc07697c5e5041>(&mut v1, v25);
        let v26 = defi_package::state::af95ffd01d13caab1();
        let v27 = defi_package::protocol_bluefin::a099d08408fdb4a75();
        let (v28, v29) = defi_package::protocol_bluefin::ae3e8a1f78ac1be2d(&v27, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
        let v30 = A44dc07697c5e5041{
            price             : v28,
            a4c9f6a30dfcb26d4 : v26,
        };
        0x1::vector::push_back<A44dc07697c5e5041>(&mut v0, v30);
        let v31 = A44dc07697c5e5041{
            price             : v29,
            a4c9f6a30dfcb26d4 : v26,
        };
        0x1::vector::push_back<A44dc07697c5e5041>(&mut v1, v31);
        let mut v32 = Ab0784991b4b97608{
            aab80f1dc57a77584 : v0,
            a8ea67a9d479b4cc3 : v1,
            a888bd220dbabe932 : 0x1::vector::empty<PriceInfo>(),
            a1c7efc41c3937d9d : 0x2::clock::timestamp_ms(arg18),
        };
        let v33 = &mut v0;
        let v34 = 0x1::vector::length<A44dc07697c5e5041>(v33);
        if (v34 <= 1) {
        } else {
            let mut v35 = 0;
            while (v35 < v34) {
                let mut v36 = 0;
                let mut v37 = false;
                while (v36 < v34 - v35 - 1) {
                    let v38 = 0x1::vector::borrow<A44dc07697c5e5041>(v33, v36);
                    let v39 = 0x1::vector::borrow<A44dc07697c5e5041>(v33, v36 + 1);
                    let v40 = *v38;
                    let v41 = *v39;
                    if (!(v40.price < v41.price)) {
                        *0x1::vector::borrow_mut<A44dc07697c5e5041>(v33, v36) = *v39;
                        *0x1::vector::borrow_mut<A44dc07697c5e5041>(v33, v36 + 1) = *v38;
                        v37 = true;
                    };
                    v36 = v36 + 1;
                };
                if (!v37) {
                    break
                };
                v35 = v35 + 1;
            };
        };
        let v42 = &mut v1;
        let v43 = 0x1::vector::length<A44dc07697c5e5041>(v42);
        if (v43 <= 1) {
        } else {
            let mut v44 = 0;
            while (v44 < v43) {
                let mut v45 = 0;
                let mut v46 = false;
                while (v45 < v43 - v44 - 1) {
                    let v47 = 0x1::vector::borrow<A44dc07697c5e5041>(v42, v45);
                    let v48 = 0x1::vector::borrow<A44dc07697c5e5041>(v42, v45 + 1);
                    let v49 = *v47;
                    let v50 = *v48;
                    if (!(v49.price > v50.price)) {
                        *0x1::vector::borrow_mut<A44dc07697c5e5041>(v42, v45) = *v48;
                        *0x1::vector::borrow_mut<A44dc07697c5e5041>(v42, v45 + 1) = *v47;
                        v46 = true;
                    };
                    v45 = v45 + 1;
                };
                if (!v46) {
                    break
                };
                v44 = v44 + 1;
            };
        };
        let v51 = defi_package::config::a0ea1f46e048fbf21(arg0) * arg16 / 10000 / 1000;
        if (0x1::vector::borrow<A44dc07697c5e5041>(&v0, 0).price + v51 > arg16 && 0x1::vector::borrow<A44dc07697c5e5041>(&v1, 0).price < arg16 + v51) {
            0x2::event::emit<Ab0784991b4b97608>(v32);
            return
        };
        let v52 = &mut v32;
        a143d34c56ac6fc77(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, &v0, v51, v52, arg18, arg19);
        let v53 = &mut v32;
        aa0de02ced96ab01c(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, &v1, v51, v53, arg18, arg19);
        let v54 = &v32.a888bd220dbabe932;
        let mut v55 = 0;
        while (v55 < 0x1::vector::length<PriceInfo>(v54)) {
            if (0x1::vector::borrow<PriceInfo>(v54, v55).ada1b3c8a2397a876) {
                *arg17 = 0x2::clock::timestamp_ms(arg18);
            };
            v55 = v55 + 1;
        };
        0x2::event::emit<Ab0784991b4b97608>(v32);
    }

    // decompiled from Move bytecode v6
}

