// Операции с навыками

import { queueCommand } from './commandQueue'
import { checkForItem } from './checkForItem'

// Увеличиваем прогресс навыка на inputValue, учитывая срезание прогресса от уровня
export function increaseSkillProgress(player, skill, inputValue) {
    if (!(skill in registeredSkills)) {
        console.warn(`Попыка увеличить прогресс незарегистрированного навыка ${skill}`)
        return undefined
    }

    // Определяем, насколько нужно улучшить навык
    let increaseValue = inputValue / (2 ** player.getDynamicProperty(`skill:${skill}_level`))

    // Настраиваем множитель получаемного опыта
    let increaseMultiplier = 1

    if (checkForItem(player, "Feet", "arx:ring_lamenite_zircon")) { increaseMultiplier += 0.5 }
    if (checkForItem(player, "Offhand", "arx:ring_lamenite_zircon")) { increaseMultiplier += 0.5 }

    if (checkForItem(player, "Feet", "arx:ring_malafiotironite_zircon")) { increaseMultiplier += 0.4 }
    if (checkForItem(player, "Offhand", "arx:ring_malafiotironite_zircon")) { increaseMultiplier += 0.4 }

    if (checkForItem(player, "Feet", "arx:ring_caryite_zircon")) { increaseMultiplier += 0.3 }
    if (checkForItem(player, "Offhand", "arx:ring_caryite_zircon")) { increaseMultiplier += 0.3 }

    if (checkForItem(player, "Feet", "arx:ring_naginitis_zircon")) { increaseMultiplier += 0.2 }
    if (checkForItem(player, "Offhand", "arx:ring_naginitis_zircon")) { increaseMultiplier += 0.2 }

    if (checkForItem(player, "Feet", "arx:ring_gold_zircon")) { increaseMultiplier += 0.1 }
    if (checkForItem(player, "Offhand", "arx:ring_gold_zircon")) { increaseMultiplier += 0.1 }

    if (checkForItem(player, "Feet", "arx:ring_aluminum_zircon")) { increaseMultiplier += 0.05 }
    if (checkForItem(player, "Offhand", "arx:ring_aluminum_zircon")) { increaseMultiplier += 0.05 }

    // Домножаем получаемый опыт на множитель
    increaseValue *= increaseMultiplier

    // Отправляем increaseMultiplier в DP
    player.setDynamicProperty('xpMultiplier', increaseMultiplier)

    // Добавляем опыт игроку
    player.setDynamicProperty(`skill:${skill}_progress`, increaseValue + player.getDynamicProperty(`skill:${skill}_progress`))


    // Проверяем, надо ли делать левелап
    if (player.getDynamicProperty(`skill:${skill}_progress`) >= 100) {
        increaseSkillLevel(player, skill)
    }
}

// Увеличиваем уровень
export function increaseSkillLevel(player, skill) {
    if (player.getDynamicProperty('hasRegisteredCharacter') == true) {
        if (!(skill in registeredSkills)) {
            console.warn(`Попыка увеличить уровень незарегистрированного навыка ${skill}`)
            return undefined
        }

        // Изменяем properties игрока
        player.setDynamicProperty(`skill:${skill}_progress`, 0)
        player.setDynamicProperty(`skill:${skill}_level`, player.getDynamicProperty(`skill:${skill}_level`) + 1)
        // Отчитываемся в чат
        queueCommand(player, `playsound player.skill.levelUp @s ~ ~ ~`)
        queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§e§lНовый уровень§r§f: ${registeredSkills[skill].nameRU}§f: §a${player.getDynamicProperty(`skill:${skill}_level`)}" } ] }`)
    }
}

// Возвращаем данные о навыках
export function getSkillsData(player) {
    let resultString = ''

    for (let skill in registeredSkills) {

        let skill_level = player.getDynamicProperty(`skill:${skill}_level`)
        let skill_progress = player.getDynamicProperty(`skill:${skill}_progress`)

        resultString += `§a${skill_level}§f ур. ${registeredSkills[skill].nameRU}§f, прогресс §a${Math.floor(skill_progress)}§fŨ\n`
    }

    return resultString
}

// Возвращаем данные о том как вкачать навык
export function getInfoAboutHowToIncreaseSkills(player) {
    let resultString = ''

    for (let skill in registeredSkills) {

        resultString += `${registeredSkills[skill].nameRU} §f${registeredSkills[skill].howToIncrease}\n`
    }

    return resultString
}

// Возвращаем данные о баффах от 1 уровня навыка
export function getInfoAboutSkillsBuffs(player) {
    let resultString = ''

    for (let skill in registeredSkills) {

        resultString += `${registeredSkills[skill].nameRU} §f${registeredSkills[skill].buff}\n`
    }

    return resultString
}

// Стираем уровень навыков и их прогресс
export function wipeSkills(player) {
    wipeSkillsProgress(player)

    for (let skill in registeredSkills) {
        player.setDynamicProperty(`skill:${skill}_level`, 0);
    }
}

// Стираем прогресс навыка
export function wipeSkillsProgress(player) {

    for (let skill in registeredSkills) {
        player.setDynamicProperty(`skill:${skill}_progress`, 0)
    }
}

// Зарегистрированные навыки
export const registeredSkills = {
    'strength': {
        nameRU: "§cСила",
        howToIncrease: "повышается, когда вы наносите удары в ближнем бою, при этом увеличение навыка прямо зависит от нанесённого урона.",
        buff: "увеличивает базовый урон на 0.5."
    },
    'endurance': {
        nameRU: "§6Выносливость",
        howToIncrease: "повышается, когда вы сражаетесь в ближнем бою, будучи перегруженным, либо когда вы ходите с перегрузом.",
        buff: "увеличивает переносимый вес на 0.5"
    },
    'running': {
        nameRU: "§2Бег",
        howToIncrease: "повышается, когда вы бежите без перегруза.",
        buff: "увеличивает скорость бега на 2Ũ."
    },
    'shooting': {
        nameRU: "§aСтрельба",
        howToIncrease: "повышается, когда вы стреляете и попадаете из дистанционного немагического оружия.",
        buff: "увеличивает точность и дальность стрельбы, а так же урон от стрел."
    },
    'mana': {
        nameRU: "§bМана",
        howToIncrease: "повышается, когда вы сотворяете заклинания, требующие большое количество маны.",
        buff: "увеличивает максимальную ману на 4."
    },
    'mp_regen': {
        nameRU: "§dМагическая мощь",
        howToIncrease: "повышается, когда вы сотворяете заклинания, требующие небольшое количество маны.",
        buff: "увеличивает скорость регенерации маны на 0.2."
    },
    'hp': {
        nameRU: "§eСтойкость",
        howToIncrease: "повышается, когда вы получаете удары, при этом увеличение навыка прямо зависит от полученного урона.",
        buff: "увеличивает здоровье на сердце."
    },
    'swimming': {
        nameRU: "§bПлавание",
        howToIncrease: "повышается, когда вы плаваете.",
        buff: "увеличивает скорость плавания."
    }
}