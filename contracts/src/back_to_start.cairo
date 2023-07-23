mod BacktoStart {
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