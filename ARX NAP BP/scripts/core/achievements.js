import { system, world } from "@minecraft/server"
import { checkForItem } from "../checkForItem"
import { getScore } from "../scoresOperations"

// Аркс сохраняет данные о достижениях в DP, при этом формат записи ach:idДостижения
// arx:id = false значит, что достижение не выполнено
// arx:id = true значит, что достижение выполнено

export const achievementsList = { // Список со всеми достижениями

    /*
    idДостижения: {
        name: Имя достижения
        description: Название достижения
        trigger: {
            type: hasTag || score || property || dynamicProperty || external || hasItem
            value: значение
    }
    */

    "has_crafting_table": {
        name: "Майнкрафт по-новому",
        description: "Создать верстак",
        trigger: {
            type: "hasItem",
            value: "arx:crafting_table"
        }
    },
    "has_furnace": {
        name: "Отжарка",
        description: "Создать печь",
        trigger: {
            type: "hasItem",
            value: "minecraft:furnace"
        }
    },
    "has_string": {
        name: "Верёвочка",
        description: "Получить нить",
        trigger: {
            type: "hasItem",
            value: "minecraft:string"
        }
    },
    "has_loom_crafting_table": {
        name: "Свяжем шапочку",
        description: "Создать прядильный станок",
        trigger: {
            type: "hasItem",
            value: "arx:loom_crafting_table"
        }
    },
    "has_leather_bench_crafting_table": {
        name: "Дубы тут не при чём",
        description: "Создать дубильный станок",
        trigger: {
            type: "hasItem",
            value: "arx:leather_bench_crafting_table"
        }
    },
    "has_weapons_assembly_crafting_table": {
        name: "Пора вооружаться",
        description: "Создать оружесборочную",
        trigger: {
            type: "hasItem",
            value: "arx:weapons_assembly_crafting_table"
        }
    },
    "has_clothes_crafting_table": {
        name: "Пора приодеться",
        description: "Создать швейный стол",
        trigger: {
            type: "hasItem",
            value: "arx:clothes_crafting_table"
        }
    },
    "has_cast_iron_ingot": {
        name: "Чугунище",
        description: "Получить слиток чугуна",
        trigger: {
            type: "hasItem",
            value: "arx:cast_iron_ingot"
        }
    },
    "has_steel_ingot": {
        name: "Стальные руки",
        description: "Получить слиток стали",
        trigger: {
            type: "hasItem",
            value: "arx:steel_ingot"
        }
    },
    "has_rune_crafting_table": {
        name: "Путь мага",
        description: "Создать рунический верстак",
        trigger: {
            type: "hasItem",
            value: "arx:rune_crafting_table"
        }
    },
    "has_boiler_crafting_table": {
        name: "Путь ведьмы",
        description: "Создать котёл",
        trigger: {
            type: "hasItem",
            value: "arx:boiler_crafting_table"
        }
    },
    "has_thermal_cooking_crafting_table": {
        name: "Отжарка по полной",
        description: "Создать мангал",
        trigger: {
            type: "hasItem",
            value: "arx:thermal_cooking_crafting_table"
        }
    },
    "has_cooking_crafting_table": {
        name: "Белиссимо",
        description: "Создать стол для готовки",
        trigger: {
            type: "hasItem",
            value: "arx:cooking_crafting_table"
        }
    },
    "has_alchemy_crafting_table": {
        name: "Нахимичим?",
        description: "Создать алхимический стол",
        trigger: {
            type: "hasItem",
            value: "arx:alchemy_crafting_table"
        }
    },
    "has_diamond": {
        name: "Как в старые добрые",
        description: "Добыть алмаз",
        trigger: {
            type: "hasItem",
            value: "minecraft:diamond"
        }
    },
    "has_fool_potion": {
        name: "Дурак",
        description: "Получить зелье дурака",
        trigger: {
            type: "hasItem",
            value: "arx:long_bottle_blood_karelo_evergreen_dream_jackal_grass"
        }
    },
    "has_evergreen_dream": {
        name: "Загадочный бутон",
        description: "Найти вечнозеленый сон",
        trigger: {
            type: "hasItem",
            value: "arx:evergreen_dream"
        }
    },
    "has_royal_sorrel": {
        name: "Царская находка",
        description: "Найти царский щавель",
        trigger: {
            type: "hasItem",
            value: "arx:royal_sorrel"
        }
    },
    "has_ice_iris": {
        name: "Блестящая метель",
        description: "Найти снежный ирис",
        trigger: {
            type: "hasItem",
            value: "arx:ice_iris"
        }
    },
    "has_ash_lavaflower": {
        name: "Воплощение пепла",
        description: "Найти пепельный лавоцвет",
        trigger: {
            type: "hasItem",
            value: "arx:ash_lavaflower"
        }
    },
    "has_aluminum_ingot": {
        name: "Бледный блеск",
        description: "Получить алюминиевый слиток",
        trigger: {
            type: "hasItem",
            value: "arx:aluminum_ingot"
        }
    },
    "has_tin_ingot": {
        name: "Время обновить кирку!",
        description: "Получить оловянный слиток",
        trigger: {
            type: "hasItem",
            value: "arx:tin_ingot"
        }
    },
    "has_iron_ingot": {
        name: "Жесть...",
        description: "Получить железный слиток",
        trigger: {
            type: "hasItem",
            value: "minecraft:iron_ingot"
        }
    },
    "has_riolik_ingot": {
        name: "Из чего оно делается!?",
        description: "Получить риоликовый слиток",
        trigger: {
            type: "hasItem",
            value: "arx:riolik_ingot"
        }
    },
    "has_altaite_ingot": {
        name: "Ледяной блеск",
        description: "Получить альтаитовый слиток",
        trigger: {
            type: "hasItem",
            value: "arx:altaite_ingot"
        }
    },
    "has_caryite_ingot": {
        name: "Синее сиянее",
        description: "Получить кариитовый слиток",
        trigger: {
            type: "hasItem",
            value: "arx:caryite_ingot"
        }
    },
    "has_chloronite_ingot": {
        name: "Зелёная смерть",
        description: "Получить хлоронитовый слиток",
        trigger: {
            type: "hasItem",
            value: "arx:chloronite_ingot"
        }
    },
    "has_dorionite_ingot": {
        name: "Прочность солнца",
        description: "Получить дорионитовый слиток",
        trigger: {
            type: "hasItem",
            value: "arx:dorionite_ingot"
        }
    },
    "has_draphorite_ingot": {
        name: "Загадочная мощь",
        description: "Получить драфоритовый слиток",
        trigger: {
            type: "hasItem",
            value: "arx:draphorite_ingot"
        }
    },
    "has_forfactorite_ingot": {
        name: "Звёздный слиток",
        description: "Получить форфакоритовый слиток",
        trigger: {
            type: "hasItem",
            value: "arx:forfactorite_ingot"
        }
    },
    "has_lamenite_ingot": {
        name: "Фиолетовое сокровище",
        description: "Получить ламенитовый слиток",
        trigger: {
            type: "hasItem",
            value: "arx:lamenite_ingot"
        }
    },
    "has_naginitis_ingot": {
        name: "Тёмный слиток",
        description: "Получить нагинитовый слиток",
        trigger: {
            type: "hasItem",
            value: "arx:naginitis_ingot"
        }
    },
    "has_malafiotironite_ingot": {
        name: "Адский блеск",
        description: "Получить малафиотиронитовый слиток",
        trigger: {
            type: "hasItem",
            value: "arx:malafiotironite_ingot"
        }
    },
    "has_toliriite_ingot": {
        name: "Адский арбитр",
        description: "Получить толириитовый слиток",
        trigger: {
            type: "hasItem",
            value: "arx:toliriite_ingot"
        }
    },
    "has_wooden_pickaxe": {
        name: "Начало шахтёра",
        description: "Получить каменную кирку",
        trigger: {
            type: "hasItem",
            value: "minecraft:wooden_pickaxe"
        }
    },
    "has_stone_pickaxe": {
        name: "Металлический стук",
        description: "Получить оловянную кирку",
        trigger: {
            type: "hasItem",
            value: "minecraft:stone_pickaxe"
        }
    },
    "has_iron_pickaxe": {
        name: "Уровень профи",
        description: "Получить дюрастальную кирку",
        trigger: {
            type: "hasItem",
            value: "minecraft:iron_pickaxe"
        }
    },
    "has_diamond_pickaxe": {
        name: "Синие искры",
        description: "Получить кариитовую кирку",
        trigger: {
            type: "hasItem",
            value: "minecraft:diamond_pickaxe"
        }
    },
    "has_netherite_pickaxe": {
        name: "Мощь, достойная богов",
        description: "Получить спектральную кирку",
        trigger: {
            type: "hasItem",
            value: "minecraft:netherite_pickaxe"
        }
    },

    "in_bottom_mines": {
        name: "Тьма",
        description: "Спуститься в нижние шахты",
        trigger: {
            type: "hasTag",
            value: "in_hot_deep"
        }
    }
}

