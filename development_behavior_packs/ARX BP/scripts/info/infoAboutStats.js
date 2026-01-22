import { ActionFormData } from "@minecraft/server-ui"
import { getScore } from "../scoresOperations"

// Отображение UI еды
export function infoAboutStats(player) {
    const form = new ActionFormData()
        .title("Характеристики")
        .body(getBodyText(player))
        .show(player)
}

function getBodyText(player) {
    let bodyText = ''

    bodyText += "§e|§f "

    {
        switch (player.getDynamicProperty('stressLevel')) {
            case 4:
                bodyText += ' Стресс 4 (макс.) уровня.\n§e|§f Характеристики §4сильно понижены§f'
                break
            case 3:
                bodyText += ' Стресс 3 уровня.\n§e|§f Характеристики §cпонижены§f'
                break
            case 2:
                bodyText += ' Стресс 2 уровня.\n§e|§f Характеристики §eнемного понижены§f'
                break
            case 1:
                bodyText += ' Стресс 1 уровня.\n§e|§f Характеристики не изменены'
                break
            case 0:
                bodyText += ' Нейтральное настроение.\n§e|§f Характеристики не изменены'
                break
            case -1:
                bodyText += ' Счастье 1 уровня.\n§e|§f Характеристики не изменены'
                break
            case -2:
                bodyText += ' Счастье 2 уровня.\n§e|§f Характеристики §aнемного повышены§f'
                break
            case -3:
                bodyText += ' Счастье 3 уровня.\n§e|§f Характеристики §aповышены§f'
                break
            case -4:
                bodyText += ' Счастье 4 (макс.) уровня.\n§e|§f Характеристики §aсильно повышены§f'
                break
            default:
                bodyText += 'Непредвиденная ошибка определения состояния счастья'
                console.warn('Непредвиденная ошибка определения состояния счастья при использовании <инфо> у ' + player.name)
        }

    }

    bodyText += "\n§8|§f\n"

    bodyText += "§c|§f " + `Базовый урон: §b${player.getDynamicProperty('basicStrength')}§f\n`

    bodyText += "§c|§f " + `Загруженность: §b${player.getDynamicProperty('weighLoading')}§f из§b ${player.getDynamicProperty('weighLimit')}§f\n`

    bodyText += "§8|§f\n"

    bodyText += "§d|§f " + `Макс мана: §b${player.getDynamicProperty('maxMp')}§f\n`

    bodyText += "§d|§f " + `Регенерация маны: §b${player.getDynamicProperty('mpRegenPower').toFixed(2)}§f в сек.\n`

    bodyText += "§8|§f\n"

    bodyText += "§a|§f " + `Точность стрельбы: §b${player.getProperty("arx:ranged_attack_accuracy")}§f §7§o(20 = макс.)§r§f\n`

    bodyText += "§a|§f " + `Скорость: §b${player.getDynamicProperty('speedPower')}§fŨ\n`

    bodyText += "§a|§f " + `Усиление прыжка: §b${player.getDynamicProperty('jumpPower')}§f\n`

    bodyText += "§8|§f\n"

    bodyText += "§6|§f " + `Увеличение получаемого опыта: §b${player.getDynamicProperty('xpMultiplier')}§fx\n`

    bodyText += "§8|§f\n"

    bodyText += "§2|§f " + `Уровень интоксикации: §b${player.getDynamicProperty('intoxicationLevel')}§f\n`

    bodyText += "§2|§f " + `Скорость снижения интоксикации: §b${player.getDynamicProperty('intoxicationDecreasePower')}§fŨ\n`

    return bodyText
}