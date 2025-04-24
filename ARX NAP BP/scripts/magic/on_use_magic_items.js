// Imports - Minecraft
import { world, EntityComponentTypes, EquipmentSlot } from "@minecraft/server";

import { runeCiphers } from './rune_cipher_list'

import { castACAH } from './spells/ACAH'
import { findSpell } from "./findSpell";

import { getScore, setScore } from "../scoresOperations";
import { increaseSkillProgress } from "../skillsOperations";

import { manageCD } from "../manageCD";

// Использование предметов
world.afterEvents.itemUse.subscribe((event) => { // Обнаружаем юзание предмета на ПКМ
    const player = event.source; // Получаем объект игрока

    const item = player.getComponent(EntityComponentTypes.Equippable).getEquipment(EquipmentSlot.Mainhand)
    switch (event.itemStack.typeId) {
        // Руны
        // Свинец
        case "arx:rune_affuono_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "affuono")
            }
            break
        case "arx:rune_arrako_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "arrako")
            }
            break
        case "arx:rune_din_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "din")
            }
            break
        case "arx:rune_disortari_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "disortari")
            }
            break
        case "arx:rune_elletera_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "elletera")
            }
            break
        case "arx:rune_floruum_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "floruum")
            }
            break
        case "arx:rune_flurri_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "flurri")
            }
            break
        case "arx:rune_hijo_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "hijo")
            }
            break
        case "arx:rune_horo_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "horo")
            }
            break
        case "arx:rune_inoffo_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "inoffo")
            }
            break
        case "arx:rune_kon_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "kon")
            }
            break
        case "arx:rune_kotoka_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "kotoka")
            }
            break
        case "arx:rune_laffaeti_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "laffaeti")
            }
            break
        case "arx:rune_low_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "low")
            }
            break
        case "arx:rune_marra_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "marra")
            }
            break
        case "arx:rune_mega_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "mega")
            }
            break
        case "arx:rune_orduino_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "orduino")
            }
            break
        case "arx:rune_recuro_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "recuro")
            }
            break
        case "arx:rune_sakiifori_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "sakiifori")
            }
            break
        case "arx:rune_san_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "san")
            }
            break
        case "arx:rune_sartagana_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "sartagana")
            }
            break
        case "arx:rune_sempra_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "sempra")
            }
            break
        case "arx:rune_shumi_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "shumi")
            }
            break
        case "arx:rune_sin_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "sin")
            }
            break
        case "arx:rune_sofiso_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "sofiso")
            }
            break
        case "arx:rune_subversa_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "subversa")
            }
            break
        case "arx:rune_sukimo_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "sukimo")
            }
            break
        case "arx:rune_trafantana_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "trafantana")
            }
            break
        case "arx:rune_transkursio_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "transkursio")
            }
            break
        case "arx:rune_watashi_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "watashi")
            }
            break
        case "arx:rune_yanamo_a":
            if (manageCD(player)) {
                cipherRuneSequence(player, "yanamo")
            }
            break

        // Нагинит
        case "arx:rune_affuono_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "affuono")
            }
            break
        case "arx:rune_arrako_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "arrako")
            }
            break
        case "arx:rune_din_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "din")
            }
            break
        case "arx:rune_disortari_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "disortari")
            }
            break
        case "arx:rune_elletera_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "elletera")
            }
            break
        case "arx:rune_floruum_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "floruum")
            }
            break
        case "arx:rune_flurri_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "flurri")
            }
            break
        case "arx:rune_hijo_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "hijo")
            }
            break
        case "arx:rune_horo_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "horo")
            }
            break
        case "arx:rune_inoffo_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "inoffo")
            }
            break
        case "arx:rune_kon_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "kon")
            }
            break
        case "arx:rune_kotoka_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "kotoka")
            }
            break
        case "arx:rune_laffaeti_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "laffaeti")
            }
            break
        case "arx:rune_low_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "low")
            }
            break
        case "arx:rune_marra_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "marra")
            }
            break
        case "arx:rune_mega_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "mega")
            }
            break
        case "arx:rune_orduino_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "orduino")
            }
            break
        case "arx:rune_recuro_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "recuro")
            }
            break
        case "arx:rune_sakiifori_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "sakiifori")
            }
            break
        case "arx:rune_san_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "san")
            }
            break
        case "arx:rune_sartagana_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "sartagana")
            }
            break
        case "arx:rune_sempra_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "sempra")
            }
            break
        case "arx:rune_shumi_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "shumi")
            }
            break
        case "arx:rune_sin_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "sin")
            }
            break
        case "arx:rune_sofiso_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "sofiso")
            }
            break
        case "arx:rune_subversa_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "subversa")
            }
            break
        case "arx:rune_sukimo_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "sukimo")
            }
            break
        case "arx:rune_trafantana_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "trafantana")
            }
            break
        case "arx:rune_transkursio_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "transkursio")
            }
            break
        case "arx:rune_watashi_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "watashi")
            }
            break
        case "arx:rune_yanamo_b":
            if (manageCD(player)) {
                cipherRuneSequence(player, "yanamo")
            }
            break

        // М - тиронит
        case "arx:rune_affuono_s":
            cipherRuneSequence(player, "affuono")
            break
        case "arx:rune_arrako_s":
            cipherRuneSequence(player, "arrako")
            break
        case "arx:rune_din_s":
            cipherRuneSequence(player, "din")
            break
        case "arx:rune_disortari_s":
            cipherRuneSequence(player, "disortari")
            break
        case "arx:rune_elletera_s":
            cipherRuneSequence(player, "elletera")
            break
        case "arx:rune_floruum_s":
            cipherRuneSequence(player, "floruum")
            break
        case "arx:rune_flurri_s":
            cipherRuneSequence(player, "flurri")
            break
        case "arx:rune_hijo_s":
            cipherRuneSequence(player, "hijo")
            break
        case "arx:rune_horo_s":
            cipherRuneSequence(player, "horo")
            break
        case "arx:rune_inoffo_s":
            cipherRuneSequence(player, "inoffo")
            break
        case "arx:rune_kon_s":
            cipherRuneSequence(player, "kon")
            break
        case "arx:rune_kotoka_s":
            cipherRuneSequence(player, "kotoka")
            break
        case "arx:rune_laffaeti_s":
            cipherRuneSequence(player, "laffaeti")
            break
        case "arx:rune_low_s":
            cipherRuneSequence(player, "low")
            break
        case "arx:rune_marra_s":
            cipherRuneSequence(player, "marra")
            break
        case "arx:rune_mega_s":
            cipherRuneSequence(player, "mega")
            break
        case "arx:rune_orduino_s":
            cipherRuneSequence(player, "orduino")
            break
        case "arx:rune_recuro_s":
            cipherRuneSequence(player, "recuro")
            break
        case "arx:rune_sakiifori_s":
            cipherRuneSequence(player, "sakiifori")
            break
        case "arx:rune_san_s":
            cipherRuneSequence(player, "san")
            break
        case "arx:rune_sartagana_s":
            cipherRuneSequence(player, "sartagana")
            break
        case "arx:rune_sempra_s":
            cipherRuneSequence(player, "sempra")
            break
        case "arx:rune_shumi_s":
            cipherRuneSequence(player, "shumi")
            break
        case "arx:rune_sin_s":
            cipherRuneSequence(player, "sin")
            break
        case "arx:rune_sofiso_s":
            cipherRuneSequence(player, "sofiso")
            break
        case "arx:rune_subversa_s":
            cipherRuneSequence(player, "subversa")
            break
        case "arx:rune_sukimo_s":
            cipherRuneSequence(player, "sukimo")
            break
        case "arx:rune_trafantana_s":
            cipherRuneSequence(player, "trafantana")
            break
        case "arx:rune_transkursio_s":
            cipherRuneSequence(player, "transkursio")
            break
        case "arx:rune_watashi_s":
            cipherRuneSequence(player, "watashi")
            break
        case "arx:rune_yanamo_s":
            cipherRuneSequence(player, "yanamo")
            break

        // Спец
        case "arx:rune_ratatao":
            if (manageCD(player)) {
                cipherRuneSequence(player, "ratatao")
            }
            break
        case "arx:rune_nakamata":
            if (manageCD(player)) {
                cipherRuneSequence(player, "nakamata")
            }
            break

        // Сравнение использованного предмета НЕ через ID предмета
        default:
            // Посох
            if (item?.getTags().includes("is_staff")) {
                if (manageCD(player)) {
                    // Получаем количество каналов посоха
                    let staffChannels = 0

                    if (item.getTags().includes("staff_channels_1")) { staffChannels = 1 }
                    else if (item.getTags().includes("staff_channels_2")) { staffChannels = 2 }
                    else if (item.getTags().includes("staff_channels_3")) { staffChannels = 3 }
                    else if (item.getTags().includes("staff_channels_4")) { staffChannels = 4 }
                    else if (item.getTags().includes("staff_channels_5")) { staffChannels = 5 }
                    else if (item.getTags().includes("staff_channels_6")) { staffChannels = 6 }
                    else { console.warn(`Нет данных о каналах посоха ${event.itemStack.typeId}`) }

                    // Получаем текущий канал
                    const activeChannel = getMagicChannel(player, staffChannels)
                    clearChannelsTags(player)

                    // Кастуем
                    castSpell(player, activeChannel, item)
                }
            }
            // Палочка
            else if (item?.getTags().includes("is_wand")) {
                if (manageCD(player)) {
                    // Радиал
                    if (item?.getTags().includes("is_wand_radial")) {

                        player.runCommand("tag @s[rxm=20] add t1")
                        player.runCommand("tag @s[rx=20, rxm=-20] add t2")
                        player.runCommand("tag @s[rx=-20] add t3")

                        if (player.hasTag('t1')) { player.runCommand("tag @s remove t1"); player.setDynamicProperty('magicTarget', 1) }
                        else if (player.hasTag('t2')) { player.runCommand("tag @s remove t2"); player.setDynamicProperty('magicTarget', 2) }
                        else if (player.hasTag('t3')) { player.runCommand("tag @s remove t3"); player.setDynamicProperty('magicTarget', 3) }
                        reportAboutMagicTarget(player)
                    }
                    // Стардарт
                    else {
                        if (player.getDynamicProperty('magicTarget') == 1) { player.setDynamicProperty('magicTarget', 2) }
                        else if (player.getDynamicProperty('magicTarget') == 2) { player.setDynamicProperty('magicTarget', 3) }
                        else if (player.getDynamicProperty('magicTarget') == 3) { player.setDynamicProperty('magicTarget', 1) }
                        reportAboutMagicTarget(player)
                    }

                    // Анимируем
                    const animVar = getRandomInt(4)
                    if (animVar == 0) { player.runCommand("playanimation @s animation.arx.wand_a_a") }
                    else if (animVar == 1) { player.runCommand("playanimation @s animation.arx.wand_a_b") }
                    else if (animVar == 2) { player.runCommand("playanimation @s animation.arx.wand_a_b") }
                    else if (animVar == 3) { player.runCommand("playanimation @s animation.arx.wand_b_a") }

                    setScore(player, "target", player.getDynamicProperty('magicTarget'))
                }
            }
    }
})

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}

