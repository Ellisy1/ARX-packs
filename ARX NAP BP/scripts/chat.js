// Imports
import { world } from "@minecraft/server"
import { emote } from './emote'
import { getScore } from './scoresOperations'
import { getSkillsData } from './skillsOperations'
import { queueCommand } from './commandQueue'
import { increaseSkillProgress } from "./skillsOperations"
import { getMoscowTime } from './date'

// Обработка чата before
world.beforeEvents.chatSend.subscribe((eventData) => {
    const player = eventData.sender
    let trimmedMessage = eventData.message.trim()

    const commandList = trimmedMessage.split(" ++ ").filter(item => item !== "")

    for (let command of commandList) {
        parceCommand(player, command.trim())
    }

    eventData.cancel = true // Предотвращаем отправку сообщения в чат
});

function parceCommand(player, trimmedMessage) {
    if (trimmedMessage.startsWith("!")) { // Если это команда Аркса
        // command содержит в себе список из последовательности введенных слов в команде
        const command = trimmedMessage.split(/\s+/)

        if (command[0] == "!test") { // Тест функция
            if (isAdmin(player)) {
                // Получаем внеигровое время
                console.warn(getMoscowTime())
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cНевозможно использовать команду ${command[0]} без прав модератора." } ] }`)
            }
        }

        else if (command[0] == "!eval") { // Eval функция
            const codeToEval = trimmedMessage.slice(5);
            try {
                const result = eval(codeToEval);
                // Отправьте результат игроку (если нужно)
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§aРезультат: ${result}" } ] }`);
            } catch (error) {
                console.error("Ошибка в eval:", error); // Выведите ошибку в консоль
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cОшибка: ${error}" } ] }`);
            }
        }

        else if (command[0] == "!rm") { // Получить инфо о груди
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§fМузыка перезапущена. §eЕсли вы не её слышите, то убедитесь, что у вас громкость музыки не установлена в 0 (Меню -> Опции -> Звук -> Музыка)" } ] }`)
            player.setDynamicProperty("music_location_previous", -1)
        }

        else if (command[0] == "!") { // Инфо о командах
            player.setDynamicProperty('hasEverSeenArxCommandsHelp', true)
            queueCommand(player, `function javascript/arx_commands_help`);
        }

        else if (command[0] == "!setname") { // Установить имя
            const newName = command.slice(1).join(' ').trim()

            if (!newName) {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cНевозможно установить пустое имя." } ] }`)
            }
            else {
                if (newName.length < 30) {
                    queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§aИмя персонажа для локального чата изменено на §f${newName}§a." } ] }`)
                    player.setDynamicProperty("name", newName)
                }
                else {
                    queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cПожалуйста, введите более короткое имя." } ] }`)
                }
            }
        }

        else if (command[0] == "!sdp") {
            if (isAdmin(player)) {
                if (!command[1] || !command[2]) {
                    queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cФормат: §f!sdp §f<ключ> <значение> [игрок]" } ] }`);
                } else {
                    let targetPlayer = player;

                    // Поиск игрока, если указан
                    if (command[3]) {

                        const playerName = command.slice(3).join(' ').trim()

                        targetPlayer = world.getPlayers().find(p =>
                            p.name.toLowerCase() === playerName.toLowerCase()
                        );
                    }

                    if (!targetPlayer) {
                        queueCommand(player, `tellraw @s { "rawtext": [{ "text": "§cИгрок ${command[3]} не найден" }] }`);
                    } else {

                        // Определение типа значения
                        let value;
                        if (!isNaN(command[2])) {
                            value = parseFloat(command[2]); // Число
                        } else if (command[2].toLowerCase() === "true") {
                            value = true; // Булево true
                        } else if (command[2].toLowerCase() === "false") {
                            value = false; // Булево false
                        } else {
                            value = command[2]; // Строка
                        }

                        // Установка свойства
                        targetPlayer.setDynamicProperty(command[1], value);

                        queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§dDP§f ${command[1]} §dигрока §f${targetPlayer.name}§d изменено на §f${value}" } ] }`);
                    }
                }
            } else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cТребуются права администратора!" } ] }`);
            }
        }

        else if (command[0] == "!gdp") { // Get Dynamic Property
            if (isAdmin(player)) {
                if (!command[1]) { queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cИспользуйте формат §f!§cgdp §f<dynamicProperty>" } ] }`) }
                else {
                    queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§bDP§f §f<${command[1]}>§b имеет значение §f${player.getDynamicProperty(command[1])}" } ] }`)
                }
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cНевозможно использовать команду ${command[0]} без прав модератора." } ] }`)
            }
        }

        else if (command[0] == "!gp") { // Get Property
            if (isAdmin(player)) {
                if (!command[1]) { queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cИспользуйте формат §f!§cgdp §f<property>" } ] }`) }
                else {
                    queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§bDP§f §f<${command[1]}>§b имеет значение §f${player.getProperty(command[1])}" } ] }`)
                }
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cНевозможно использовать команду ${command[0]} без прав модератора." } ] }`)
            }
        }

        else if (command[0] == "!gbd") { // Get Block Data
            if (isAdmin(player)) {
                queueCommand(player, "tag @s add gbd_ready")
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§f§aКликните на блок§f, чтобы получить данные о его взаимдействиях на этом хосте." } ] }`)
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cНевозможно использовать команду ${command[0]} без прав модератора." } ] }`)
            }
        }

        else if (command[0] == "!verify") { // Верификация игрока
            if (isAdmin(player)) {
                if (!command[1]) { queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cИспользуйте формат §f!§cverify §f<игрок>" } ] }`) }
                else {
                    const playerNickName = command.slice(1).join(' ')

                    const targetPlayer = world.getPlayers().find(p =>
                        p.name.toLowerCase() === playerNickName.trim().toLowerCase()
                    )

                    if (!targetPlayer) {
                        queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cИгрок с ником §f${playerNickName}§c не найден" } ] }`)
                    } else {
                        if (targetPlayer.getDynamicProperty('verify') == true) { // Если уже верифицирован
                            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§eИгрок §f${playerNickName}§e уже верифицирован" } ] }`)
                        } else {
                            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§aВыдана верификация§f игроку §a${targetPlayer.name}" } ] }`)
                            queueCommand(targetPlayer, `tellraw @s { "rawtext": [ { "text": "§aВам выдана верификация!§f Вы можете приступать к созданию персонажа." } ] }`)
                            targetPlayer.setDynamicProperty('verify', true)
                        }
                    }
                }
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cНевозможно использовать команду ${command[0]} без прав модератора." } ] }`)
            }
        }

        else if (command[0] == "!myskills") { // Инфо о навыках
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": " " } ] }`)
            getSkillsData(player, "strength")
        }

        else if (command[0] == "!lore") { // История персонажа
            if (!command[1] || (command[1] !== 'add' && command[1] !== 'set') || !command[2]) {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cИспользуйте §d!§alore set <история>§c, чтобы написать историю персонажа с нуля, или §d!§alore add <дополнение истории>§c, чтобы добавить к существующей истории новый эпизод." } ] }`);
            } else if (command[1] === 'set') {
                player.setDynamicProperty('characterLore', command.slice(2).join(' ').trim());
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "История §aустановлена§f." } ] }`)
            } else if (command[1] === 'add') {
                if (player.getDynamicProperty('characterLore') === '' || player.getDynamicProperty('characterLore') === undefined) {
                    player.setDynamicProperty('characterLore', command.slice(2).join(' ').trim());
                } else {
                    player.setDynamicProperty('characterLore', player.getDynamicProperty('characterLore') + " " + command.slice(2).join(' ').trim());
                }
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "История §aдополнена§f." } ] }`)
            } else {
                console.warn(`Произошла непредвиденная ошибка у ${player.name} в обработке !lore в сообщении ${trimmedMessage}`);
            }
        }

        else if (command[0] == "!bug") { // Отчитаться о баге
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§aЗакройте чат и прыгните§f, чтобы составить отчёт об ошибке.\n§o§7(Не задавайте вопросов, так надо)" } ] }`);
            queueCommand(player, 'tag @s add bug')
        }

        else if (command[0] == "!idea") { // Предложить идею
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§aЗакройте чат и прыгните§f, чтобы написать идею или предложение.\n§o§7(Не задавайте вопросов, так надо)" } ] }`);
            queueCommand(player, 'tag @s add idea')
        }

        else if (command[0] == "!w" || command[0] == "!ш") { // Переключение шёпот-локал
            if (player.getDynamicProperty('respawnDelay') === 0) {
                if (player.getDynamicProperty("is_whispering") === false) {
                    queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Переключено на §6шёпот§f." } ] }`);
                    player.setDynamicProperty("is_whispering", true)
                }
                else {
                    queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Переключено на §aобычную речь§f." } ] }`);
                    player.setDynamicProperty("is_whispering", false)
                }
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cВы не можете настраивать свою речь, пока вы без сознания." } ] }`)
            }
        }

        else if (command[0] == "!global" || command[0] == "!г" || command[0] == "!g") {
            if (player.getDynamicProperty('respawnDelay') === 0) {
                if (!command[1]) {
                    queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cНельзя отправить пустое глобальное сообщение." } ] }`)
                }
                else {
                    let chatPrefix

                    for (const speechListener of world.getPlayers()) {

                        // Настраиваем префикс чата
                        if (speechListener.getDynamicProperty('myRule:chatPrefixes') == 'fullEN') { chatPrefix = 'Global' }
                        if (speechListener.getDynamicProperty('myRule:chatPrefixes') == 'shortEN') { chatPrefix = 'G' }

                        queueCommand(speechListener, `tellraw @s {"rawtext":[{"text": "[§c${chatPrefix}§f] <${player.name}> // ${trimmedMessage.slice(command[0].length + 1)}"}]}`);
                    }
                }
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cВы не можете использовать глобальный чат, пока вы без сознания." } ] }`)
            }
        }
        else if (command[0] == "!camset") {
            if (player.getDynamicProperty('respawnDelay') === 0) {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§aКамера установлена.\n§eИспользование камеры с любой целью, кроме эстетического улучшения ракурса, является тяжёлым нарушением правил Аркса по части РП." } ] }`)
                queueCommand(player, `tellraw @a[rm=0.01, r=10] { "rawtext": [ { "text": "[§dSYSTEM§f] > "}, {"selector": "@s"}, { "text": " установил(а) камеру поблизости." } ] }`)
                queueCommand(player, `tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "[§dSYSTEM§f] > "}, {"selector": "@s"}, { "text": " установил(а) камеру на ${Math.round(player.location.x)} ${Math.round(player.location.y)} ${Math.round(player.location.z)}." } ] }`)
                queueCommand(player, `camera @s set minecraft:free pos ~ ~1.7 ~ rot ~ ~`)
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cВы не можете управлять камерой, пока вы без сознания." } ] }`)
            }
        }
        else if (command[0] == "!camclr") {
            if (player.getDynamicProperty('respawnDelay') === 0) {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§aКамера сброшена." } ] }`)
                queueCommand(player, `tellraw @a[rm=0.01, r=10] { "rawtext": [ { "text": "[§dSYSTEM§f] > "}, {"selector": "@s"}, { "text": " сбросил(а) камеру поблизости." } ] }`)
                queueCommand(player, `tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "[§dSYSTEM§f] > "}, {"selector": "@s"}, { "text": " сбросил(а) камеру." } ] }`)
                queueCommand(player, `camera @s clear`)
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cВы не можете управлять камерой, пока вы без сознания." } ] }`)
            }
        }

        else if (trimmedMessage.startsWith("!!")) {
            if (player.getDynamicProperty('respawnDelay') === 0) {
                emote(player, trimmedMessage)
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cВы не можете использовать эмоции, пока вы без сознания." } ] }`)
            }
        }

        else {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cТакой команды Аркса не существует.\nВведите §f!§c, чтобы посмотреть доступные." } ] }`)
        }
    }
    else { // Сообщение - не команда Аркса. Обработать и отправить
        // Недопуск из-за нока
        if (player.getDynamicProperty('respawnDelay') > 0) {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cВы не можете разговаривать, пока вы без сознания." } ] }`)
        }
        // Недопуск из-за \ и "
        else if (trimmedMessage.includes("\\") || trimmedMessage.includes('"')) {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cИз-за технических особенностей невозможно отправить сообщение, содержащее двойную кавычку или обратный слеш." } ] }`)
        }
        // Недопуск из-за отсутствия регистрации
        else if (player.getDynamicProperty('hasRegisteredCharacter') !== true) {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Наверное, вы хотели написать в §cглобальный чат§f?\nДля этого отправьте §d!§aг <сообщение>" } ] }`)
        }
        // Недопуск из-за отсутствия локального ника
        else if (player.getDynamicProperty("name") === undefined) {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cУстановите имя персонажа, чтобы общаться в локальном чате. Это можно сделать командой §a!setname имя§c." } ] }`)
        }
        // Успешно
        else {
            sendChatMessage(player, trimmedMessage, "Local")
        }
    }
}

