mod QuestDone {
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

        set !(
            ctx.world,
            map_id.into(),
            (Player { 
                get_player_quest_status: false,
            })
        );

    }
}