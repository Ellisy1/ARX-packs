import { ActionFormData } from "@minecraft/server-ui"
import { getGenitiveName } from "../getGenitiveName"

// Отображение UI о персонаже
export function infoAboutCharacter(player) {
    const form = new ActionFormData()
        .title("§d§l" + player?.getDynamicProperty('trueName'))
        .body(getBodyText(player))
        .show(player)
}

function getBodyText(player) {
    let bodyText = ''

    if (player.getProperty("arx:gender") == 1) {
        bodyText += "§bМужской§f пол"
    } else {
        bodyText += "§dЖенский§f пол"
    }

    if (player.getDynamicProperty('name')) {
        bodyText += `\n§a${player.getDynamicProperty('name')}§f - так вас воспринимают окружающие`
    }

    if (player.getDynamicProperty('height')) {
        bodyText += `\nРост: §a${player.getDynamicProperty('height')} §fсм`
    }

    if (player.getProperty('arx:bust_size') !== 0 || player.getProperty('arx:gender') !== 1) {
        bodyText += `\nРазмер груди: §a${player.getProperty('arx:bust_size')}`
    }

    if (player.getProperty("arx:is_ghost") == 1) {
        bodyText += "\n\nВы - §cпризрак§f"
        bodyText += `\nУвядание: §4${player.getDynamicProperty('ghostWitheringLevel')}§f ур.`
    }

    if (player.getDynamicProperty('characterLore')) {
        bodyText += `\n\n§aИстория ${getGenitiveName(player.getDynamicProperty('trueName'), player.getProperty("arx:gender"))}§f: ${player.getDynamicProperty('characterLore')}`
    } else {
        bodyText += "\n\n§fВы §eне указали§f историю своего персонажа. Это можно сделать командой \n§d!§alore set <Расскажите о своем персонаже>"
    }

    return bodyText
}