// Функция отправка сообщения в локальный чат
function sendChatMessage(player, trimmedMessage, type) {
    // Делаем речевую эмоцию, если это нужно
    if (!player.hasTag('is_emoting_via_arx_command')) {
        speechEmote(player, trimmedMessage)
    }

    // Определяем дистанцию для каждого игрока
    for (const speechListener of world.getPlayers()) {
        if (player.getDynamicProperty('respawnDelay') === 0) { // Если тот, кто получает сообщение не нокнут
            const distance = Math.sqrt(Math.pow(speechListener.location.x - player.location.x, 2) + Math.pow(speechListener.location.y - player.location.y, 2) + Math.pow(speechListener.location.z - player.location.z, 2))

            let chatPrefix

            if (player.getDynamicProperty("is_whispering") == false) { // Если мы говорим в полный голос
                let speech = spoilSpeechByDistance(trimmedMessage, distance, 8)

                // Настраиваем префикс чата
                if (speechListener.getDynamicProperty('myRule:chatPrefixes') == 'fullEN') { chatPrefix = 'Local' }
                if (speechListener.getDynamicProperty('myRule:chatPrefixes') == 'shortEN') { chatPrefix = 'L' }

                if (speech !== undefined) {
                    queueCommand(speechListener, `tellraw @s {"rawtext":[{"text": "[§a${chatPrefix}§f] <${player.getDynamicProperty("name")}§f> ${speech}"}]}`)
                }
            }
            else { // Если мы шепчем
                let speech = spoilSpeechByDistance(trimmedMessage, distance, 2)

                // Настраиваем префикс чата
                if (speechListener.getDynamicProperty('myRule:chatPrefixes') == 'fullEN') { chatPrefix = 'Whisper' }
                if (speechListener.getDynamicProperty('myRule:chatPrefixes') == 'shortEN') { chatPrefix = 'W' }

                if (speech !== undefined) {
                    queueCommand(speechListener, `tellraw @s {"rawtext":[{"text": "[§6${chatPrefix}§f] <${player.getDynamicProperty("name")}§f> ${speech}"}]}`)
                }
            }
        }
    }
}

