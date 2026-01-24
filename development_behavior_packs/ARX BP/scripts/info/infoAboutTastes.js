import { ActionFormData } from "@minecraft/server-ui"

// Отображение UI еды
export function infoAboutTastes(player) {
    const form = new ActionFormData()
        .title("Вкусы")
        .body(tasteBodyString(player))
        .show(player)
}

// Формируем строку для вывода вкусов в кастом окошко
export function tasteBodyString(player) {
    let resultString = '§eВаши вкусы§f:\n'

    const tastes = ['meat', 'fish', 'bread', 'dairy', 'herbal', 'sweet']
    const tastes_ru = ['Мясное', 'Рыбное', 'Хлебное', 'Молочное', 'Травяное', 'Сладкое']

    for (let i = 0; i < 6; i++) {
        const currentTaste = player.getDynamicProperty("playerTaste_" + tastes[i])

        let currentTasteColor

        if (currentTaste > -30) {
            currentTaste < 30 ? currentTasteColor = '§e' : currentTasteColor = '§a'
        }
        else {
            currentTasteColor = '§c'
        }

        resultString += `§f${tastes_ru[i]}: ${currentTasteColor}${currentTaste}\n§f`
    }

    return (resultString)
}