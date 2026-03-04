import { acquireTrait, checkForTrait } from "../traits/traitsOperations"
import { ssDP, iDP } from "../DPOperations"
import { sl, fl } from '../lang/fetchLocalization'
import { isFoodInRegistry, onFoodConsume } from './food'
import { potionsRegistry, onPotionConsume } from './potions'

// Global funtion for consuming. 
// It tracks, what player has eaten and what function should be used
export function onConsume(player, itemStack) {
    // Food
    if (isFoodInRegistry(itemStack.typeId)) onFoodConsume(player, itemStack)
    // Potion
    else if (itemStack.typeId in potionsRegistry) onPotionConsume(player, itemStack)
}