function spoilSpeechByDistance(text, defactoDistance, allrightDistance) {
    // Приемлемое расстояние
    if (defactoDistance <= allrightDistance) {
        return text;
    }
    // Слишком большое расстояние
    else if (defactoDistance > allrightDistance * 2) {
        return undefined;
    }
    else { // Надо сшакалить качество

        const russianAlphabetLowercase = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"

        let result = ''
        const spoilFactor = (defactoDistance - allrightDistance) / allrightDistance; // Значение от 0 до 1

        for (let i = 0; i < text.length; i++) {
            let char = text[i]

            if (char !== ' ') {

                if (Math.random() < spoilFactor) { // Вероятность "испортить" символ
                    // Портим
                    if (Math.random() < 0.125) { char = '.' }
                    else if (Math.random() < 0.250) { char = '..' }
                    else if (Math.random() < 0.375) { char = '...' }
                    else if (Math.random() < 0.5) { char = '■' }
                    else {
                        const randomIndex = Math.floor(Math.random() * russianAlphabetLowercase.length)
                        char = russianAlphabetLowercase[randomIndex]
                    }
                }
            }

            result += char;
        }

        return result;
    }
}

function speechEmote(player, phrase) {
    phrase = phrase.toLowerCase();

    let phraseStats = {
        negativeMeaning: 0,
        positiveMeaning: 0,
        anger: 0,
        fear: 0,
        sadness: 0,
        excitement: 0,
        request: 0,
        informationSeeking: 0,
        threat: 0,
        greet: 0
    };

    const negativeWords = {
        'нет': { type: "word", weight: 70 },
        'плохо': { type: "word", weight: 80 },
        'ненавижу': { type: "word", weight: 100 },
        'откаж': { type: "partOfWord", weight: 85 },
        'отказыва': { type: "partOfWord", weight: 90 },
        'не хочу': { type: "word", weight: 75 },
        'не буду': { type: "word", weight: 75 },
        'хуйня': { type: "word", weight: 100 },
        'не пойд': { type: "partOfWord", weight: 80 },
        'прекрат': { type: "partOfWord", weight: 85 },
        'заеба': { type: "partOfWord", weight: 100 },
        'хуёво': { type: "word", weight: 100 },
        'отвратительн': { type: "partOfWord", weight: 95 },
        'не могу': { type: "word", weight: 60 },
        'не надо': { type: "word", weight: 60 },
        'неудачн': { type: "partOfWord", weight: 80 },
        'не повезло': { type: "word", weight: 75 },
        'не везёт': { type: "word", weight: 75 },
        'зря': { type: "word", weight: 65 },
        'класс': { type: "word", weight: 10 },
        'бесполез': { type: "partOfWord", weight: 90 },
        'не-а': { type: "word", weight: 100 }
    };

    const positiveWords = {
        'ага': { type: "word", weight: 60 },
        'хорош': { type: "partOfWord", weight: 85 },
        'отличн': { type: "partOfWord", weight: 95 },
        'любл': { type: "partOfWord", weight: 90 },
        'люби': { type: "partOfWord", weight: 95 },
        'прекрасн': { type: "partOfWord", weight: 90 },
        'здорово': { type: "word", weight: 85 },
        'соглас': { type: "partOfWord", weight: 75 },
        'лучш': { type: "partOfWord", weight: 90 },
        'заебись': { type: "word", weight: 100 },
        'заебок': { type: "word", weight: 80 },
        'пиздато': { type: "word", weight: 100 },
        'восхитительн': { type: "partOfWord", weight: 95 },
        'удовольств': { type: "partOfWord", weight: 90 },
        'спасибо': { type: "word", weight: 85 },
        'благодарю': { type: "word", weight: 80 },
        'ценю': { type: "word", weight: 80 },
        'красиво': { type: "part", weight: 85 },
        'рад': { type: "word", weight: 90 },
        'окей': { type: "word", weight: 60 }
    };

    const angerWords = {
        'зло': { type: "partOfWord", weight: 85 },
        'беси': { type: "partOfWord", weight: 95 },
        'ненави': { type: "partOfWord", weight: 100 },
        'достало': { type: "word", weight: 90 },
        'чёрт': { type: "word", weight: 80 },
        'гад': { type: "word", weight: 75 },
        'блядь': { type: "word", weight: 60 },
        'блять': { type: "word", weight: 60 },
        'сука': { type: "word", weight: 100 },
        'суки': { type: "word", weight: 100 },
        'сучара': { type: "word", weight: 100 },
        'гнид': { type: "word", weight: 90 },
        'уёб': { type: "partOfWord", weight: 80 },
        'уеб': { type: "partOfWord", weight: 80 },
        'пидор': { type: "word", weight: 100 },
        'завали ебальник': { type: "word", weight: 100 },
        'идиот': { type: "word", weight: 95 },
        'дебил': { type: "word", weight: 95 },
        'даун': { type: "word", weight: 90 },
        'долбаёб': { type: "word", weight: 100 }
    };

    const fearWords = {
        'страшн': { type: "partOfWord", weight: 85 },
        'боюсь': { type: "word", weight: 90 },
        'тревож': { type: "partOfWord", weight: 80 },
        'опаса': { type: "partOfWord", weight: 75 },
        'жуть': { type: "word", weight: 95 },
        'ужас': { type: "word", weight: 100 },
        'потеря': { type: "word", weight: 40 },
        'проеба': { type: "partOfWord", weight: 90 },
        'темно': { type: "word", weight: 30 }
    };

    const sadnessWords = {
        'груст': { type: "partOfWord", weight: 85 },
        'печаль': { type: "word", weight: 80 },
        'тоскливо': { type: "word", weight: 75 },
        'одиноко': { type: "word", weight: 90 },
        'тяжело': { type: "word", weight: 70 },
        'опять эти': { type: "word", weight: 75 },
        'да сука': { type: "word", weight: 90 }
    };

    const excitementWords = {
        'ура': { type: "word", weight: 100 },
        'отлично': { type: "word", weight: 95 },
        'супер': { type: "word", weight: 90 },
        'круто': { type: "word", weight: 85 },
        'потрясающ': { type: "partOfWord", weight: 95 },
        'восторг': { type: "word", weight: 90 },
        'вау': { type: "word", weight: 95 },
        'идеальн': { type: "partOfWord", weight: 85 }
    };

    const requestWords = {
        'пожалуйста': { type: "word", weight: 75 },
        'могу ли я': { type: "word", weight: 70 },
        'не могли бы вы': { type: "word", weight: 65 },
        'прошу': { type: "word", weight: 80 },
        'умоляю': { type: "word", weight: 85 },
        'можно': { type: "word", weight: 60 },
        'не мог бы': { type: "word", weight: 70 },
        'не могла бы': { type: "word", weight: 70 },
        'мне нужна помощь': { type: "word", weight: 90 }
    };

    const questionWords = {
        'кто': { type: "word", weight: 70 },
        'где': { type: "word", weight: 70 },
        'когда': { type: "word", weight: 70 },
        'почему': { type: "word", weight: 75 },
        'как': { type: "word", weight: 65 },
        'сколько': { type: "word", weight: 65 },
        '?': { type: "word", weight: 80 },
        'дума': { type: "partOfWord", weight: 60 }
    };

    const threatWords = {
        'убью': { type: "word", weight: 100 },
        'убить': { type: "word", weight: 100 },
        'конец тебе': { type: "word", weight: 95 },
        'тебе конец': { type: "word", weight: 95 },
        'прощайся с жизнью': { type: "word", weight: 90 },
        'зареж': { type: "partOfWord", weight: 100 },
        'предупрежда': { type: "partOfWord", weight: 85 },
        'умри': { type: "word", weight: 100 },
        'пожалеешь': { type: "word", weight: 80 },
        'убирайся': { type: "word", weight: 75 },
        'иди нахуй': { type: "word", weight: 100 },
        'отвали': { type: "word", weight: 85 },
        'заткнись': { type: "word", weight: 90 },
        'дуэль': { type: "word", weight: 85 }
    };

    const greetWords = {
        'привет': { type: "word", weight: 80 },
        'здравствуй': { type: "word", weight: 75 },
        'добрый день': { type: "word", weight: 70 },
        'доброе утро': { type: "word", weight: 70 },
        'доброй ночи': { type: "word", weight: 70 },
        'добро пожаловать': { type: "word", weight: 75 },
        'пока': { type: "word", weight: 65 },
        'прощай': { type: "word", weight: 60 },
        'до свидания': { type: "word", weight: 70 },
        'досвидания': { type: "word", weight: 70 },
        'до встречи': { type: "word", weight: 65 },
        'увидимся': { type: "word", weight: 65 }
    };

    // Функция для подсчета взвешенных совпадений слов
    function countWordMatches(phrase, wordList) {
        let totalWeight = 0;
        phrase = phrase.toLowerCase(); // Приводим фразу к нижнему регистру для регистронезависимого поиска
        for (const word in wordList) {
            if (wordList.hasOwnProperty(word)) { // Проверяем, является ли свойство собственным свойством объекта
                const wordObject = wordList[word];

                // Если слово встречается целиком
                if (wordObject.type === "word") {
                    if (phrase.includes(word.toLowerCase())) { // Сравниваем с нижним регистром
                        totalWeight += wordObject.weight;
                    }
                    // Если нам нужно искать часть слова в тексте
                } else if (wordObject.type === "partOfWord") {
                    if (phrase.includes(word.toLowerCase())) {
                        totalWeight += wordObject.weight;
                    }
                }
            }
        }
        return totalWeight;
    }

    // Функция для поиска ключа с макс. значением
    function processPhraseStats(obj) {

        let statsSum = 0;
        for (const key in obj) {
            statsSum += obj[key]
        }
        if (statsSum === 0) {
            return ('noStats')
        }

        const [maxKey, maxValue] = Object.entries(obj).reduce((acc, [key, value]) => {
            return value > acc[1] ? [key, value] : acc;
        }, [Object.keys(obj)[0], obj[Object.keys(obj)[0]]]);

        return maxKey;
    }

    phraseStats.negativeMeaning = countWordMatches(phrase, negativeWords);
    phraseStats.positiveMeaning = countWordMatches(phrase, positiveWords);
    phraseStats.anger = countWordMatches(phrase, angerWords);
    phraseStats.fear = countWordMatches(phrase, fearWords);
    phraseStats.sadness = countWordMatches(phrase, sadnessWords);
    phraseStats.excitement = countWordMatches(phrase, excitementWords);
    phraseStats.request = countWordMatches(phrase, requestWords);
    phraseStats.informationSeeking = countWordMatches(phrase, questionWords);
    phraseStats.threat = countWordMatches(phrase, threatWords);
    phraseStats.greet = countWordMatches(phrase, greetWords);

    // Пример: вывод статистики в консоль
    // console.warn('Phrase Stats:', JSON.stringify(phraseStats), "Высшее значение:", processPhraseStats(phraseStats));

    // Дальнейшая обработка phraseStats для выбора эмоции и воспроизведения её
    switch (processPhraseStats(phraseStats)) {
        case 'negativeMeaning':
            queueCommand(player, "playanimation @s animation.player.speechemote.negativemeaning")
            break
        case 'positiveMeaning':
            queueCommand(player, "playanimation @s animation.player.speechemote.positivemeaning")
            break
        case 'anger':
            queueCommand(player, "playanimation @s animation.player.speechemote.anger")
            break
        case 'fear':
            queueCommand(player, "playanimation @s animation.player.speechemote.fear")
            break
        case 'sadness':
            queueCommand(player, "playanimation @s animation.player.speechemote.sadness")
            break
        case 'excitement':
            queueCommand(player, "playanimation @s animation.player.speechemote.excitement")
            break
        case 'request':
            queueCommand(player, "playanimation @s animation.player.speechemote.request")
            break
        case 'informationSeeking':
            queueCommand(player, "playanimation @s animation.player.speechemote.informationseeking")
            break
        case 'threat':
            queueCommand(player, "playanimation @s animation.player.speechemote.threat")
            break
        case 'greet':
            queueCommand(player, "playanimation @s animation.player.speechemote.greet")
            break

        case 'noStats':
            queueCommand(player, "playanimation @s animation.player.speechemote.nostats")
            break
    }

    return phraseStats; // Возвращаем статистику для дальнейшего использования
}

function isAdmin(player) {
    return getScore(player, "verify") == 2 ? true : false
}