import { ModalFormData, MessageFormData, ActionFormData } from "@minecraft/server-ui"
import { getScore, setScore } from "./scoresOperations"
import { setRandomTastes } from './food/setRandomTastes'
import { tasteBodyString } from "./core/core"

// Функция регистрации персонажа
export function registerCharacter(player) {
    if (player.getDynamicProperty('hasRegisteredCharacter') === true) {
        const formNo = new ActionFormData()
            .title("Регистрация невозможна")
            .body(`Вы уже имеете загрегитрованного персонажа ${player.getDynamicProperty('trueName')}`)
            .show(player)
    }
    else if (player.getDynamicProperty('verify') === true) {
        switch (player.getDynamicProperty('registerCharacterStage')) {
            case undefined:
            case 0: // Начало регистрации
                const form0 = new MessageFormData()
                    .title("Создание персонажа")
                    .body('§lВы придумали своего персонажа?§r§f\n\n§cВНИМАНИЕ!§f Вы §cне сможете§f изменить персонажа позже, так что подумайте хорошо.\nНе торопитесь.')
                    .button1("Нет, мне ещё нужно подумать")
                    .button2("Да, начать создание персонажа")

                    .show(player)
                    .then((response) => {
                        if (response.selection === 1) { // Игрок нажал "продолжитиь"
                            player.setDynamicProperty('registerCharacterStage', 1)
                            registerCharacter(player)
                        }
                    })
                break

            case 1: // Выбор пола
                const form1 = new ActionFormData()
                    .title("Пол персонажа")
                    .body('§lВыберите пол вашего персонажа.\nПол §aне влияет§f на механики.')
                    .button("Мужской", 'textures/ui/registration/gender_man')
                    .button("Женский", 'textures/ui/registration/gender_woman')

                    .show(player)
                    .then((response) => {
                        if (response.selection === 0) { // Муж
                            player.setProperty('arx:gender', 1)
                            setScore(player, "gender", 1)
                            player.setProperty('arx:bust_size', 0)

                            player.setDynamicProperty('registerCharacterStage', 3)
                            registerCharacter(player)
                        } else if (response.selection === 1) { // Жен
                            player.setProperty('arx:gender', 2)
                            setScore(player, "gender", 2)

                            player.setDynamicProperty('registerCharacterStage', 2)
                            registerCharacter(player)
                        }
                    })
                break

            case 2: // Выбор размера груди
                const form2 = new ActionFormData()
                    .title("Размер груди")
                    .body('§lВыберите размер груди вашего персонажа.\nВлияет на отображение груди на одежде.')
                    .button("Плоская. Абсолютно ровная доска", 'textures/ui/registration/bust_size_0')
                    .button("Небольшая. Аккуратная и изящная", 'textures/ui/registration/bust_size_1')
                    .button("Достойная. Объёмная, но не черезмерная", 'textures/ui/registration/bust_size_2')
                    .button("Огромная. Большая, мягкая и грациозная", 'textures/ui/registration/bust_size_3')

                    .show(player)
                    .then((response) => {
                        if (response.selection != undefined) { // Выбран размер
                            player.setProperty('arx:bust_size', response.selection)

                            player.setDynamicProperty('registerCharacterStage', 3)
                            registerCharacter(player)
                        }
                    })
                break

            case 3: // Установка имени
                const localNameSample = getScore(player, 'gender') === 1 ? "Таинственный незнакомец" : "Таинственная незнакомка"
                const form3 = new ModalFormData()
                    .title("Имя персонажа")
                    .textField("Настоящее имя вашего персонажа.\n§7§oКроме вас его никто не увидит, даже модератор", "Настоящее имя персонажа")
                    .textField(`Имя для локального чата. \n§7§oМожно в любой момент сменить командой §d!§asetname§7.\nЭто может быть имя, а может быть\nчто-то вроде <${localNameSample}>`, "Имя для локального чата")
                    .submitButton('Установить имя')

                    .show(player).then(response => {

                        if (response.formValues) {

                            const correctedTrueName = response.formValues[0].trim()
                            const correctedName = response.formValues[1].trim()

                            let wrongInput = false

                            if (correctedTrueName == "") {
                                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cНастоящее имя персонажа не может быть пустым." } ] }`)
                                wrongInput = true
                            } else if (correctedTrueName.length > 30) {
                                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cНастоящее имя персонажа не может быть таким длинным." } ] }`)
                                wrongInput = true
                            }

                            if (correctedName == "") {
                                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cИмя для локального чата не может быть пустым." } ] }`)
                                wrongInput = true
                            } else if (correctedName.length > 30) {
                                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cИмя для локального чата не может быть таким длинным." } ] }`)
                                wrongInput = true
                            }

                            if (!wrongInput) {
                                player.setDynamicProperty("trueName", correctedTrueName)
                                player.setDynamicProperty("name", correctedName)

                                player.setDynamicProperty('registerCharacterStage', 4)
                                registerCharacter(player)
                            }
                        }
                    })
                break

            case 4: // Установка вуксов
                setRandomTastes(player)
                const form4 = new MessageFormData()
                    .title("Перебрасывайте вкусы, пока они вам не понравятся")
                    .body(tasteBodyString(player))
                    .button1("Принять и продолжить")
                    .button2("Перебросить вкусы")

                    .show(player)
                    .then((response) => {
                        if (response.selection === 0) { // Игрок принял
                            player.setDynamicProperty('registerCharacterStage', 5)
                            registerCharacter(player)
                        }
                        else if (response.selection === 1) { // Игрок перебросил
                            registerCharacter(player)
                        }
                    })
                break

            case 5: // Установка формы рук
                const form5 = new ActionFormData()
                    .title("Форма рук")
                    .body("Какова форма рук скина вашего персонажа?\nЭто скорректирует отображение некоторой одежды")
                    .button("Широкие (как у Стива)", 'textures/ui/registration/arms_type_steve')
                    .button("Тонкие (как у Алекс)", 'textures/ui/registration/arms_type_alex')
                    .button("Мне надо рассмотреть скин\n(закрыть это меню)", 'textures/ui/registration/arms_type_check')

                    .show(player).then(response => {

                        if (response.selection != 2 && response.selection != undefined) {
                            player.setProperty('arx:arms_type', response.selection)
                            player.setDynamicProperty('registerCharacterStage', 6)
                            registerCharacter(player)
                        }
                    })
                break

            case 6: // Установка роста
                let defaultHeightValue
                player.getDynamicProperty('height') === undefined ? defaultHeightValue = 175 : defaultHeightValue = player.getDynamicProperty('height')
                const form6 = new ModalFormData()
                    .title("Рост персонажа")
                    .slider("У §aнизких§f персонажей §aменьше хитбокс§f\n\nУ §aвысоких§f персонажей §aвыше скорость бега (не более +5Ũ)§f\n\n§cЭти эффекты незначительны на практике! Выбирайте рост персонажа исходя из его лора, а не из бонусов\n\n§fРост вашего персонажа", 150, 195, { defaultValue: defaultHeightValue })
                    .submitButton('Посмотреть, как это выглядит')

                    .show(player).then(response => {

                        if (response.formValues) {
                            player.setDynamicProperty("height", response.formValues[0])
                            player.setProperty("arx:height", response.formValues[0])
                            player.runCommand(`event entity @s arx:setHeight_${response.formValues[0]}`)


                            player.setDynamicProperty('registerCharacterStage', 7)
                            player.runCommand(`tellraw @s { "rawtext": [ { "text": "Посмотрите на своего персонажа от третьего лица, §aвам нравится§f его §aрост§f? Возвращайтесь к <создать персонажа>, когда определитесь с ответом." } ] }`)
                        }
                    })
                break

            case 7: // Проверка роста
                const form7 = new MessageFormData()
                    .title("Рост персонажа")
                    .body('Сохраняем рост?')
                    .button1("Да, мне нравится")
                    .button2("Нет, изменить рост")

                    .show(player)
                    .then((response) => {
                        if (response.selection === 0) { // Игрок нажал "продолжитиь"
                            player.setDynamicProperty('registerCharacterStage', 8)
                            registerCharacter(player)
                        } else if (response.selection === 1) {
                            player.setDynamicProperty('registerCharacterStage', 6)
                            registerCharacter(player)
                        }
                    })
                break

            case 8: // Установка типа глаз

                const form8 = new ActionFormData()
                    .title("Позиция глаз")
                    .body('§aВыберите позицию глаз§f вашего персонажа. Это нужно для более точного отображения некоторых аксессуаров.\n\n§7Если у вас возникнут сложности, обратитесь к модератору.')
                    .button("Отступ от низа головы в 4 пикселя", 'textures/ui/registration/eyes_position_man_high')
                    .button("Отступ от низа головы в 3 пикселя", 'textures/ui/registration/eyes_position_man_default')
                    .button("Отступ от низа головы в 2 пикселя", 'textures/ui/registration/eyes_position_woman_high')
                    .button("Отступ от низа головы в 1 пиксель,\nДвойной размер глаз", 'textures/ui/registration/eyes_position_woman_default')
                    .button("Отступ от низа головы в 1 пиксель,\nОбычный размер глаз", 'textures/ui/registration/eyes_position_woman_low')
                    .button("Мне нужно рассмотреть скин", 'textures/ui/registration/eyes_position_check')

                    .show(player)
                    .then((response) => {
                        if (response.selection != undefined) { // Игрок нажал хоть что-то
                            // Устанавливаем высоту глаз, зависимо от выбранно опции
                            if (response.selection === 0) { player.setProperty('arx:eyes_position', 2) }
                            if (response.selection === 1) { player.setProperty('arx:eyes_position', 1) }
                            if (response.selection === 2) { player.setProperty('arx:eyes_position', 0) }
                            if (response.selection === 3) { player.setProperty('arx:eyes_position', 0) }
                            if (response.selection === 4) { player.setProperty('arx:eyes_position', 0) }
                            // Перекидываем на след этап регистрации
                            if (response.selection !== 5) {
                                player.setDynamicProperty('registerCharacterStage', 9)
                                registerCharacter(player)
                            }
                        }
                    })
                break

            case 9: // Спавн в мире
                let bodyText
                getScore(player, "gender") === 1 ? bodyText = `${player.getDynamicProperty('trueName')} создан!` : bodyText = `${player.getDynamicProperty('trueName')} создана!`
                const form9 = new ActionFormData()
                    .title("Появление в мире")
                    .body(bodyText)
                    .button("Поехали!\n(рекомендуется помолиться)", 'textures/ui/registration/spawn')
                    .button("Я пока позависаю в лобби", 'textures/ui/registration/spawn_pass_for_now')

                    .show(player)
                    .then((response) => {
                        if (response.selection != undefined) { // Игрок нажал хоть что-то
                            if (response.selection === 0) {
                                player.runCommand("function tp/2_spawn")

                                player.setDynamicProperty('registerCharacterStage', 0)
                                player.setDynamicProperty('hasRegisteredCharacter', true)

                                player.runCommand(`give @s arx:united_player_data 1 0 {"keep_on_death":{}}`)

                                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aВы в игре!§f\n§c!§f Используйте §aкнижку§f, которая у вас в инвентаре, и выберите в открывшемся меню самый верхний пункт §aГид§f. Обращайтесь к нему почаще!" } ] }`)
                            }
                        }
                    })
                break
        }
    } else {
        const form = new ActionFormData()
            .title("Создание персонажа")
            .body(`Добро пожаловать в Аркс, §a${player.name}§f!\n\nДождитесь, пока вас верифицируют! Верификация означает, что вы можете играть здесь.\n\nВам сразу же выдадут верификацию, как удостоверяется, что вы §aзнаете правила§f и §aимеете подходящий скин§f.\n\n\n\n\n\n\n\nВы получите сообщение, когда вас верифицируют.`)
            .show(player)
    }
}