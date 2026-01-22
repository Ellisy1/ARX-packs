import { tasteBodyString } from "../core/core"
import { ActionFormData } from "@minecraft/server-ui"

// Отображение UI еды
export function infoAboutTastes(player) {
    const form = new ActionFormData()
        .title("Вкусы")
        .body(tasteBodyString(player))
        .show(player)
}