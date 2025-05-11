import { ActionFormData } from "@minecraft/server-ui"
import { editTimeline } from './editTimeline'
import { indicateTimecodes } from './indicateTimecodes'

// Переменная, хранящая все таймлайны камеры всех игроков
export let timeline = {}

// Выводим экранчик с опциями навыков
export function launchCameraUI(player) {

    // Создаем таймлайн, если его не было вообще
    if (!(player.name in timeline)) {
        timeline[player.name] = []
    }

    const form = new ActionFormData()
        .title("Камера")

        .body('[§c!§f] Используйте камеру ТОЛЬКО по прямому назначению! Использование камеры в нон-рп целях может быть отслежено модерацией и будет рассматриваться как тяжёлое нарушение правил.\n')

        .button(`Редактировать таймлайн\n§o${timeline[player.name].length} элементов`, 'textures/ui/camera/edit_timeline')
        .button("Запустить камеру", 'textures/ui/camera/launch_camera')
        .button("Подсветить существующие таймкоды", 'textures/ui/camera/indicate_timecodes')

        .show(player).then(response => {

            if (response.selection === 0) {
                editTimeline(player)
            } else if (response.selection === 1) {
                if (timeline[player.name].length === 0) {
                    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cВаш таймлайн пуст, невозможно запустить камеру." } ] }`)
                } else if (timeline[player.name].length === 1) {
                    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cУ вас установлен только стартовый таймкод. Для работы камеры необходимо минимум два таймкода." } ] }`)
                } else {
                    player.setDynamicProperty('camera:activeCamera', true)
                    player.setDynamicProperty('camera:numOfProcessedTimecodes', 0)
                    player.setDynamicProperty('camera:tickCountdownToNextTimecode', 0)
                }
            } else if (response.selection === 2) {
                if (timeline[player.name].length === 0) {
                    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cВы не создали ни одного таймкода. Чтобы создать их, зайдите в меню <Редактировать таймлайн>." } ] }`)
                }
                else {
                    indicateTimecodes(player)
                }
            }
        })
}