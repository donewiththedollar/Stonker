module defi_package::state {
    public struct ConcentratedPosition has copy, drop, store {
        tick_lower: 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::I32,
        tick_upper: 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::I32,
        token_a_amount: u64,
        token_b_amount: u64,
        accumulated_fees: u128,
    }

    public struct PoolSnapshotEvent has copy, drop {
        pool: 0x1::string::String,
        token_a_amount: u64,
        token_b_amount: u64,
        current_price: u64,
        target_price: u64,
        trade_volume: u64,
        fee_amount: u64,
        pool_id: 0x2::object::ID,
        timestamp_ms: u64,
    }

    public struct TradingState has store {
        cetus_position: ConcentratedPosition,
        cetus_position_option: 0x1::option::Option<0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::position::Position>,
        bluefin_position: ConcentratedPosition,
        bluefin_position_option: 0x1::option::Option<0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::position::Position>,
        turbos_position: ConcentratedPosition,
        turbos_position_option: 0x1::option::Option<0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::position::Position>,
    }

    public(friend) fun cetus_position(arg0: &mut TradingState) : &mut ConcentratedPosition {
        &mut arg0.cetus_position
    }

    public fun a0fe3f4b34897c4e5(arg0: &mut TradingState) : 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::position::Position {
        arg0.turbos_position = a2c9b8f77fb19b963();
        0x1::option::extract<0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::position::Position>(&mut arg0.turbos_position_option)
    }

    public(friend) fun a1134e088837aa9d7(arg0: u128, arg1: u64) : u128 {
        let v0 = (arg1 as u256) * 1000000000;
        let mut v1 = 1000000000 * 1000000000 * (arg0 as u256) * (arg0 as u256) / 340282366920938463463374607431768211456;
        let mut v2 = (arg0 as u256);
        loop {
            let v3 = v1 * 1001000000 / 1000000000;
            if (v3 > v0) {
                break
            };
            let v4 = v2 * 1000499875;
            v2 = v4 / 1000000000;
            v1 = v3;
        };
        loop {
            let v5 = v1 * 1000050000 / 1000000000;
            if (v5 > v0) {
                break
            };
            let v6 = v2 * 1000024999;
            v2 = v6 / 1000000000;
            v1 = v5;
        };
        (v2 as u128)
    }

    public(friend) fun a21b8c64204576499(arg0: &ConcentratedPosition) : 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::I32 {
        arg0.tick_upper
    }

    public(friend) fun a280ecc58e70fd664(arg0: &TradingState) : (u64, u64) {
        (0 + arg0.cetus_position.token_b_amount + arg0.bluefin_position.token_b_amount + arg0.turbos_position.token_b_amount, 0 + arg0.cetus_position.token_a_amount + arg0.bluefin_position.token_a_amount + arg0.turbos_position.token_a_amount)
    }

    public(friend) fun turbos_position(arg0: &mut TradingState) : &mut ConcentratedPosition {
        &mut arg0.turbos_position
    }

    public(friend) fun a2c9b8f77fb19b963() : ConcentratedPosition {
        ConcentratedPosition{
            tick_lower : 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::from_u32(0),
            tick_upper : 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::from_u32(0),
            token_a_amount : 0,
            token_b_amount : 0,
            accumulated_fees : 0,
        }
    }

    public(friend) fun a34a6cb13f0f0ba27(arg0: u64, arg1: u64) : u64 {
        (((arg1 as u128) * (1000000000 as u128) / (arg0 as u128)) as u64)
    }

    public(friend) fun cetus_position_option(arg0: &mut TradingState) : &mut 0x1::option::Option<0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::position::Position> {
        &mut arg0.cetus_position_option
    }

    public fun a644a394872f1c524(arg0: &mut TradingState) : 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::position::Position {
        arg0.bluefin_position = a2c9b8f77fb19b963();
        0x1::option::extract<0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::position::Position>(&mut arg0.bluefin_position_option)
    }

    public(friend) fun bluefin_position_option(arg0: &mut TradingState) : &mut 0x1::option::Option<0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::position::Position> {
        &mut arg0.bluefin_position_option
    }

    public(friend) fun a75d4519aec44b4ef() : TradingState {
        TradingState{
            cetus_position : a2c9b8f77fb19b963(),
            cetus_position_option : 0x1::option::none<0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::position::Position>(),
            bluefin_position : a2c9b8f77fb19b963(),
            bluefin_position_option : 0x1::option::none<0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::position::Position>(),
            turbos_position : a2c9b8f77fb19b963(),
            turbos_position_option : 0x1::option::none<0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::position::Position>(),
        }
    }

    public(friend) fun a761ed5468043598f() : u64 {
        1
    }

    public(friend) fun a86e56d31feeb19a6(arg0: &ConcentratedPosition) : 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::I32 {
        arg0.tick_lower
    }

    public(friend) fun a888b107d980228f4(arg0: &ConcentratedPosition) : u64 {
        arg0.token_b_amount
    }

    public(friend) fun a8e0f142d42cfb97e(arg0: u128, arg1: u64) : u128 {
        let v0 = (arg1 as u256) * 1000000000;
        let mut v1 = 1000000000 * 1000000000 * (arg0 as u256) * (arg0 as u256) / 340282366920938463463374607431768211456;
        let mut v2 = (arg0 as u256);
        loop {
            let v3 = v1 * 1000000000 / 1001000000;
            if (v3 < v0) {
                break
            };
            let v4 = v2 * 1000000000;
            v2 = v4 / 1000499875;
            v1 = v3;
        };
        loop {
            let v5 = v1 * 1000000000 / 1000050000;
            if (v5 < v0) {
                break
            };
            let v6 = v2 * 1000000000;
            v2 = v6 / 1000024999;
            v1 = v5;
        };
        (v2 as u128)
    }

    public(friend) fun a9706b71488d40615() : u64 {
        2
    }

    public(friend) fun turbos_position_option(arg0: &mut TradingState) : &mut 0x1::option::Option<0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860::position::Position> {
        &mut arg0.turbos_position_option
    }

    public(friend) fun aab87bac9248ea5a8() : u64 {
        0
    }

    public(friend) fun abd1f7455cc14de22(arg0: 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::I32, arg1: 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::I32, arg2: u64, arg3: u64, arg4: u128) : ConcentratedPosition {
        ConcentratedPosition{
            tick_lower : arg0,
            tick_upper : arg1,
            token_a_amount : arg2,
            token_b_amount : arg3,
            accumulated_fees : arg4,
        }
    }

    public(friend) fun bluefin_position(arg0: &mut TradingState) : &mut ConcentratedPosition {
        &mut arg0.bluefin_position
    }

    public(friend) fun ac9df1aecf6db4076() : u64 {
        5
    }

    public(friend) fun acde36a6fa6c393c2(arg0: u128, arg1: u64) : u128 {
        let v0 = (arg1 as u256) * 1000000000;
        let mut v1 = 340282366920938463463374607431768211456000000000000000000 / (arg0 as u256) * (arg0 as u256);
        let mut v2 = (arg0 as u256);
        loop {
            let v3 = v1 * 1001000000 / 1000000000;
            if (v3 > v0) {
                break
            };
            let v4 = v2 * 1000000000;
            v2 = v4 / 1000499875;
            v1 = v3;
        };
        loop {
            let v5 = v1 * 1000050000 / 1000000000;
            if (v5 > v0) {
                break
            };
            let v6 = v2 * 1000000000;
            v2 = v6 / 1000024999;
            v1 = v5;
        };
        (v2 as u128)
    }

    public(friend) fun ad409a74018d3aacd(arg0: 0x1::string::String, arg1: &ConcentratedPosition, arg2: u64, arg3: u64, arg4: u64, arg5: u64, arg6: 0x2::object::ID, arg7: &0x2::clock::Clock) {
        let v0 = PoolSnapshotEvent{
            pool              : arg0,
            token_a_amount : arg1.token_a_amount,
            token_b_amount : arg1.token_b_amount,
            current_price : arg2,
            target_price : arg3,
            trade_volume : arg4,
            fee_amount : arg5,
            pool_id : arg6,
            timestamp_ms      : 0x2::clock::timestamp_ms(arg7),
        };
        0x2::event::emit<PoolSnapshotEvent>(v0);
    }

    public fun adbacd5e16d57ada1(arg0: &mut TradingState) : 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::position::Position {
        arg0.cetus_position = a2c9b8f77fb19b963();
        0x1::option::extract<0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::position::Position>(&mut arg0.cetus_position_option)
    }

    public(friend) fun ae18556b7140949ca(arg0: &ConcentratedPosition) : u64 {
        arg0.token_a_amount
    }

    public(friend) fun aee479d24be81fbe9(arg0: u128, arg1: u64) : u128 {
        let v0 = (arg1 as u256) * 1000000000;
        let mut v1 = 340282366920938463463374607431768211456000000000000000000 / (arg0 as u256) * (arg0 as u256);
        let mut v2 = (arg0 as u256);
        loop {
            let v3 = v1 * 1000000000 / 1001000000;
            if (v3 < v0) {
                break
            };
            let v4 = v2 * 1000499875;
            v2 = v4 / 1000000000;
            v1 = v3;
        };
        loop {
            let v5 = v1 * 1000000000 / 1000050000;
            if (v5 < v0) {
                break
            };
            let v6 = v2 * 1000024999;
            v2 = v6 / 1000000000;
            v1 = v5;
        };
        (v2 as u128)
    }

    public(friend) fun af95ffd01d13caab1() : u64 {
        4
    }

    public(friend) fun afb1904d62fe08653(arg0: &ConcentratedPosition) : u128 {
        arg0.accumulated_fees
    }

    public(friend) fun afe80a6b6b615d930() : u64 {
        3
    }

    // decompiled from Move bytecode v6
}

