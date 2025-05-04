// Imports
import { world } from "@minecraft/server"
import { emote } from './emote'
import { getScore } from './scoresOperations'
import { getSkillsData } from './skillsOperations'
import { queueCommand } from './commandQueue'
import { increaseSkillProgress } from "./skillsOperations"

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

        if (command[0] == "!get_cd") { // Получить инфо о кд
            queueCommand(player, `w @s Кд: ${player.getProperty("arx:cd") / 20} сек.`);
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
                    queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§aИмя персонажа изменено на §f${newName}§a." } ] }`)
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

                        queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§dDP§f ${command[1]} игрока §f${targetPlayer.name}§d изменено на §f${value}" } ] }`);
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


        else if (command[0] == "!skillsdata") {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "" } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cСила §7" } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§6Выносливость §f" } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§6Выносливость §7." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§2Бег §f." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§2Бег §7." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§aСтрельба §f." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§aСтрельба §7." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§bМана §f" } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§bМана §7." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§dМагическая мощь §f" } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§dМагическая мощь §7." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§eСтойкость §f" } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§eСтойкость §7." } ] }`)
        }

        else if (command[0] == "!mytastes") {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§fМясное ${player.getDynamicProperty("playerTaste_meat")}." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§fРыбное ${player.getDynamicProperty("playerTaste_fish")}." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§fХлебное ${player.getDynamicProperty("playerTaste_bread")}." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§fМолочное ${player.getDynamicProperty("playerTaste_dairy")}." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§fРастительное ${player.getDynamicProperty("playerTaste_herbal")}." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§fСладкое ${player.getDynamicProperty("playerTaste_sweet")}." } ] }`)
        }

        else if (command[0] == "!mystats") {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": " " } ] }`)

            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Мана: ${player.getDynamicProperty("mp")}." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Мана макс: ${player.getDynamicProperty("maxMp")}." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Мана реген: ${player.getDynamicProperty("mpRegenPower")}." } ] }`)

            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Прыжок: ${player.getDynamicProperty("jumpPower")}." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Бонус Скорости: ${player.getDynamicProperty("speedPower")}." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Бонус силы: ${player.getDynamicProperty("basicStrength")}." } ] }`)

            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Лимит веса: ${player.getDynamicProperty("weighLimit")}." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Загруженность: ${player.getDynamicProperty("weighLoading")}." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Перегруз: ${player.getDynamicProperty("overLoading")}." } ] }`)

            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Множ. XP: ${player.getDynamicProperty("xpMultiplier")}." } ] }`)

            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Снятие отравл: ${player.getDynamicProperty("intoxicationDecreasePower")}." } ] }`)
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Ур отравл: ${player.getDynamicProperty("intoxicationLevel")}." } ] }`)

            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Стрельба: ${player.getProperty("arx:ranged_attack_accuracy")}." } ] }`)
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

        else if (command[0] == "!myrule") {
            const rules = {
                showAttackCDMode: {
                    args: ["ticks", "seconds", "line", "none"],
                    ruleName: "myRule:showAttackCDMode",
                    description: "Формат отображения КД атак"
                },
                manaDisplayMode: {
                    args: ["integers", "decimals", "none"],
                    ruleName: "myRule:manaDisplayMode",
                    description: "Формат отображения маны"
                }
            };

            const ruleName = command[1]
            const rule = rules[ruleName]
            const arg = command[2] // добавляем переменную, и используем оператор безопасной навигации, чтобы скрипт не крашился

            // Используем ли мы !myrule help?
            if (!command[1]) {
                const ruleList = Object.keys(rules)
                    .join("§f, §a");
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Доступные правила: §a${ruleList}§f." } ] }`);
            }
            // Если мы указали что-то в виде правила, но оно не является правилом
            else if (!rule) {
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cПравила §f<${command[1]}>§c не существует. Используйте §f<!myrule help>§c, чтобы посмотреть доступные." } ] }`);
            }
            // Нет аргумента
            else if (!command[2]) {
                const argsList = rule.args.join("§c, §f");
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cОжидается аргумент после §f<${command[1]}>§c. Допустимые аргументы: §f${argsList}§c." } ] }`);
            }
            // Недопустимый аргумет
            else if (!rule.args.includes(arg)) {
                const argsList = rule.args.join("§c, §f");
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cНедопустимый аргумент §f<${command[2]}>§c. Допустимые: §f${argsList}§c." } ] }`);
            }
            // Всё хорошо
            else {
                player.setDynamicProperty(rule.ruleName, arg);
                queueCommand(player, `tellraw @s { "rawtext": [ { "text": "Правило §a<${ruleName}>§f изменено на §a<${arg}>§f." } ] }`);
            }
        }

        else {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cТакой команды Аркса не существует.\nВведите §f!§c, чтобы посмотреть доступные." } ] }`)
        }
    }
    else { // Сообщение - не команда Аркса. Обработать и отправить
        if (getScore(player, "respawn_delay") > 0) {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cВы не можете разговаривать, пока вы без сознания." } ] }`)
        }
        else if (player.getDynamicProperty("name") == undefined) {
            queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cУстановите имя персонажа, чтобы общаться в локальном чате. Это можно сделать командой §a!setname имя§c." } ] }`)
        }
        else {
            if (player.getDynamicProperty("is_whispering") == false) { // Если мы говорим в полный голос
                queueCommand(player, `tellraw @a[r=10, scores={respawn_delay=0}] {"rawtext":[{"text": "[§aLocal§f] <${player.getDynamicProperty("name")}§f> ${trimmedMessage}"}]}`)
            }
            else { // Если мы шепчем
                queueCommand(player, `tellraw @a[r=4, scores={respawn_delay=0}] {"rawtext":[{"text": "[§6Whisper§f] <${player.getDynamicProperty("name")}§f> ${trimmedMessage}"}]}`)
            }
        }
    }
}


function isAdmin(player) {
    return getScore(player, "verify") == 2 ? true : false
}