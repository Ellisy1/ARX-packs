import { system, world } from "@minecraft/server";

system.runInterval(() => {
    for (let player of world.getPlayers()) {
        player.nameTag = ""
    }
}, 20);