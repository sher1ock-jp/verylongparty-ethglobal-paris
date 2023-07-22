#[system]
mod MapCreate {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;

    use verylongbrothers::components::Map;

    fn execute(ctx: Context, map_name: felt252) {

        let map_id = ctx.world.uuid();
        // let (map) = get !(ctx.world, ctx.origin.into(), Map);
        //let (maps) = find !(ctx.world, 0x0, (Map));
        //assert(maps.map_name = map_name, 'the square');

        set !(
            ctx.world,
            ctx.origin.into(),
            (Maps { map_id: map_id, map_name: map_name })
        );
    }
}