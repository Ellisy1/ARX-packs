// Imports - Minecraft
import { world, EntityComponentTypes, EquipmentSlot } from "@minecraft/server";

import { runeCiphers } from './rune_cipher_list'

import { castJSSpell } from './spells/castJSSpell'
import { findSpell } from "./findSpell"
import { getActiveStaffChannel } from './getActiveStaffChannel'

import { getScore, setScore } from "../scoresOperations";
import { increaseSkillProgress } from "../skillsOperations";

import { manageCD } from "../manageCD";
import { queueCommand } from "../commandQueue";
import { iDP, ssDP } from "../DPOperations";

// Использование предметов
world.afterEvents.itemUse.subscribe((event) => { // Обнаружаем юзание предмета на ПКМ

    const player = event.source; // Получаем объект игрока
    const item = player.getComponent(EntityComponentTypes.Equippable).getEquipment(EquipmentSlot.Mainhand)

    if (!item) {
        return undefined
    }

    // Руна 
    for (const itemTag of item?.getTags()) {
        // Нашли тег вида rune:runeName
        if (itemTag.includes('rune:')) {
            // Получили runeName
            const rune = itemTag.split(':')[1]
            // Если у руны есть кд
            if (!item?.getTags().includes('malafiotironite_rune')) {
                if (manageCD(player)) {
                    cipherRuneSequence(player, rune, item?.getTags())
                }
            } else { // Если руна без кд
                cipherRuneSequence(player, rune, item?.getTags())
            }
        }
    }
    // Посох
    if (item?.getTags().includes("is_staff")) {
        if (manageCD(player)) {
            // Получаем количество каналов посоха
            let staffChannels = null;
            const tagPrefix = "staff_channels_";

            for (const tag of item.getTags()) {
                if (tag.startsWith(tagPrefix)) {
                    const numStr = tag.substring(tagPrefix.length);
                    const num = parseInt(numStr, 10);

                    if (!isNaN(num) && num > 0) {
                        staffChannels = num;
                        break; // нашли — выходим
                    }
                }
            }

            if (staffChannels === null) {
                console.warn(`Нет данных о каналах посоха ${event.itemStack.typeId}`);
            }

            // Получаем текущий канал
            const activeChannel = getActiveStaffChannel(player, staffChannels)

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

                if (player.hasTag('t1')) { player.runCommand("tag @s remove t1"); ssDP(player, 'magicTarget', 1) }
                else if (player.hasTag('t2')) { player.runCommand("tag @s remove t2"); ssDP(player, 'magicTarget', 2) }
                else if (player.hasTag('t3')) { player.runCommand("tag @s remove t3"); ssDP(player, 'magicTarget', 3) }
                reportAboutMagicTarget(player)
            }
            // Стардарт
            else {
                if (player.getDynamicProperty('magicTarget') == 1) { ssDP(player, 'magicTarget', 2) }
                else if (player.getDynamicProperty('magicTarget') == 2) { ssDP(player, 'magicTarget', 3) }
                else if (player.getDynamicProperty('magicTarget') == 3) { ssDP(player, 'magicTarget', 1) }
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

// Шифруем последовательность данных по факту набора последовательности рун (АКТИВИРУЕТСЯ ПРИ ЮЗАНИИ РУНЫ)
export function cipherRuneSequence(player, runeName, runeTags) {

    // Определяем каналы
    let channel = undefined
    if (runeTags?.includes('plumbum_rune')) { channel = 4 }
    else if (runeTags?.includes('naginitis_rune')) { channel = 6 }
    else if (runeTags?.includes('forfacorite_rune')) { channel = 10 }
    else if (runeTags?.includes('special_rune')) { channel = 10 }
    else if (runeTags?.includes('malafiotironite_rune')) { channel = 8 }
    else if (runeTags?.includes('amul_hypersynergy')) { channel = 4 }
    else if (runeTags?.includes('amul_hypersynergy_improved')) { channel = 6 }
    else if (runeTags?.includes('amul_hypersynergy_superior')) { channel = 8 }

    if (channel === undefined) {
        console.warn(`Не удалось определить канал при записи руны в шифр (функция cipherRuneSequence)`)
        return undefined
    }

    channel = getActiveStaffChannel(player, channel)

    // Сохраняем некоторые данные
    const dynamicPropertyName = `channel_${channel}_rune_sequence`

    // Проверяем, существует ли указаная руна
    if (!(runeName in runeCiphers)) {
        console.warn(`Попытка использовать несуществующую руну ${runeName}`)
        return undefined
    }

    // Устанавливаем напрямую данные о рунах в DynamicProperty

    ssDP(player, dynamicPropertyName, runeCiphers[runeName] + player.getDynamicProperty(dynamicPropertyName))

    // Срезаем длину строки, если она более 100 символов
    if (player.getDynamicProperty(dynamicPropertyName).length > 100) {
        ssDP(player, dynamicPropertyName, player.getDynamicProperty(dynamicPropertyName).substring(0, 100))
    }

    // Сообщаем игроку о введенной руне
    const runeNameCapitalized = runeName[0].toUpperCase() + runeName.slice(1)
    queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§6${runeNameCapitalized} §bзаписано в §6${channel} §bканал" } ] }`)
}

// Снимаем ману при использовании закла
function withdrawMpOnCastingSpell(player) {
    iDP(player, "mp", -getScore(player, "mp_req"))
}

// Кастуем закл
export function castSpell(player, activeChannel, staff) {
    // Получаем заклинание, корректно развернутое для запуска mcfunction заклинаний
    const reverseSpellCipher = reversePairs(findSpell(player, activeChannel))

    // Отчитываемся, какой используется канал
    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§b${activeChannel} §fканал" } ] }`)

    // Отчитываемся, какая используется цель
    {
        const magicTarget = player.getDynamicProperty('magicTarget')
        if (magicTarget === 1) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "Цель: §aна себя" } ] }`) }
        if (magicTarget === 2) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "Цель: §cна ближайшего" } ] }`) }
        if (magicTarget === 3) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "Цель: §eна животных и монстров" } ] }`) }
    }

    // Если есть закл
    if (reverseSpellCipher) {

        player.addTag("self")
        player.runCommand("tag @p[tag=!self, r=15] add self2")

        if (staff?.getTags().includes("staff_kon")) { player.addTag('staff_kon') }
        if (staff?.getTags().includes("staff_sin")) { player.addTag('staff_sin') }
        if (staff?.getTags().includes("staff_san")) { player.addTag('staff_san') }
        if (staff?.getTags().includes("staff_din")) { player.addTag('staff_din') }

        // 
        // ИСПОЛНЕНИЕ ЗАКЛИНАНИЯ
        //

        // JS заклинания
        castJSSpell(player, findSpell(player, activeChannel, 'sequence'))

        // MCFunction заклинания
        if (!player.hasTag('spell_available')) {
            // Определяем направление заклинания
            let spellType
            if (reverseSpellCipher.startsWith("AC")) { spellType = 'din' }
            else if (reverseSpellCipher.startsWith("AK")) { spellType = 'kon' }
            else if (reverseSpellCipher.startsWith("AT")) { spellType = 'san' }
            else if (reverseSpellCipher.startsWith("AX")) { spellType = 'sin' }
            else { console.warn(`Ошибка с определением направления KON/SIN/SAN/DIN заклинания ${reverseSpellCipher}`) }

            // Переводим коду необходимые данные
            setScore(player, 'mp', player.getDynamicProperty('mp'))
            setScore(player, 'target', player.getDynamicProperty('magicTarget'))

            // Запускаем заклинание
            player.runCommand(`function spells/${spellType}/${reverseSpellCipher}`)
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

                // РЕГЕН mpRegenSkillIncreaseValue: Низкое значение до 30, резкий рост после.
                const mpRegenSkillIncreaseValue = mpReq <= 30 ? mpReq / 6 : mpReq;

                // МАКС МП manaSkillIncreaseValue: Высокое значение до 30, низкое после.
                const manaSkillIncreaseValue = mpReq <= 30 ? mpReq * 3 : mpReq / 2;

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