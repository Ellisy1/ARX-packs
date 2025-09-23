import { iDP, ssDP } from '../../DPOperations'
import { ActionFormData, ModalFormData } from "@minecraft/server-ui"
import { castSpell } from '../on_use_magic_items'
import { system } from "@minecraft/server"

/*
Цепь хранится в виде
DP chainSpell = 1:2:4:9, где цифры - это каналы, а ":" - разделители
*/

// Ключевая фукнция заклинания
export function chain(player) {
    if (player.hasTag('is_sneaking')) {
        // Отложим выполнение до следующего тика
        system.runTimeout(() => {
            editChain(player);
        }, 0);
    } else {
        // Отложим выполнение до следующего тика
        system.runTimeout(() => {
            player.sendMessage('§a>>> Цепь начата')
            executeChain(player);
            player.sendMessage('§v<<< Цепь окончена')
        }, 0);
    }
}

// Редактирование цепи
function editChain(player) {
    const form = new ActionFormData()
        .title("Цепь заклинаний")

        .body(createBodyText(player))

    form.button(`Добавить канал в цепь`, 'textures/ui/camera/edit_timeline')
    form.button("Очистить цепь", 'textures/ui/camera/clear_timeline')

    form.show(player).then(response => {

        if (response.selection === 0) {
            addChannelToChain(player)
        }
        if (response.selection === 1) {
            ssDP(player, 'chainSpell', undefined)
            editChain(player)
        }
    })
}

// Добавление канала в цепь
function addChannelToChain(player) {
    const form3 = new ModalFormData()
        .title("Добавление канала")
        .textField("Номер канала, который будет записан в цепь", "1 - 10 включительно")
        .submitButton('Добавить в цепь')

        .show(player).then(response => {

            if (response.formValues) {

                let result = Number(response.formValues[0])

                if (result > 0 && result < 11) {
                    const chainDP = player.getDynamicProperty('chainSpell')

                    let cnannelsArray
                    let channelsString

                    if (chainDP !== undefined) {
                        cnannelsArray = chainDP.split(':')
                        cnannelsArray.push(result)
                        channelsString = cnannelsArray.join(':')
                    }
                    else {
                        channelsString = String(result)
                    }
                    ssDP(player, 'chainSpell', channelsString)
                }

                editChain(player)
            }
        })
}

// Создать текст для окна редактирования цепи
function createBodyText(player) {
    let chainDP = player.getDynamicProperty('chainSpell')

    // Если нет цепи
    if (chainDP === undefined) {
        return 'Текущая цепь пуста'
    }

    chainDP = String(chainDP)

    // Если есть цепь
    let cnannelsArray
    if (chainDP.includes(':')) {
        cnannelsArray = chainDP.split(':')
    }
    else {
        cnannelsArray = [chainDP]
    }

    return `Текущие каналы в цепи:\n${cnannelsArray.join('\n§a↓§f\n')}`
}

// Исполнить цепь
function executeChain(player) {
    let chainDP = player.getDynamicProperty('chainSpell')
    if (chainDP === undefined) {
        player.sendMessage('§6Цепь пустая. Запишите в неё хоть что-то, использовав заклинание цепи на присяде.')
        return
    } else {
        chainDP = String(chainDP)
        const arrayOfChannels = chainDP.split(':')
        for (const channel of arrayOfChannels) {
            castSpell(player, channel)
        }
    }
}