function reportAboutMagicTarget(player) {
    const magicTarget = player.getDynamicProperty('magicTarget')
    if (magicTarget == 1) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "Установлена цель: §aна себя" } ] }`) }
    if (magicTarget == 2) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "Установлена цель: §cна ближайшего" } ] }`) }
    if (magicTarget == 3) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "Установлена цель: §eна животных и монстров" } ] }`) }
}

// Получаем данные о канале
function getMagicChannel(player, numOfChannels) {
    // Функция вычисляет доступный канал магии. numOfChannels - число доступных каналов.
    if (numOfChannels == 6) {
        player.runCommand(`tag @s[rx=-60] add channel_1`)
        player.runCommand(`tag @s[rxm=-60, rx=-30] add channel_2`)
        player.runCommand(`tag @s[rxm=-30, rx=0] add channel_3`)
        player.runCommand(`tag @s[rxm=0.001, rx=30] add channel_4`)
        player.runCommand(`tag @s[rxm=30, rx=60] add channel_5`)
        player.runCommand(`tag @s[rxm=60] add channel_6`)
    }
    else if (numOfChannels == 5) {
        player.runCommand(`tag @s[rx=-45] add channel_1`)
        player.runCommand(`tag @s[rxm=-45, rx=-20] add channel_2`)
        player.runCommand(`tag @s[rxm=-20, rx=20] add channel_3`)
        player.runCommand(`tag @s[rxm=20, rx=45] add channel_4`)
        player.runCommand(`tag @s[rxm=45] add channel_5`)
    }
    else if (numOfChannels == 4) {
        player.runCommand(`tag @s[rx=-40] add channel_1`)
        player.runCommand(`tag @s[rxm=-40, rx=0] add channel_2`)
        player.runCommand(`tag @s[rxm=0.001, rx=40] add channel_3`)
        player.runCommand(`tag @s[rxm=40] add channel_4`)
    }
    else if (numOfChannels == 3) {
        player.runCommand(`tag @s[rx=-25] add channel_1`)
        player.runCommand(`tag @s[rx=25, rxm=-25] add channel_2`)
        player.runCommand(`tag @s[rxm=25] add channel_3`)
    }
    else if (numOfChannels == 2) {
        player.runCommand(`tag @s[rx=0] add channel_1`)
        player.runCommand(`tag @s[rxm=0.001] add channel_2`)
    }
    else if (numOfChannels == 1) {
        player.runCommand(`tag @s add channel_1`)
    }
    else {
        player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cОшибка при определении активного канала. Вы в этом не виноваты, это системная ошибка" } ] }`)
    }

    if (player.hasTag("channel_1")) { return 1 }
    if (player.hasTag("channel_2")) { return 2 }
    if (player.hasTag("channel_3")) { return 3 }
    if (player.hasTag("channel_4")) { return 4 }
    if (player.hasTag("channel_5")) { return 5 }
    if (player.hasTag("channel_6")) { return 6 }
}

