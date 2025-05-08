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

        else if (command[0] == "!get_bust_size") { // Получить инфо о груди
            queueCommand(player, `w @s Размер груди: ${player.getProperty("arx:bust_size")}`);
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
                        targetPlayer = world.getPlayers().find(p =>
                            p.name.toLowerCase() === command[3].toLowerCase()
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

        else if (command[0] == "!w" || command[0] == "!ш") { // Переключение шёпот-локал
            if (getScore(player, "respawn_delay") == 0) {
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
            if (getScore(player, "respawn_delay") == 0) {
                if (!command[1]) {
                    queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cНельзя отправить пустое глобальное сообщение." } ] }`)
                }
                else {
                    queueCommand(player, `tellraw @a {"rawtext":[{"text": "[§cGlobal§f] <"}, {"selector": "@s"}, {"text": "> // ${trimmedMessage.slice(command[0].length + 1)}"}]}`);
                }
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cВы не можете использовать глобальный чат, пока вы без сознания." } ] }`)
            }
        }
        else if (command[0] == "!camset") {
            if (getScore(player, "respawn_delay") == 0) {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§aКамера установлена.\n§eИспользование камеры с любой целью, кроме эстетического улучшения ракурса, является тяжёлым нарушением правил Аркса по части РП." } ] }`)
                queueCommand(player, `tellraw @a[rm=0.01, r=10] { "rawtext": [ { "text": "§d[SYSTEM]§f "}, {"selector": "@s"}, { "text": " установил(а) камеру поблизости." } ] }`)
                queueCommand(player, `tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "§d[SYSTEM]§f "}, {"selector": "@s"}, { "text": " установил(а) камеру на ${Math.round(player.location.x)} ${Math.round(player.location.y)} ${Math.round(player.location.z)}." } ] }`)
                queueCommand(player, `camera @s set minecraft:free pos ~ ~1.7 ~ rot ~ ~`)
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cВы не можете управлять камерой, пока вы без сознания." } ] }`)
            }
        }
        else if (command[0] == "!camclr") {
            if (getScore(player, "respawn_delay") == 0) {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§aКамера сброшена." } ] }`)
                queueCommand(player, `tellraw @a[rm=0.01, r=10] { "rawtext": [ { "text": "§d[SYSTEM]§f "}, {"selector": "@s"}, { "text": " сбросил(а) камеру поблизости." } ] }`)
                queueCommand(player, `tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "§d[SYSTEM]§f "}, {"selector": "@s"}, { "text": " сбросил(а) камеру." } ] }`)
                queueCommand(player, `camera @s clear`)
            }
            else {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cВы не можете управлять камерой, пока вы без сознания." } ] }`)
            }
        }

        else if (trimmedMessage.startsWith("!!")) {
            if (getScore(player, "respawn_delay") == 0) {
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
        // Недопуск 1
        if (getScore(player, "respawn_delay") > 0) {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cВы не можете разговаривать, пока вы без сознания." } ] }`)
        }
        // Недопуск 2
        else if (player.getDynamicProperty("name") == undefined) {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cУстановите имя персонажа, чтобы общаться в локальном чате. Это можно сделать командой §a!setname имя§c." } ] }`)
        }
        // Успешно
        else {
            speechEmote(player, trimmedMessage)

            // Определяем дистанцию для каждого игрока
            for (const speechListener of world.getPlayers()) {
                if (getScore(speechListener, 'respawn_delay') === 0) { // Если тот, кто получает сообщение не нокнут
                    const distance = Math.sqrt(Math.pow(speechListener.location.x - player.location.x, 2) + Math.pow(speechListener.location.y - player.location.y, 2) + Math.pow(speechListener.location.z - player.location.z, 2))

                    if (player.getDynamicProperty("is_whispering") == false) { // Если мы говорим в полный голос
                        let speech = spoilSpeechByDistance(trimmedMessage, distance, 8)
                        if (speech !== undefined) {
                            queueCommand(speechListener, `tellraw @s {"rawtext":[{"text": "[§aLocal§f] <${player.getDynamicProperty("name")}§f> ${speech}"}]}`)
                        }
                    }
                    else { // Если мы шепчем
                        let speech = spoilSpeechByDistance(trimmedMessage, distance, 2)
                        if (speech !== undefined) {
                            queueCommand(speechListener, `tellraw @s {"rawtext":[{"text": "[§6Whisper§f] <${player.getDynamicProperty("name")}§f> ${speech}"}]}`)
                        }
                    }
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

    const negativeWords = ['нет', 'плохо', 'ненавижу', 'откаж', 'отказыва', 'не хочу', 'не буду', 'хуйня', 'не пойд', 'прекрат', 'заеба', 'хуёво', 'отвратительн', 'не могу', 'не надо', 'неудачн', 'не повезло', 'не везёт', 'зря', 'класс', 'бесполез']
    const positiveWords = ['ага', 'хорош', 'отличн', 'любл', 'люби', 'прекрас', 'здорово', 'соглас', 'лучш', 'заебись', 'заебок', 'пиздато', 'восхитительн', 'удовольств', 'спасибо', 'благодарю', 'ценю', 'красив', 'рад', 'окей']
    const angerWords = ['зло', 'беси', 'ненави', 'достало', 'чёрт', 'гад', 'блядь', 'блять', 'сук', 'гнид', 'уёб', 'уеб', 'пидор', 'завали ебальник', 'идиот', 'дебил', 'даун', 'долбаёб', 'долбаеб']
    const fearWords = ['страшн', 'боюсь', 'тревож', 'опаса', 'жуть', 'ужас', 'потеря', 'проеба', 'темно']
    const sadnessWords = ['груст', 'печаль', 'тоскливо', 'одиноко', 'тяжело', 'опять эти', 'да сука']
    const excitementWords = ['ура', 'отлично', 'супер', 'круто', 'потрясающ', 'восторг', 'вау', 'идеальн']
    const requestWords = ['пожалуйста', 'могу ли я', 'не могли бы вы', 'прошу', 'умоляю', 'можно', 'не мог бы', 'не могла бы', 'мне нужна помощь']
    const questionWords = ['кто', 'где', 'когда', 'почему', 'как', 'сколько', '?', "дума"]
    const threatWords = ['убью', 'убить', 'конец тебе', 'тебе конец', 'прощайся с жизнью', 'зареж', 'предупрежда', 'умри', 'пожалеешь', 'убирайся', 'иди нахуй', 'отвали', 'заткнись', 'дуэль']
    const greetWords = ['привет', 'здравствуй', 'добрый день', 'доброе утро', 'доброй ночи', 'добро пожаловать', 'пока', 'прощай', 'до свидания', 'досвидания', 'до встречи', 'увидимся']

    // Функция для подсчета совпадений слов
    function countWordMatches(phrase, wordList) {
        let count = 0;
        wordList.forEach(word => {
            if (phrase.includes(word)) {
                count++;
            }
        });
        return count;
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