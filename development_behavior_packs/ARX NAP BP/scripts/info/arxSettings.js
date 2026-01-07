import { ModalFormData } from "@minecraft/server-ui"
import { ssDP } from "../DPOperations"

// Выводим экранчик с опциями навыков
export function arxSettings(player) {
    // Дефолтные значения слайдеров
    let manaDisplayModeDefaultDropdownPos
    if (player.getDynamicProperty('myRule:manaDisplayMode') === 'integers') { manaDisplayModeDefaultDropdownPos = 0 }
    else if (player.getDynamicProperty('myRule:manaDisplayMode') === 'decimals') { manaDisplayModeDefaultDropdownPos = 1 }
    else if (player.getDynamicProperty('myRule:manaDisplayMode') === 'none') { manaDisplayModeDefaultDropdownPos = 2 }

    let showAttackCDModeDefaultDropdownPos
    if (player.getDynamicProperty('myRule:showAttackCDMode') === 'seconds') { showAttackCDModeDefaultDropdownPos = 0 }
    if (player.getDynamicProperty('myRule:showAttackCDMode') === 'secondsFloat') { showAttackCDModeDefaultDropdownPos = 1 }
    if (player.getDynamicProperty('myRule:showAttackCDMode') === 'ticks') { showAttackCDModeDefaultDropdownPos = 2 }
    if (player.getDynamicProperty('myRule:showAttackCDMode') === 'line') { showAttackCDModeDefaultDropdownPos = 3 }
    if (player.getDynamicProperty('myRule:showAttackCDMode') === 'none') { showAttackCDModeDefaultDropdownPos = 4 }

    let chatPrefixesDefaultDropdownPos
    if (player.getDynamicProperty('myRule:chatPrefixes') === 'fullEN') { chatPrefixesDefaultDropdownPos = 0 }
    if (player.getDynamicProperty('myRule:chatPrefixes') === 'shortEN') { chatPrefixesDefaultDropdownPos = 1 }

    const canSeeServerSpeedInInfoBookDefaultTogglePos = player.getDynamicProperty('myRule:canSeeServerSpeedInInfoBook')
    const cinematographicModeDefaultTogglePos = player.getDynamicProperty('myRule:cinematographicMode')

    const form = new ModalFormData()
        .title("Настройки Аркса")

        .dropdown('После внесения изменений, не забудьте нажать кнопку §aсохранить§f внизу этого экрана!\n\nОтображение §bманы', ['Натуральные числа', 'Десятичные дроби', '§cНе отображать'], { defaultValueIndex: manaDisplayModeDefaultDropdownPos })
        .dropdown('Отображение §cотката атаки', ['Секунды', 'Секунды, десятичные дроби', 'Такты (сек/20)', 'Линия', '§cНе отображать'], { defaultValueIndex: showAttackCDModeDefaultDropdownPos })
        .dropdown('Префиксы §aчатов', ['Полные §f[§aЛокал.§f]', 'Сокращённые §f[§aЛ§f]'], { defaultValueIndex: chatPrefixesDefaultDropdownPos })
        .toggle("Отображение производительности в <Инфо>", { defaultValue: canSeeServerSpeedInInfoBookDefaultTogglePos })
        .toggle("Кинематографический режим", { defaultValue: cinematographicModeDefaultTogglePos, tooltip: 'Вы сможете вызывать меню управления камерой, использовав предмет <Инфо> на присяде.' })


        .submitButton('Сохранить')

        .show(player).then(response => {

            if (response.formValues) {
                // myRule:manaDisplayMode
                if (response.formValues[0] === 0) ssDP(player, 'myRule:manaDisplayMode', 'integers')
                else if (response.formValues[0] === 1) ssDP(player, 'myRule:manaDisplayMode', 'decimals')
                else if (response.formValues[0] === 2) ssDP(player, 'myRule:manaDisplayMode', 'none')

                if (response.formValues[1] === 0) ssDP(player, 'myRule:showAttackCDMode', 'seconds')
                else if (response.formValues[1] === 1) ssDP(player, 'myRule:showAttackCDMode', 'secondsFloat')
                else if (response.formValues[1] === 2) ssDP(player, 'myRule:showAttackCDMode', 'ticks')
                else if (response.formValues[1] === 3) ssDP(player, 'myRule:showAttackCDMode', 'line')
                else if (response.formValues[1] === 4) ssDP(player, 'myRule:showAttackCDMode', 'none')

                if (response.formValues[2] === 0) ssDP(player, 'myRule:chatPrefixes', 'fullEN')
                else if (response.formValues[2] === 1) ssDP(player, 'myRule:chatPrefixes', 'shortEN')

                ssDP(player, 'myRule:canSeeServerSpeedInInfoBook', response.formValues[3])

                ssDP(player, 'myRule:cinematographicMode', response.formValues[4])
            }
        })
}