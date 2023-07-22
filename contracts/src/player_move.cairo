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
        let square = get !(ctx.world, map_id.into(), Square);


        if square.is_square_balance_add = true {
            player.player_balance + square.square_balance
        } else if Player.is_square_balance <  square.square_balance{
            break;
        } else {
            player.player_balance - square.square_balance
        }

        set !(
            ctx.world,
            map_id.into(),
            (Player { 
                player_address: caller,
                player_balance: 1000, 
                player_quest_status: true,
            })
        );

    }
}

// ref for add and subtract
// #[derive(Serde, Drop)]
//     enum Direction {
//         Left: (),
//         Right: (),
//         Up: (),
//         Down: (),
//     }

//     impl DirectionIntoFelt252 of Into<Direction, felt252> {
//         fn into(self: Direction) -> felt252 {
//             match self {
//                 Direction::Left(()) => 0,
//                 Direction::Right(()) => 1,
//                 Direction::Up(()) => 2,
//                 Direction::Down(()) => 3,
//             }
//         }
//     }

//     fn execute(ctx: Context, direction: Direction) {
//         let (position, moves) = get !(ctx.world, ctx.origin.into(), (Position, Moves));
//         let next = next_position(position, direction);
//         set !(
//             ctx.world,
//             ctx.origin.into(),
//             (Moves { remaining: moves.remaining - 1 }, Position { x: next.x, y: next.y }, )
//         );
//         return ();
//     }

//     fn next_position(position: Position, direction: Direction) -> Position {
//         match direction {
//             Direction::Left(()) => {
//                 Position { x: position.x - 1, y: position.y }
//             },
//             Direction::Right(()) => {
//                 Position { x: position.x + 1, y: position.y }
//             },
//             Direction::Up(()) => {
//                 Position { x: position.x, y: position.y + 1 }
//             },
//             Direction::Down(()) => {
//                 Position { x: position.x, y: position.y - 1 }
//             },
//         }
//     }