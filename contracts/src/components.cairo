use array::ArrayTrait;
use starknet::ContractAddress;
// use starknet::get_caller_address;

//////////
//Sqaure//
//////////

// in system, connect Square and SqaureId(from fontend)
#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Square {
    square_id: u32,
    square_creater: ContractAddress,
    // create_icon_url: Url,
    square_description: felt252,
    // square_image_url: Url,
    is_square_balance_add: bool,
    square_balance: u32,
    is_square_quest: bool,
    square_quest_contract_address: felt252,
    square_quest_description: felt252,
}

trait SquareTrait {
    fn get_square_id(self: Square) -> u32;
    fn get_square_creater(self: Square) -> ContractAddress;
    fn get_square_description(self: Square) -> felt252;
    fn is_square_balance_add(self: Square) -> bool;
    fn get_square_balance(self: Square) -> u32;
    fn is_square_quest(self: Square) -> bool;
    fn get_square_quest_contract_address(self: Square) -> felt252;
    fn get_square_quest_description(self: Square) -> felt252;
}

impl SquareImpl of SquareTrait {

    fn get_square_id(self: Square) -> u32 {
        self.square_id
    }

    fn get_square_creater(self: Square) -> ContractAddress {
        self.square_creater
    }

    fn get_square_description(self: Square) -> felt252 {
        self.square_description
    }

    fn is_square_balance_add(self: Square) -> bool {
        self.is_square_balance_add
    }

    fn get_square_balance(self: Square) -> u32 {
        self.square_balance
    }

    fn is_square_quest(self: Square) -> bool {
        self.is_square_quest
    }

    fn get_square_quest_contract_address(self: Square) -> felt252 {
        self.square_quest_contract_address
    }

    fn get_square_quest_description(self: Square) -> felt252 {
        self.square_quest_description
    }

}

//////////
//Player//
//////////
#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Player {
    player_position: u32,
    player_address: ContractAddress,
    player_balance: u32,
    player_quest_status: bool,
}

trait PlayerTrait {
    fn get_player_positon(self: Player) -> u32;
    fn get_player_address(self: Player) -> ContractAddress;
    fn get_player_balance(self: Player) -> u32;
    fn get_player_quest_status(self: Player) -> bool;
}

impl PlayerImpl of PlayerTrait {

    fn get_player_positon(self: Player) -> u32 {
        self.player_position
    }

    fn get_player_address(self: Player) -> ContractAddress {
        self.player_address
    }
    fn get_player_balance(self: Player) -> u32 {
        self.player_balance
    }
    fn get_player_quest_status(self: Player) -> bool {
        self.player_quest_status
    }
}

///////
//map//
///////

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Map {
    map_id: u32,
    map_name: felt252,
}

trait MapTrait {
    fn get_map_id(self: Map) -> u32;
    fn get_map_name(self: Map) -> felt252;
}

impl MapImpl of MapTrait {
    fn get_map_id(self: Map) -> u32 {
        self.map_id
    }
    fn get_map_name(self: Map) -> felt252 {
        self.map_name
    }
}