// Выполнение достижения
export function completeAchievement(player, achievementID) { // achievementID БЕЗ ach:

    if (!(achievementID in achievementsList)) { // Проверка, существует ли достижение
        console.error(`Попытка выполнить несуществующее достижение с ID <${achievementID}> игроком ${player.name}`)
        return 1
    }

    if (player.getDynamicProperty(`ach:${achievementID}`) !== true) { // Проверка, не выполнено ли это достижение уже

        player.runCommand(`tellraw @s { "rawtext": [ { "text": "Ę §2Выполнено достижение: §r${achievementsList[achievementID].name} §7§o(${achievementsList[achievementID].description})" } ] }`)
        player.runCommand('playsound get_achievement @s ~ ~ ~')
        player.setDynamicProperty(`ach:${achievementID}`, true)
        return 0
    }

}

// Прослушка достижений
system.runInterval(() => {
    for (const player of world.getPlayers()) {
        if (player.getDynamicProperty('hasRegisteredCharacter') === true) {
            for (const achievement in achievementsList) {

                if (!achievementsList.hasOwnProperty(achievement)) continue

                if (player.getDynamicProperty(`ach:${achievement}`) !== true)
                    switch (achievementsList[achievement].trigger.type) {

                        case 'hasItem':
                            if (checkForItem(player, 'inventory', achievementsList[achievement].trigger.value) === true) {
                                completeAchievement(player, achievement)
                            }
                            break

                        case 'hasTag':
                            if (player.hasTag(achievementsList[achievement].trigger.value)) {
                                completeAchievement(player, achievement)
                            }
                            break

                        default:
                            console.warn(`Неизвестный type для достижения ${achievementsList[achievement]}`)
                    }
            }
        }
    }
}, 30);