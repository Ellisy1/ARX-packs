// Импорты
import { getMoscowTime } from "./date"
import { checkForItem } from "./checkForItem"

// Imports - Minecraft
import { world } from "@minecraft/server"

/*
Формат сохранения DP о блоке:
Название DP (строка): {x:int, y:int, z:int, dimension: str}
Значение DP (строка): [playerName, placeData, placeTime]
*/

// Взаимодействие с блоками
world.afterEvents.entityHitBlock.subscribe((hitEvent) => {
    // Выводим данные о блоке, если это требуется
    if (hitEvent.damagingEntity.hasTag('gbd_ready') || checkForItem(hitEvent.damagingEntity, "mainhand", 'arx:mod_sword')) {
        hitEvent.damagingEntity.removeTag('gbd_ready')

        readBlockHistory(hitEvent.hitBlock, hitEvent.damagingEntity)
    }
})

// Постановка блоков
world.afterEvents.playerPlaceBlock.subscribe((placeEvent) => {
    // Дополняем map placedBlocksData
    if (placeEvent.player.getGameMode() === 'Survival') {
        recordBlockHistory(placeEvent.block, placeEvent.player)
    }
})

// Функция, записывающая историю блока
function recordBlockHistory(block, player) {

    const monthNames = [
        "января", "февраля", "марта", "апреля", "мая", "июня",
        "июля", "августа", "сентября", "октября", "ноября", "декабря"
    ]

    const now = getMoscowTime()

    const year = now.getFullYear();
    const month = now.getMonth();
    const day = now.getDate();
    const hours = now.getHours();
    const minutes = now.getMinutes();
    const seconds = now.getSeconds();

    world.setDynamicProperty(`blockHistory:${block.location.x},${block.location.y},${block.location.z},${block.dimension.id}}`, `["${player.name}", "${day} ${monthNames[month]} ${year}г.", "${hours}ч, ${minutes}мин, ${seconds}сек."]`)
}

// Функция, выводящая историю блока
function readBlockHistory(block, player) {
    const blockHistory = world.getDynamicProperty(`blockHistory:${block.location.x},${block.location.y},${block.location.z},${block.dimension.id}}`)

    if (blockHistory) {

        const blockHistoryParced = JSON.parse(blockHistory)

        player.runCommand(`tellraw @s {
            "rawtext": [
                { "text": "§dИстория взаимодействия:\n" },
                { "text": "§eПоставивший игрок§f: ${blockHistoryParced[0]}\n" },
                { "text": "§eДата§f: ${blockHistoryParced[1]}\n" },
                { "text": "§eВремя§f: ${blockHistoryParced[2]}\n" }
            ]
        }`)
    }
    else {
        player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cНе обнаржуно истории взаимодействия с блоком" } ] }`)
    }
}