mod PlayerMove {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;

    use verylongbrothers::components::Player;

    fn execute(
        ctx: Context, 
        map_id: u32,
    ) {
        
        let caller = starknet::get_tx_info().unbox().account_contract_address;
        let player = get !(ctx.world, map_id.into(), Player);

        // 計算する必要あり
        if player. < *self.start_time {
            return false;
        }

        set !(
            ctx.world,
            map_id.into(),
            (Player { 
                player_address: caller,
                player_balance: 1000, 
                get_player_quest_status: false,
            })
        );

    }
}