// dialogues.js
import { ActionFormData } from "@minecraft/server-ui";
import { Player } from "@minecraft/server";
import { clearTraits } from './traits/traitsOperations'

// --- Импортируйте или определите здесь любые внешние функции, которые хотите использовать в диалогах ---
// Например:
// import { healPlayer, giveQuestItem } from "./playerActions.js";
// import { startQuest } from "./questSystem.js";

/**
 * Карта пользовательских функций, доступных для вызова из диалогов.
 * Это позволяет безопасно ссылаться на конкретные функции по имени.
 * @type {Map<string, Function>}
 */
const customFunctions = new Map();

// --- Регистрируйте внешние функции здесь ---
customFunctions.set("clearTraits", clearTraits);
// customFunctions.set("giveQuestItem", giveQuestItem);

/**
 * @typedef {Object} DialogNode
 * @property {string} id
 * @property {string} title
 * @property {string} body
 * @property {Array<{text: string, next?: string, action?: string | Array<string>, condition?: string}>} buttons
 */

/**
 * @typedef {Record<string, DialogNode>} DialogTree
 */

/**
 * Объект с несколькими диалогами
 * @type {Record<string, DialogTree>}
 */
const dialogs = {
    asi: {
        start: {
            id: "start",
            title: "Аси",
            body: "Привет, путник. Рада, что сюда кто-то заглянул.",
            buttons: [
                { text: 'Кто ты?', next: "about_asi" },
                { text: 'Что это за место?', next: "about_vicious_gardens" },
                { text: 'Что это за портал рядом?', next: "about_portal" },
                { text: 'Что это за огромная статуя?', next: "about_statue" },
                { text: 'Не против, если я порыбачу тут?', next: "about_fishing" },
                {
                    text: 'Пожалуйста, вылечи мои раны',
                    action: [
                        'player.runCommand("effect @s regeneration 10 2 true")',
                        'player.sendMessage("§aТы чувствуешь, как твои раны заживают!")'
                    ]
                },
                { text: 'Пожалуйста, очисти мои черты характера', next: "about_clearing_traits" },
                { text: 'Пока' }
            ]
        },
        // ... остальные узлы asi
        about_clearing_traits: {
            id: "about_clearing_traits",
            title: "Аси",
            body: "Интересная просьба... Хорошо, я сделаю это, однако я не смогу очистить тебя от черт, которые уже стали неотъемлемой частью твоего характера.",
            buttons: [
                {
                    text: 'Да, сделай это', action: [
                        'FUNCTION:clearTraits',
                        'player.sendMessage("§aВы чувствуете некоторое облегчение.")'
                    ]
                },
                { text: 'Не стоит', next: "start" }
            ]
        },
        about_fishing: {
            id: "about_fishing",
            title: "Аси",
            body: "Да, конечно рыбачь. Здесь водится много разной рыбы.",
            buttons: [
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_asi: {
            id: "about_asi",
            title: "Аси",
            body: "Я — Аси, дриада, и живу в этих глубинах уже много веков. Это цветущее место — моя обитель, и я забочусь о ней, чтобы Порочному Демону было спокойнее.",
            buttons: [
                { text: 'Кто такой порочный демон?', next: "about_vicious_demon" },
                { text: 'Кто такие дриады?', next: "about_driads" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_vicious_gardens: {
            id: "about_vicious_gardens",
            title: "Аси",
            body: "Хех, это Порочные сады, одно из самых безопасных и спокойных мест в мире. Вдохни поглубже и расслабься. Чувствуешь этот лёгкий приятный запах?",
            buttons: [
                { text: 'Что это за запах?', next: "about_fragrance_in_vicious_gardens" },
                { text: 'Как появились эти сады?', next: "about_vicious_gardens_history" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_vicious_gardens_history: {
            id: "about_vicious_gardens_history",
            title: "Аси",
            body: "Я не знаю, я ещё не существовала в это время. Думаю, когда-то это место было обычной пещерой.",
            buttons: [
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_fragrance_in_vicious_gardens: {
            id: "about_fragrance_in_vicious_gardens",
            title: "Аси",
            body: "Это здешние цветы и прохлада. Правда приятно?",
            buttons: [
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_portal: {
            id: "about_portal",
            title: "Аси",
            body: "Ого, тебя заинтересовала моя разработка? (смущается) На самом деле она не совсем моя. Я узнала, как сотворить такой портал, и создала его, чтобы путникам вроде вас было проще выбираться из порочных садов. Не стесняйся, это безопасный выход на поверхность (улыбается).",
            buttons: [
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_statue: {
            id: "about_statue",
            title: "Аси",
            body: "Это статуя порочного демона. Именно ему я помогаю (улыбается). Если у тебя достаточно силы, то можешь с ним сразиться. Ты его не покалечишь, да и тебя он не поранит сильно. Если что вдруг, приходи, я вылечу твои раны.",
            buttons: [
                { text: 'Кто такой порочный демон?', next: "about_vicious_demon" },
                { text: 'Как мне с ним сразиться?', next: "how_to_fight_with_vicious_demon" },
                { text: 'Почему у него светятся глаза?', next: "lighting_eyes_of_vicious_demon" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        lighting_eyes_of_vicious_demon: {
            id: "lighting_eyes_of_vicious_demon",
            title: "Аси",
            body: "Между его глазами и мной установлена связь. Мне почти ничего не стоит поддерживать их свечение. Считай, что это магическое украшение.",
            buttons: [
                { text: 'Ещё вопрос о статуе...', next: "about_statue" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        how_to_fight_with_vicious_demon: {
            id: "how_to_fight_with_vicious_demon",
            title: "Аси",
            body: "На другой стороне садов есть комната, в ней ты найдешь зеленый меч. Дотронься до него, и ты сможешь сразиться.",
            buttons: [
                { text: 'Ещё вопрос о статуе...', next: "about_statue" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_vicious_demon: {
            id: "about_vicious_demon",
            title: "Аси",
            body: "Порочный демон... Это немного сложно объяснить. Это божество, стерегущее покой самой Хранительницы Синриады.",
            buttons: [
                { text: 'Это божество в порядке?', next: "how_vicious_demon_feels" },
                { text: 'Кто такая Синриада?', next: "who_is_sinriada" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        who_is_sinriada: {
            id: "who_is_sinriada",
            title: "Аси",
            body: "Ты не знаешь Синриаду? Это одна из чертырёх хранителей. Среди них - Контата, Динаронос, Сандио, и, собственно, Синриада. Они являются костяком этого мира, и в особенности рунной магии.",
            buttons: [
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        how_vicious_demon_feels: {
            id: "how_vicious_demon_feels",
            title: "Аси",
            body: "Он в полном порядке. Он просто... нуждается в сохранности. Он слишком важен, чтобы подвергать его существенному риску.",
            buttons: [
                { text: 'Если он нуждается в сохранности, ты не боишься, что я его поврежу в сражении?', next: "about_harming_vicious_demon_in_battle" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_harming_vicious_demon_in_battle: {
            id: "about_harming_vicious_demon_in_battle",
            title: "Аси",
            body: "Нет, нет, что ты. Он знает, что делает. Ты его не повредишь.",
            buttons: [
                { text: 'Зачем он вообще сражается?', next: "why_demon_fights" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        why_demon_fights: {
            id: "why_demon_fights",
            title: "Аси",
            body: "По двум причинам - во первых, ему скучно всё время сидеть в своём мире. Во-вторых, так он может безопасно для себя получить боевой опыт. И безопасно для вас, кстати. Он никогда вас не добьёт. Я не просто так служу Порочному Демону, а потому что знаю, что он добрый и честный.",
            buttons: [
                { text: 'Ты ему служишь добровольно?', next: "does_asi_serves_voluntarily" },
                { text: 'В чем заключается твоя служба демону?', next: "what_does_asi_for_demon" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        does_asi_serves_voluntarily: {
            id: "does_asi_serves_voluntarily",
            title: "Аси",
            body: "Конечно! Я никогда не стала бы служить какому-то богу, который бы кромсал всех налево и направо. Порочный демон - лучший из богов.",
            buttons: [
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        what_does_asi_for_demon: {
            id: "what_does_asi_for_demon",
            title: "Аси",
            body: "Ты хочешь простой и понятный ответ, или сложный, но более точный?",
            buttons: [
                { text: 'Давай попроще', next: "simple_response" },
                { text: 'Давай более точный вариант', next: "complex_response" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        simple_response: {
            id: "simple_response",
            title: "Аси",
            body: "Я увеличиваю силы порочного демона, чтобы он мог лучше защищать Синриаду.",
            buttons: [
                { text: 'Ещё вопрос о порочном демоне...', next: "about_vicious_demon" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        complex_response: {
            id: "complex_response",
            title: "Аси",
            body: "(Задумывается) Ну смотри, я направляю поток люменессии через большую конструкцию посередине этой комнаты. Это портал в мир порочного демона. Сейчас он частично отключен, и ни ты, ни я пройти через него не можем, но вот неосязаемая люменессия - вполне. Ты не сможешь ей управлять, но ведь я дриада, и моя сущность сильнее. В каком-то плане, я даже немного бог (слегка краснеет и улыбается).",
            buttons: [
                { text: 'Что такое люменессия?', next: "about_lumenessia" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_lumenessia: {
            id: "about_lumenessia",
            title: "Аси",
            body: "Это сложная тема. Люменессия - это то, что делает нас с тобой живыми. Люменессия вокруг везде - просто в тебе её сильно больше, а во мне ещё больше, в этом и суть дриад. Если люменессии слишком много, то появится божество. В призраках её гораздо меньше чем в людях, и из них она со временем выветривается. У нее есть ее тёмный брат-близнец - ноксенессия.",
            buttons: [
                { text: 'Перья бога как-то относятся к люменессии?', next: "about_god_feathers" },
                { text: 'Расскажи о ноксенессии', next: "about_noxenessia" },
                { text: 'Ты используешь люменессию для этого необычного желтого портала?', next: "about_lumenession_portal" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_god_feathers: {
            id: "about_god_feathers",
            title: "Аси",
            body: "Да, перья бога - это концентрированная люменессия. Именно поэтому вещи, содержащие перо, гораздо мощнее. Знаешь, есть легенда о боге Скатарре? По легенде, он представал в форме божественной золотой птицы среди богов в мире без людей. Однажды, он решил пожертвовать собой и разнести по всему миру огромное количество люменессии, чтобы появились разные разумные формы жизни. Всё что от него осталось, это множество перьев... Перьев бога. Но я не думаю, что это правда, звучит слишком странно.",
            buttons: [
                { text: 'Ещё вопрос о люменессии...', next: "about_lumenessia" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_noxenessia: {
            id: "about_noxenessia",
            title: "Аси",
            body: "Ноксенессия - это то, с помощью чего работает любая магия. У меня есть теория, что раньше люменессия и ноксенессия были чем-то единым, но потом произошло что-то очень значимое, и они разделились на две силы.",
            buttons: [
                { text: 'Ещё вопрос о люменессии...', next: "about_lumenessia" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_lumenession_portal: {
            id: "about_lumenession_portal",
            title: "Аси",
            body: "Ага, это верно. Это люменессионный портал. Они гораздо реже, потому что их работу надо постоянно поддерживать.",
            buttons: [
                { text: 'Ещё вопрос о люменессии...', next: "about_lumenessia" },
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        },
        about_driads: {
            id: "about_driads",
            title: "Аси",
            body: "Мы, дриады, на вид слабо отличаемся от людей. На самом деле, мы - совершенно другие, очень редкие формы жизни. Знаешь, как я поняла, дриады встречаются ещё реже богов. Каждый бог хочет иметь свою дриаду, потому что с ней его способности гораздо лучше.",
            buttons: [
                { text: 'Давай поговорим о чём-то другом...', next: "start" }
            ]
        }
    },


    sample: {
        start: {
            id: "start",
            title: "Газгольдер",
            body: "Кхе.. Привет. Чего тебе?",
            buttons: [
                { text: "Что это за место", next: "about_bar" },
                { text: "Что ты продаешь?", next: "about_trade" },
                { text: "Покажи товары", next: "shop" },
                { text: "Продай пилу", next: "give_me_saw" },
                { text: "Покажи товары", next: "shop" },
            ]
        },
        about: {
            id: "about",
            title: "Торговец - О себе",
            body: "Я путешествую по миру уже много лет, собирая редкие товары...",
            buttons: [
                { text: "Назад", next: "start" }
            ]
        }
    },


    sample: {
        start: {
            id: "start",
            title: "Торговец",
            body: "Здравствуй, путник! Что привело тебя ко мне?",
            buttons: [
                { text: "Расскажи о себе", next: "about" },
                { text: "Покажи товары", next: "shop" },
                {
                    text: "Особые товары",
                    next: "special_shop",
                    condition: "player.hasTag('vip')"
                },
                { text: "Уйти", action: "player.sendMessage('§aВы попрощались с торговцем.');" }
            ]
        },
        about: {
            id: "about",
            title: "Торговец - О себе",
            body: "Я путешествую по миру уже много лет, собирая редкие товары...",
            buttons: [
                { text: "Назад", next: "start" }
            ]
        },
        shop: {
            id: "shop",
            title: "Торговец - Магазин",
            body: "Вот что у меня есть сегодня:",
            buttons: [
                {
                    text: "Зелья здоровья",
                    action: "player.sendMessage('§eВы купили зелье здоровья!'); player.addTag('has_potion');"
                },
                {
                    text: "Алмазы",
                    action: "player.sendMessage('§bВы купили алмазы!'); /* Здесь можно добавить логику покупки */"
                },
                { text: "Назад", next: "start" }
            ]
        },
        special_shop: {
            id: "special_shop",
            title: "Торговец - Особые товары",
            body: "Ах, VIP клиент! Вот мои самые редкие товары:",
            buttons: [
                {
                    text: "Легендарный меч",
                    action: "player.sendMessage('§6Вы получили легендарный меч!'); player.runCommand('give @s diamond_sword{display:{Name:\"\\\"§6Легендарный Меч\\\"\"}} 1');"
                },
                { text: "Назад", next: "start" }
            ]
        }
    }
};

/**
 * Выполняет JavaScript код в контексте игрока
 * @param {string} code - Код для выполнения
 * @param {Player} player - Игрок
 */
function executeActionCode(code, player) {
    try {
        // Создаем функцию с доступом к player
        const func = new Function('player', code);
        func(player);
    } catch (error) {
        console.error("Error executing dialog action code:", error);
        player.sendMessage("§cПроизошла ошибка в действии диалога!");
    }
}

/**
 * Выполняет зарегистрированную внешнюю функцию
 * @param {string} functionName - Имя функции
 * @param {Player} player - Игрок
 */
function executeFunction(functionName, player) {
    const func = customFunctions.get(functionName);
    if (func) {
        try {
            func(player); // Вызываем функцию, передавая ей игрока
        } catch (error) {
            console.error(`Error executing custom function '${functionName}':`, error);
            player.sendMessage(`§cПроизошла ошибка при выполнении действия '${functionName}'!`);
        }
    } else {
        console.warn(`Custom function '${functionName}' not found in registry.`);
        player.sendMessage(`§cДействие '${functionName}' не найдено.`);
    }
}

/**
 * Обрабатывает действие кнопки диалога
 * @param {string | Array<string>} action - Действие или массив действий
 * @param {Player} player - Игрок
 */
function handleAction(action, player) {
    if (Array.isArray(action)) {
        // Если action - массив, выполняем каждое действие по порядку
        for (const singleAction of action) {
            handleSingleAction(singleAction, player);
        }
    } else if (typeof action === 'string') {
        // Если action - строка, обрабатываем её как одно действие
        handleSingleAction(action, player);
    }
}

/**
 * Обрабатывает одно действие
 * @param {string} actionStr - Строка действия
 * @param {Player} player - Игрок
 */
function handleSingleAction(actionStr, player) {
    if (actionStr.startsWith("FUNCTION:")) {
        // Если действие начинается с "FUNCTION:", вызываем зарегистрированную функцию
        const functionName = actionStr.substring("FUNCTION:".length).trim();
        executeFunction(functionName, player);
    } else {
        // Иначе выполняем как JavaScript код
        executeActionCode(actionStr, player);
    }
}

/**
 * Проверяет условие для отображения кнопки
 * @param {string} condition - Условие
 * @param {Player} player - Игрок
 * @returns {boolean}
 */
function checkCondition(condition, player) {
    try {
        const func = new Function('player', `return ${condition};`);
        return func(player);
    } catch (error) {
        console.error("Error checking dialog condition:", error);
        return false;
    }
}

/**
 * Отображает диалог по ID из указанного диалога
 * @param {Player} player
 * @param {string} dialogName - Название диалога
 * @param {string} nodeId - ID узла диалога
 */
function showDialog(player, dialogName, nodeId = "start") {
    const dialogTree = dialogs[dialogName];
    if (!dialogTree) {
        console.warn(`Dialog "${dialogName}" not found.`);
        return;
    }
    const node = dialogTree[nodeId];
    if (!node) {
        console.warn(`Dialog node "${nodeId}" not found in dialog "${dialogName}".`);
        return;
    }
    const form = new ActionFormData()
        .title(node.title)
        .body(node.body);
    // Фильтруем кнопки по условиям
    const availableButtons = node.buttons.filter(button => {
        if (!button.condition) return true;
        return checkCondition(button.condition, player);
    });
    for (const button of availableButtons) {
        form.button(button.text, 'textures/ui/dialogues/dialogue_default_icon');
    }
    form.show(player).then(response => {
        if (response.canceled) return;
        const button = availableButtons[response.selection];
        if (!button) return;
        if (button.next) {
            showDialog(player, dialogName, button.next);
        } else if (button.action) {
            // Используем новую функцию обработки действий
            handleAction(button.action, player);
            // После выполнения действия можно закрыть диалог или остаться
            // Для примера - просто ничего не делаем, диалог закрывается
        }
    }).catch(error => {
        console.error("Error showing dialog:", error);
    });
}

// Экспортируем для использования в других файлах
export { showDialog, dialogs, customFunctions };