// Подчищаем данные после анализа каналов
function clearChannelsTags(player) {
    player.removeTag("channel_1")
    player.removeTag("channel_2")
    player.removeTag("channel_3")
    player.removeTag("channel_4")
    player.removeTag("channel_5")
    player.removeTag("channel_6")
}

// Шифруем последовательность данных по факту набора последовательности рун
function cipherRuneSequence(player, runeName) {
    // Определяем канал
    const channel = getMagicChannel(player, 6)
    clearChannelsTags(player)

    if (!channel) {
        console.warn(`Не удалось определить канал`)
        return
    }

    // Сохраняем некоторые данные
    const dynamicPropertyName = `channel_${channel}_rune_sequence`

    // Проверяем, существует ли указаная руна
    if (!(runeName in runeCiphers)) {
        console.warn(`Попытка использовать несуществующую руну ${runeName}`)
        return undefined
    }

    // Устанавливаем напрямую данные о рунах в DynamicProperty
    player.setDynamicProperty(dynamicPropertyName, runeCiphers[runeName] + player.getDynamicProperty(dynamicPropertyName))

    // Срезаем длину строки, если она более 100 символов
    if (player.getDynamicProperty(dynamicPropertyName).length > 100) {
        player.setDynamicProperty(dynamicPropertyName, player.getDynamicProperty(dynamicPropertyName).substring(0, 100))
    }

    // Сообщаем игроку о введенной руне
    const runeNameCapitalized = runeName[0].toUpperCase() + runeName.slice(1)
    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§6${runeNameCapitalized} §bзаписано в §6${channel} §bканал" } ] }`)
}

