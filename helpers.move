module defi_package::helpers {
    public(friend) fun a3b1c162091168a1d(arg0: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg1: &mut defi_package::state::TradingState, arg2: &mut 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg3: &0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::version::Version, arg4: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg5: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg6: &0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::config::GlobalConfig, arg7: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::rewarder::RewarderGlobalVault, arg8: &mut 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::fee500bps::FEE500BPS>, arg9: &0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Versioned, arg10: &mut 0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg11: &0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::config::GlobalConfig, arg12: &0x2::clock::Clock, arg13: &mut 0x2::tx_context::TxContext) {
        defi_package::state::aab87bac9248ea5a8();
        let v0 = defi_package::swap::a099d08408fdb4a75(0);
        defi_package::swap::ab41250516cb88a81(&v0, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13);
        defi_package::state::a761ed5468043598f();
        let v1 = defi_package::swap::a099d08408fdb4a75(1);
        defi_package::swap::ab41250516cb88a81(&v1, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13);
        defi_package::state::a9706b71488d40615();
        let v2 = defi_package::protocol_mmt::a099d08408fdb4a75();
        defi_package::protocol_mmt::ab41250516cb88a81(&v2, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13);
    }

    public(friend) fun a40f8bc58a06c8b33(arg0: &defi_package::config::GlobalConfig, arg1: &mut defi_package::state::TradingState, arg2: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg3: &mut 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg4: &0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::version::Version, arg5: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg6: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg7: &0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::config::GlobalConfig, arg8: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::rewarder::RewarderGlobalVault, arg9: &mut 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::fee500bps::FEE500BPS>, arg10: &0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Versioned, arg11: &mut 0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg12: &0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::config::GlobalConfig, arg13: u64, arg14: u64, arg15: &0x2::clock::Clock, arg16: &mut 0x2::tx_context::TxContext) {
        if (!defi_package::config::a6b29e084f28cbe0e(arg0)) {
            return
        };
        defi_package::state::aab87bac9248ea5a8();
        let v0 = defi_package::swap::a099d08408fdb4a75(0);
        let v1 = &v0;
        let v2 = defi_package::swap::a558d3d4811fa675d(v1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
        let v3 = defi_package::config::a784c790c0b310a69(arg0) * arg13 / 10000 / 1000;
        let mut v4 = v3;
        if (arg14 > defi_package::config::a31f95bf83694efb8(arg0)) {
            v4 = v3 * (10000 + defi_package::config::a95922dffece9e7da(arg0) * (arg14 - defi_package::config::a31f95bf83694efb8(arg0))) / 10000;
        };
        let mut v5 = defi_package::utils::ad3e462cd25333e7f(v2, arg13) + v4 <= defi_package::swap::ac4104d3c58483259(v1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, v2);
        if (arg14 >= defi_package::config::a3a9b9d10c7fad14a(arg0)) {
            v5 = false;
        };
        if (!v5) {
            defi_package::swap::ab41250516cb88a81(v1, arg2, arg1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg15, arg16);
        } else {
            let v6 = defi_package::swap::a7ab2afdf1e994bfb(v1, arg0);
            if (!defi_package::config::a1c974970f8a64e97(v6)) {
            } else {
                let v7 = defi_package::swap::aa8fecb213cfb45e1(v1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
                let v8 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::div(defi_package::swap::a99ab6d0cf8644a81(v1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12), v7);
                let v9 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::mul(0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::sub(v8, 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::from_u32(1)), v7);
                let v10 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::mul(0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::add(v8, 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::from_u32(1)), v7);
                let v11 = defi_package::swap::a1d4c92881210dfd5(v1, arg1);
                if (defi_package::state::a86e56d31feeb19a6(&v11) == v9 && defi_package::state::a21b8c64204576499(&v11) == v10) {
                } else {
                    defi_package::swap::ab41250516cb88a81(v1, arg2, arg1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg15, arg16);
                    let v12 = defi_package::utils::a9d9f98ebd95b9dad(arg0, arg2);
                    let v13 = defi_package::utils::ab78d0325509532d4(arg0, arg2);
                    let v14 = defi_package::config::ae2894da560e9dfaf(arg0);
                    let mut v15 = if (v12 < v14) {
                        v12
                    } else {
                        v14
                    };
                    let v16 = defi_package::config::a8f57f404176c397b(arg0);
                    let mut v17 = if (v13 < v16) {
                        v13
                    } else {
                        v16
                    };
                    let v18 = defi_package::config::a70cd9a0f5ac83e39(v6);
                    let v19 = v15 * v18 / 1000;
                    let v20 = v17 * v18 / 1000;
                    if (v19 < 1 * 1000000 || v20 < 1 * 1000000000) {
                    } else {
                        defi_package::swap::a40983b85c0ec093b(v1, arg2, arg1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, v9, v10, v19, v20, arg15, arg16);
                    };
                };
            };
        };
        defi_package::state::a761ed5468043598f();
        let v21 = defi_package::swap::a099d08408fdb4a75(1);
        let v22 = &v21;
        let v23 = defi_package::swap::a558d3d4811fa675d(v22, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
        let v24 = defi_package::config::a784c790c0b310a69(arg0) * arg13 / 10000 / 1000;
        let mut v25 = v24;
        if (arg14 > defi_package::config::a31f95bf83694efb8(arg0)) {
            v25 = v24 * (10000 + defi_package::config::a95922dffece9e7da(arg0) * (arg14 - defi_package::config::a31f95bf83694efb8(arg0))) / 10000;
        };
        let mut v26 = defi_package::utils::ad3e462cd25333e7f(v23, arg13) + v25 <= defi_package::swap::ac4104d3c58483259(v22, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, v23);
        if (arg14 >= defi_package::config::a3a9b9d10c7fad14a(arg0)) {
            v26 = false;
        };
        if (!v26) {
            defi_package::swap::ab41250516cb88a81(v22, arg2, arg1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg15, arg16);
        } else {
            let v27 = defi_package::swap::a7ab2afdf1e994bfb(v22, arg0);
            if (!defi_package::config::a1c974970f8a64e97(v27)) {
            } else {
                let v28 = defi_package::swap::aa8fecb213cfb45e1(v22, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
                let v29 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::div(defi_package::swap::a99ab6d0cf8644a81(v22, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12), v28);
                let v30 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::mul(0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::sub(v29, 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::from_u32(1)), v28);
                let v31 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::mul(0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::add(v29, 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::from_u32(1)), v28);
                let v32 = defi_package::swap::a1d4c92881210dfd5(v22, arg1);
                if (defi_package::state::a86e56d31feeb19a6(&v32) == v30 && defi_package::state::a21b8c64204576499(&v32) == v31) {
                } else {
                    defi_package::swap::ab41250516cb88a81(v22, arg2, arg1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg15, arg16);
                    let v33 = defi_package::utils::a9d9f98ebd95b9dad(arg0, arg2);
                    let v34 = defi_package::utils::ab78d0325509532d4(arg0, arg2);
                    let v35 = defi_package::config::ae2894da560e9dfaf(arg0);
                    let mut v36 = if (v33 < v35) {
                        v33
                    } else {
                        v35
                    };
                    let v37 = defi_package::config::a8f57f404176c397b(arg0);
                    let mut v38 = if (v34 < v37) {
                        v34
                    } else {
                        v37
                    };
                    let v39 = defi_package::config::a70cd9a0f5ac83e39(v27);
                    let v40 = v36 * v39 / 1000;
                    let v41 = v38 * v39 / 1000;
                    if (v40 < 1 * 1000000 || v41 < 1 * 1000000000) {
                    } else {
                        defi_package::swap::a40983b85c0ec093b(v22, arg2, arg1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, v30, v31, v40, v41, arg15, arg16);
                    };
                };
            };
        };
        defi_package::state::a9706b71488d40615();
        let v42 = defi_package::protocol_mmt::a099d08408fdb4a75();
        let v43 = &v42;
        let v44 = defi_package::protocol_mmt::a558d3d4811fa675d(v43, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
        let v45 = defi_package::config::a784c790c0b310a69(arg0) * arg13 / 10000 / 1000;
        let mut v46 = v45;
        if (arg14 > defi_package::config::a31f95bf83694efb8(arg0)) {
            v46 = v45 * (10000 + defi_package::config::a95922dffece9e7da(arg0) * (arg14 - defi_package::config::a31f95bf83694efb8(arg0))) / 10000;
        };
        let mut v47 = defi_package::utils::ad3e462cd25333e7f(v44, arg13) + v46 <= defi_package::protocol_mmt::ac4104d3c58483259(v43, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, v44);
        if (arg14 >= defi_package::config::a3a9b9d10c7fad14a(arg0)) {
            v47 = false;
        };
        if (!v47) {
            defi_package::protocol_mmt::ab41250516cb88a81(v43, arg2, arg1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg15, arg16);
        } else {
            let v48 = defi_package::protocol_mmt::a7ab2afdf1e994bfb(v43, arg0);
            if (!defi_package::config::a1c974970f8a64e97(v48)) {
            } else {
                let v49 = defi_package::protocol_mmt::aa8fecb213cfb45e1(v43, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
                let v50 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::div(defi_package::protocol_mmt::a99ab6d0cf8644a81(v43, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12), v49);
                let v51 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::mul(0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::sub(v50, 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::from_u32(1)), v49);
                let v52 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::mul(0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::add(v50, 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::from_u32(1)), v49);
                let v53 = defi_package::protocol_mmt::a1d4c92881210dfd5(v43, arg1);
                if (defi_package::state::a86e56d31feeb19a6(&v53) == v51 && defi_package::state::a21b8c64204576499(&v53) == v52) {
                } else {
                    defi_package::protocol_mmt::ab41250516cb88a81(v43, arg2, arg1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg15, arg16);
                    let v54 = defi_package::utils::a9d9f98ebd95b9dad(arg0, arg2);
                    let v55 = defi_package::utils::ab78d0325509532d4(arg0, arg2);
                    let v56 = defi_package::config::ae2894da560e9dfaf(arg0);
                    let mut v57 = if (v54 < v56) {
                        v54
                    } else {
                        v56
                    };
                    let v58 = defi_package::config::a8f57f404176c397b(arg0);
                    let mut v59 = if (v55 < v58) {
                        v55
                    } else {
                        v58
                    };
                    let v60 = defi_package::config::a70cd9a0f5ac83e39(v48);
                    let v61 = v57 * v60 / 1000;
                    let v62 = v59 * v60 / 1000;
                    if (v61 < 1 * 1000000 || v62 < 1 * 1000000000) {
                    } else {
                        defi_package::protocol_mmt::a40983b85c0ec093b(v43, arg2, arg1, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, v51, v52, v61, v62, arg15, arg16);
                    };
                };
            };
        };
    }

    public(friend) fun a94cdf867cab7cc5c(arg0: &defi_package::config::GlobalConfig, arg1: &mut 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::balance_manager::BalanceManager, arg2: &mut defi_package::state::TradingState, arg3: &mut 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg4: &0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::version::Version, arg5: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg6: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool::Pool<0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x2::sui::SUI>, arg7: &0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::config::GlobalConfig, arg8: &mut 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::rewarder::RewarderGlobalVault, arg9: &mut 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC, 0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::fee500bps::FEE500BPS>, arg10: &0x91bfbc386a41afcfd9b2533058d7e915a1d3829089cc268ff4333d54d6339ca1::pool::Versioned, arg11: &mut 0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg12: &0x3492c874c1e3b3e2984e8c41b589e642d4d0a5d6459e5a9cfc2d52fd7c89c267::config::GlobalConfig, arg13: u64, arg14: u64, arg15: &0x2::clock::Clock, arg16: &mut 0x2::tx_context::TxContext) {
        defi_package::state::aab87bac9248ea5a8();
        let v0 = defi_package::swap::a099d08408fdb4a75(0);
        if (arg13 <= defi_package::utils::a9d9f98ebd95b9dad(arg0, arg1) && arg14 <= defi_package::utils::ab78d0325509532d4(arg0, arg1)) {
        } else {
            defi_package::swap::ab41250516cb88a81(&v0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg15, arg16);
        };
        defi_package::state::a761ed5468043598f();
        let v1 = defi_package::swap::a099d08408fdb4a75(1);
        if (arg13 <= defi_package::utils::a9d9f98ebd95b9dad(arg0, arg1) && arg14 <= defi_package::utils::ab78d0325509532d4(arg0, arg1)) {
        } else {
            defi_package::swap::ab41250516cb88a81(&v1, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg15, arg16);
        };
        defi_package::state::a9706b71488d40615();
        let v2 = defi_package::protocol_mmt::a099d08408fdb4a75();
        if (arg13 <= defi_package::utils::a9d9f98ebd95b9dad(arg0, arg1) && arg14 <= defi_package::utils::ab78d0325509532d4(arg0, arg1)) {
        } else {
            defi_package::protocol_mmt::ab41250516cb88a81(&v2, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg15, arg16);
        };
    }

    // decompiled from Move bytecode v6
}

