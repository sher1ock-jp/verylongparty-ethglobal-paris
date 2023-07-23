#[system]
mod PlayerCreate {
    use array::ArrayTrait;
    use traits::Into;
    use starknet::ContractAddress;

    use dojo::world::Context;

    use verylongbrothers::components::Player;

    fn execute(
        ctx: Context, 
        map_id: u32,
        caller: ContractAddress,
        ) {
        
        // let caller = use starknet::ContractAddress;
        // let map = get !(ctx.world, map_id.into(), Map);

        // let (, ) = get !(ctx.world, (, ).into(), (,));

        set !(
            ctx.world,
            (caller, map_id).into(),
            (Player { 
                player_position: 1,
                player_address: caller,
                player_balance: 1000, 
                player_quest_status: false,
            })
        );
    }
}