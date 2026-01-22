import { world } from "@minecraft/server"

// Return true if the player is admin
export function isAdmin(player) {
    return player.playerPermissionLevel == 2 
}

// Return all admins
export function getAdmins() {
    return world.getPlayers().filter(player => isAdmin(player))
}