#[system]
mod PlayerCreate {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;

    use verylongbrothers::components::Player;

    fn execute(
        ctx: Context, 
        map_id: u32,
        ) {
        
        let caller = starknet::get_tx_info().unbox().account_contract_address;
        let (map) = get !(ctx.world, map_id.into(), Map);

        // let (, ) = get !(ctx.world, (, ).into(), (,));

        set !(
            ctx.world,
            (caller, ctx.origin.into()).into(),
            (Player { 
                player_address: caller,
                player_balance: 1000, 
                get_player_quest_status: false,
            })
        );
    }
}