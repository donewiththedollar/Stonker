module defi_package::math {
    public struct MarketData has drop {
        bid_prices: vector<u64>,
        bid_amounts: vector<u64>,
        ask_prices: vector<u64>,
        ask_amounts: vector<u64>,
        ask_price: u64,
        bid_price: u64,
        best_bid: u64,
        best_ask: u64,
    }

    public fun best_ask(arg0: &MarketData) : u64 {
        arg0.best_ask
    }

    public(friend) fun calculate_buy_amount(arg0: &MarketData, arg1: u64) : (u64, u64) {
        let mut v0 = 0;
        let mut v1 = arg0.bid_price;
        let mut v2 = 0;
        while (v2 < 0x1::vector::length<u64>(&arg0.ask_prices)) {
            if (arg1 == 0) {
                break
            };
            let v3 = *0x1::vector::borrow<u64>(&arg0.ask_prices, v2);
            let v4 = *0x1::vector::borrow<u64>(&arg0.ask_amounts, v2);
            if (v4 == 0) {
                v2 = v2 + 1;
                continue
            };
            v1 = v3;
            let v5 = (((v4 as u128) * (v3 as u128) / 1000000000) as u64);
            if (arg1 >= v5) {
                v0 = v0 + v4;
                arg1 = arg1 - v5;
            } else {
                v0 = v0 + (((arg1 as u128) * 1000000000 / (v3 as u128)) as u64);
                arg1 = 0;
            };
            v2 = v2 + 1;
        };
        (v0, v1)
    }

    public(friend) fun calculate_sell_amount(arg0: &MarketData, arg1: u64) : (u64, u64) {
        let mut v0 = 0;
        let mut v1 = arg0.ask_price;
        let mut v2 = 0;
        while (v2 < 0x1::vector::length<u64>(&arg0.bid_prices)) {
            if (arg1 == 0) {
                break
            };
            let v3 = *0x1::vector::borrow<u64>(&arg0.bid_prices, v2);
            let v4 = *0x1::vector::borrow<u64>(&arg0.bid_amounts, v2);
            if (v4 == 0) {
                v2 = v2 + 1;
                continue
            };
            v1 = v3;
            let mut v5 = if (arg1 >= v4) {
                v4
            } else {
                arg1
            };
            v0 = v0 + (((v5 as u128) * (v3 as u128) / 1000000000) as u64);
            arg1 = arg1 - v5;
            v2 = v2 + 1;
        };
        (v0, v1)
    }

    public fun bid_price(arg0: &MarketData) : u64 {
        arg0.bid_price
    }

    public(friend) fun create_market_data(arg0: &defi_package::config::GlobalConfig, arg1: &0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::Pool<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>, arg2: &vector<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::order::Order>, arg3: u64, arg4: &0x2::clock::Clock) : MarketData {
        let (v0, v1, v2, v3) = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::pool::get_level2_ticks_from_mid<0x2::sui::SUI, 0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC>(arg1, arg3, arg4);
        let mut v4 = v3;
        let v5 = v2;
        let mut v6 = v1;
        let v7 = v0;
        let mut v8 = 0;
        while (v8 < 0x1::vector::length<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::order::Order>(arg2)) {
            let v9 = 0x1::vector::borrow<0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::order::Order>(arg2, v8);
            v8 = v8 + 1;
            if (0x2::clock::timestamp_ms(arg4) > 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::order::expire_timestamp(v9)) {
                continue
            };
            if (0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::order::filled_quantity(v9) == 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::order::quantity(v9)) {
                continue
            };
            let (v10, v11, _) = defi_package::utils::a726fc82fd84e5e03(0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::order::order_id(v9));
            let v13 = v11;
            if (v10) {
                let (v14, v15) = 0x1::vector::index_of<u64>(&v7, &v13);
                if (!v14) {
                    continue
                };
                let v16 = 0x1::vector::borrow_mut<u64>(&mut v6, v15);
                let v17 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::order::quantity(v9) - 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::order::filled_quantity(v9);
                assert!(*v16 >= v17, 13906835145005989887);
                *v16 = *v16 - v17;
                continue
            };
            let (v18, v19) = 0x1::vector::index_of<u64>(&v5, &v13);
            if (!v18) {
                continue
            };
            let v20 = 0x1::vector::borrow_mut<u64>(&mut v4, v19);
            let v21 = 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::order::quantity(v9) - 0x2c8d603bc51326b8c13cef9dd07031a408a48dddb541963357661df5d3204809::order::filled_quantity(v9);
            assert!(*v20 >= v21, 13906835200840564735);
            *v20 = *v20 - v21;
        };
        let mut v22 = 0;
        while (v22 < 0x1::vector::length<u64>(&v7)) {
            if (*0x1::vector::borrow<u64>(&v6, v22) < defi_package::config::ad2616e93a0796e5b(arg0)) {
                v22 = v22 + 1;
            } else {
                break
            };
        };
        let mut v23 = 0;
        while (v23 < 0x1::vector::length<u64>(&v5)) {
            if (*0x1::vector::borrow<u64>(&v4, v23) < defi_package::config::ad2616e93a0796e5b(arg0)) {
                v23 = v23 + 1;
            } else {
                break
            };
        };
        let v24 = *0x1::vector::borrow<u64>(&v7, v22);
        let v25 = *0x1::vector::borrow<u64>(&v5, v23);
        let mut v26 = 0;
        while (v26 < 0x1::vector::length<u64>(&v7)) {
            if (*0x1::vector::borrow<u64>(&v6, v26) == 0) {
                v26 = v26 + 1;
            } else {
                break
            };
        };
        let mut v27 = 0;
        while (v27 < 0x1::vector::length<u64>(&v5)) {
            if (*0x1::vector::borrow<u64>(&v4, v27) == 0) {
                v27 = v27 + 1;
            } else {
                break
            };
        };
        let v28 = *0x1::vector::borrow<u64>(&v7, v26);
        let v29 = *0x1::vector::borrow<u64>(&v5, v27);
        MarketData{
            bid_prices : v7,
            bid_amounts : v6,
            ask_prices : v5,
            ask_amounts : v4,
            ask_price : v24,
            bid_price : v25,
            best_bid : v28,
            best_ask : v29,
        }
    }

    public fun bid_prices(arg0: &MarketData) : &vector<u64> {
        &arg0.bid_prices
    }

    public fun ask_amounts(arg0: &MarketData) : &vector<u64> {
        &arg0.ask_amounts
    }

    public fun bid_amounts(arg0: &MarketData) : &vector<u64> {
        &arg0.bid_amounts
    }

    public fun best_bid(arg0: &MarketData) : u64 {
        arg0.best_bid
    }

    public(friend) fun adjust_price(arg0: &MarketData, arg1: &defi_package::config::GlobalConfig, arg2: u64, arg3: bool, arg4: u64) : u64 {
        if (arg3) {
            let mut v0 = 0;
            while (v0 < 0x1::vector::length<u64>(&arg0.bid_prices)) {
                let v1 = *0x1::vector::borrow<u64>(&arg0.bid_prices, v0);
                if (v1 >= arg2) {
                    v0 = v0 + 1;
                    continue
                };
                if (*0x1::vector::borrow<u64>(&arg0.bid_amounts, v0) < defi_package::config::ad2616e93a0796e5b(arg1)) {
                    v0 = v0 + 1;
                    continue
                };
                return v1 + arg4
            };
        } else {
            let mut v2 = 0;
            while (v2 < 0x1::vector::length<u64>(&arg0.ask_prices)) {
                let v3 = *0x1::vector::borrow<u64>(&arg0.ask_prices, v2);
                if (v3 <= arg2) {
                    v2 = v2 + 1;
                    continue
                };
                if (*0x1::vector::borrow<u64>(&arg0.ask_amounts, v2) < defi_package::config::ad2616e93a0796e5b(arg1)) {
                    v2 = v2 + 1;
                    continue
                };
                return v3 - arg4
            };
        };
        arg2
    }

    public fun ask_price(arg0: &MarketData) : u64 {
        arg0.ask_price
    }

    public fun ask_prices(arg0: &MarketData) : &vector<u64> {
        &arg0.ask_prices
    }

    // decompiled from Move bytecode v6
}