function withdrawMpOnCastingSpell(player) {
    player.setDynamicProperty("mp", player.getDynamicProperty("mp") - getScore(player, "mp_req"))
}

function castSpell(player, channel, item) {
    // Получаем заклинание, корректно развернутое для использования
    const correctSpellCipher = reversePairs(findSpell(player, channel))

    // Отчитываемся, какой исопльзуется канал
    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§b${channel} §fканал" } ] }`)
    // Отчитываемся, какая используется цель
    {
        const magicTarget = player.getDynamicProperty('magicTarget')
        if (magicTarget == 1) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "Цель: §aна себя" } ] }`) }
        if (magicTarget == 2) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "Цель: §cна ближайшего" } ] }`) }
        if (magicTarget == 3) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "Цель: §eна животных и монстров" } ] }`) }
    }

    // Если есть закл
    if (correctSpellCipher) {

        player.addTag("self")
        player.runCommand("tag @p[tag=!self, r=15] add self2")

        if (item?.getTags().includes("staff_kon")) { player.addTag('staff_kon') }
        if (item?.getTags().includes("staff_sin")) { player.addTag('staff_sin') }
        if (item?.getTags().includes("staff_san")) { player.addTag('staff_san') }
        if (item?.getTags().includes("staff_din")) { player.addTag('staff_din') }

        // 
        // ИСПОЛНЕНИЕ ЗАКЛИНАНИЯ
        //

        // JS заклинания
        if (correctSpellCipher === "ACAH") {
            // Требуемая мана
            setScore(player, "mp_req", 5)
            // Если можно кастовать
            if (player.getDynamicProperty('magicTarget') == 1) {
                if (getScore(player, "mp_req") <= player.getDynamicProperty('mp')) {
                    player.addTag("spell_available")
                    castACAH(player)
                }
            }
            else {
                player.addTag('cant_be_casted_cus_of_target')
            }
        }

        // MCFunction заклинания
        else {
            // Определяем направление заклинания
            let spellType
            if (correctSpellCipher.startsWith("AC")) { spellType = 'din' }
            else if (correctSpellCipher.startsWith("AK")) { spellType = 'kon' }
            else if (correctSpellCipher.startsWith("AT")) { spellType = 'san' }
            else if (correctSpellCipher.startsWith("AX")) { spellType = 'sin' }
            else { console.warn(`Ошибка с определением направления KON/SIN/SAN/DIN заклинания ${correctSpellCipher}`) }

            // Переводим коду необходимые данные
            setScore(player, 'mp', player.getDynamicProperty('mp'))
            setScore(player, 'target', player.getDynamicProperty('magicTarget'))

            // Запускаем заклинание
            player.runCommand(`function spells/${spellType}/${correctSpellCipher}`)
        }

        //
        // ИСПОЛНЕНИЕ ЗАКЛИНАНИЯ - КОНЕЦ
        //


        // Отчет + анимация

        // Успешно использован закл
        if (player.hasTag('spell_available') && !player.hasTag('cant_be_casted_cus_of_target')) {
            withdrawMpOnCastingSpell(player)
            player.runCommand("playanimation @s animation.arx.staff_a")
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "Потрачено §b${getScore(player, "mp_req")}§f маны" } ] }`)

            // Выдаем опыт
            {
                const mpReq = getScore(player, "mp_req")

                // manaSkillIncreaseValue: Низкое значение до 30, резкий рост после.
                const manaSkillIncreaseValue = mpReq <= 30 ? mpReq / 30 : mpReq;

                // mpRegenSkillIncreaseValue: Высокое значение до 30, низкое после.
                const mpRegenSkillIncreaseValue = mpReq <= 30 ? mpReq / 2 : mpReq / 60;

                increaseSkillProgress(player, "mana", manaSkillIncreaseValue)
                increaseSkillProgress(player, "mp_regen", mpRegenSkillIncreaseValue)
            }
        }
        else {
            player.runCommand("playanimation @s animation.arx.no")
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cТребуется §b${getScore(player, "mp_req")}§c маны" } ] }`)

            if (player.hasTag("cant_be_casted_cus_of_target")) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cНевозможно использовать это заклинание на выбранную цель." } ] }`) }
        }

        player.removeTag("self")
        player.runCommand("tag @a remove self2")

    }
    // Если заклинания нет
    else {
        player.runCommand("playanimation @s animation.arx.no")
        player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cЗаклинание не заготовлено" } ] }`)
    }

    player.removeTag("spell_available")

    player.removeTag("drop_cost_with_staff")
    player.removeTag("drop_cost_with_amulet")

    player.removeTag("drop_25")
    player.removeTag("drop_50")

    player.removeTag("cant_be_casted_cus_of_target")
    player.removeTag("block_mp_withdraw")

    player.removeTag("staff_kon")
    player.removeTag("staff_sin")
    player.removeTag("staff_san")
    player.removeTag("staff_din")
}

function reversePairs(str) {
    if (!str) { return undefined }

    if (str?.length % 2 !== 0) {
        console.error(`Подана неверная строка в reversePairs: ${str}`)
        return undefined
    }

    let result = ""
    while (str != "") {
        result = str.slice(0, 2) + result
        str = str.slice(2)
    }
    return result
}