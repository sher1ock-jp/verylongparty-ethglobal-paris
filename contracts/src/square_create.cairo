#[system]
mod SquareCreate {
    use array::ArrayTrait;
    use traits::Into;
    use starknet::ContractAddress;

    use dojo::world::Context;

    use verylongbrothers::components::Square;

    fn execute(
        ctx: Context, 
        square_description: felt252, 
        is_square_balance_add: bool, 
        square_balance: u32, 
        is_square_quest: bool,
        square_quest_contract_address: felt252, 
        square_quest_description: felt252,
        map_id: u32,
        square_id: u32,
        caller: ContractAddress,
        ) {

        // let caller = starknet::ContractAddress;
        let square = get !(ctx.world, map_id.into(), Square);

        assert(square.square_id == square_id, 'Square is already used');

        // let (, ) = get !(ctx.world, (, ).into(), (,));

        set !(
            ctx.world,
            map_id.into(),
            (Square { 
                square_id: square_id,
                square_creater: caller, 
                is_square_balance_add: is_square_balance_add,
                square_balance: square_balance,
                is_square_quest: is_square_quest,
                square_quest_contract_address: square_quest_contract_address,
                square_quest_description: square_quest_description,
                square_description: square_description,
            })
        );
    }
}