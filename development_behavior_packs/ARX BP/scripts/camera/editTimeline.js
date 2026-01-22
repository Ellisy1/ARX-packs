import { ActionFormData } from "@minecraft/server-ui"
import { timeline } from './launchCameraUI'
import { launchCameraUI } from "./launchCameraUI"
import { createTimecode, createFirstTimecode } from './createTimecode'

// Редактируем таймлайн
export function editTimeline(player) {

    // Определяем таймлайн игрока
    const playerTimeLine = timeline[player.name]

    let bodyText
    let addTimecodeText

    if (playerTimeLine.length === 0) {
        // В таймлайне ничего нет
        bodyText = 'Таймлайн пуст. Добавьте хотя бы один таймкод.\n\n[§ai§f] §aТаймкод§f - это точка в пространстве, через которую будет двигаться ваша камера.\n[§ai§f] §aТаймлайн§f - это список из таких точек, который является маршрутом для камеры.'
        addTimecodeText = 'Установить начальный таймкод'
    } else {
        // В таймлайне что-то есть
        bodyText = 'Таймлайн:'

        let timecodeCounter = 0
        for (const timecode of playerTimeLine) {

            if (timecodeCounter !== 0) {
                bodyText += `\n§r§f ↓ §a${timecode.lengthSec}§f s.`
            }

            // Если это первый таймкод
            if (timecodeCounter === 0) {
                bodyText += "\n§a<>§f Стартовая позиция камеры"
            } else {
                bodyText += '\n§a<>§f Таймкод'
            }

            timecodeCounter++
        }

        addTimecodeText = 'Добавить таймкод'
    }

    // console.warn(JSON.stringify(timeline))

    const form = new ActionFormData()
    form.title("Таймлайн")

    form.body(bodyText)
    form.divider()
    form.button(addTimecodeText, 'textures/ui/camera/add_timecode')
    if (playerTimeLine.length > 0) {
        form.button("Удалить последний таймкод", 'textures/ui/camera/remove_last_timecode')
        form.button("Очистить таймлайн", 'textures/ui/camera/clear_timeline')
    }

    form.show(player).then(response => {

        if (response.selection === 0) {
            // Если мы создаем не первый таймкод
            if (playerTimeLine.length > 0) {
                createTimecode(player)
            }
            // Если мы создаем начальный таймкод
            else {
                createFirstTimecode(player)
                editTimeline(player)
            }
        } else if (response.selection === 1) {
            playerTimeLine.pop()
            editTimeline(player)
        } else if (response.selection === 2) {
            timeline[player.name] = []
            editTimeline(player)
        }
    })
}