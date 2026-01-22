import { iDP } from "../../DPOperations"

// Защита
export function waterOps(player, waterBonus) {
    iDP(player, 'wetness', waterBonus)
}