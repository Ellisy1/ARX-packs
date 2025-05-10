import { ModalFormData } from "@minecraft/server-ui"

// Выводим экранчик с опциями навыков
export function arxSettings(player) {
    // Дефолтные значения слайдеров
    let manaDisplayModeDefaultDropdownPos
    if (player.getDynamicProperty('myRule:manaDisplayMode') === 'integers') {manaDisplayModeDefaultDropdownPos = 0}
    else if (player.getDynamicProperty('myRule:manaDisplayMode') === 'decimals') {manaDisplayModeDefaultDropdownPos = 1}
    else if (player.getDynamicProperty('myRule:manaDisplayMode') === 'none') {manaDisplayModeDefaultDropdownPos = 2}

    let showAttackCDModeDefaultSliderPos
    if (player.getDynamicProperty('myRule:showAttackCDMode') === 'seconds') {showAttackCDModeDefaultSliderPos = 0}
    if (player.getDynamicProperty('myRule:showAttackCDMode') === 'ticks') {showAttackCDModeDefaultSliderPos = 1}
    if (player.getDynamicProperty('myRule:showAttackCDMode') === 'line') {showAttackCDModeDefaultSliderPos = 2}
    if (player.getDynamicProperty('myRule:showAttackCDMode') === 'none') {showAttackCDModeDefaultSliderPos = 3}

    const canSeeServerSpeedInInfoBookDefaultTogglePos = player.getDynamicProperty('myRule:canSeeServerSpeedInInfoBook')
    const cinematographicModeDefaultTogglePos = player.getDynamicProperty('myRule:cinematographicMode')

    const form = new ModalFormData()
        .title("Настройки Аркса")

        .dropdown('Отображение §bманы', ['Натуральные числа', 'Десятичные дроби', '§cНе отображать'], {defaultValueIndex: manaDisplayModeDefaultDropdownPos})
        .dropdown('Отображение §cотката атаки', ['Секунды', 'Такты (сек/20)', 'Линия', '§cНе отображать'], {defaultValueIndex: showAttackCDModeDefaultSliderPos})
        .toggle("Отображение производительности в <Инфо>", {defaultValue: canSeeServerSpeedInInfoBookDefaultTogglePos})
        .toggle("Кинематографический режим", {defaultValue: cinematographicModeDefaultTogglePos, tooltip: 'Вы сможете вызывать меню управления камерой, использовав предмет <Инфо> на присяде.'})


        .submitButton('Сохранить')

        .show(player).then(response => {

            if (response.formValues) {
                // myRule:manaDisplayMode
                if (response.formValues[0] === 0) {player.setDynamicProperty('myRule:manaDisplayMode', 'integers')}
                else if (response.formValues[0] === 1) {player.setDynamicProperty('myRule:manaDisplayMode', 'decimals')}
                else if (response.formValues[0] === 2) {player.setDynamicProperty('myRule:manaDisplayMode', 'none')}

                if (response.formValues[1] === 0) {player.setDynamicProperty('myRule:showAttackCDMode', 'seconds')}
                else if (response.formValues[1] === 1) {player.setDynamicProperty('myRule:showAttackCDMode', 'ticks')}
                else if (response.formValues[1] === 2) {player.setDynamicProperty('myRule:showAttackCDMode', 'line')}
                else if (response.formValues[1] === 3) {player.setDynamicProperty('myRule:showAttackCDMode', 'none')}

                player.setDynamicProperty('myRule:canSeeServerSpeedInInfoBook', response.formValues[2])

                player.setDynamicProperty('myRule:cinematographicMode', response.formValues[3])
            }
        })
}