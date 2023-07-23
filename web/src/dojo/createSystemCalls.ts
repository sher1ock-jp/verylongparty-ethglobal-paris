import { SetupNetworkResult } from "./setupNetwork";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
    { execute, syncWorker }: SetupNetworkResult,
) {
    const map_create = async () => {
        const tx = await execute("MapCreate", []);
        // await awaitStreamValue(txReduced$, (txHash) => txHash === tx.transaction_hash);
        syncWorker.sync(tx.transaction_hash);
        console.log("Map created")
    };

    const square_create = async () => {
        // execute from core
        const tx = await execute("SquareCreate", []);
        // awaitStreamValue(txReduced$, (txHash) => txHash === tx.transaction_hash);
        syncWorker.sync(tx.transaction_hash);
        // console.log("Moved ", direction)
        console.log("Square created")
      };

    const player_create = async () => {
        // execute from core
        const tx = await execute("PlayerCreate", []);
        // awaitStreamValue(txReduced$, (txHash) => txHash === tx.transaction_hash);
        syncWorker.sync(tx.transaction_hash);
        console.log("Player created")
    };

    const player_move = async () => {
        // execute from core
        const tx = await execute("PlayerMove", []);
        // awaitStreamValue(txReduced$, (txHash) => txHash === tx.transaction_hash);
        syncWorker.sync(tx.transaction_hash);
        console.log("Player moved")
    };

    const quest_done = async () => {
        // execute from core
        const tx = await execute("QuestDone", []);
        // awaitStreamValue(txReduced$, (txHash) => txHash === tx.transaction_hash);
        syncWorker.sync(tx.transaction_hash);
        console.log("Quest done")
    };

    const back_to_start = async () => {
        // execute from core
        const tx = await execute("BackToStart", []);
        // awaitStreamValue(txReduced$, (txHash) => txHash === tx.transaction_hash);
        syncWorker.sync(tx.transaction_hash);
        console.log("Back to start")
    };

    return {
        map_create,
        square_create,
        player_create,
        player_move,
        quest_done,
        back_to_start,
    };
}