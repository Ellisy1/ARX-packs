import { ActionFormData } from "@minecraft/server-ui"
import { achievementsList } from '../core/achievements'

export function infoAboutAchievements(player) {

    let numOfAchievements = 0
    let numOfCompletedAchievements = 0

    for (const achievement in achievementsList) {
        numOfAchievements += 1
        if (player.getDynamicProperty(`ach:${achievement}`)) {
            numOfCompletedAchievements += 1
        }
    }

    const formach1 = new ActionFormData()
        .title("Достижения")
        .button(`Выполненные достижения (${numOfCompletedAchievements})`, 'textures/ui/info/achievementsCompleted')
        .button(`Невыполненные достижения (${numOfAchievements - numOfCompletedAchievements})`, 'textures/ui/info/achievementsIncompleted')

        .show(player)
        .then((response) => {
            if (response.selection === 0) {
                infoAboutCompletedAchievements(player)
            } else if (response.selection === 1) {
                infoAboutIncompletedAchievements(player)
            }
        })
}

function infoAboutCompletedAchievements(player) {
    let bodyText = ''
    for (const achievement in achievementsList) {
        if (player.getDynamicProperty(`ach:${achievement}`)) {
            bodyText += `§fĘ ${achievementsList[achievement].name}: §7${achievementsList[achievement].description}\n§a-------------------------------\n`
        }
    }

    if (bodyText === '') {bodyText = 'Нет выполненных достижений'}

    const formach2 = new ActionFormData()
        .title("Выполненные достижения")
        .body(bodyText)

        .show(player)
}

function infoAboutIncompletedAchievements(player) {
    let bodyText = ''
    for (const achievement in achievementsList) {
        if (player.getDynamicProperty(`ach:${achievement}`) !== true) {
            bodyText += `§fę ${achievementsList[achievement].name}: §7${achievementsList[achievement].description}\n§c-------------------------------\n`
        }
    }

    if (bodyText === '') {bodyText = 'Нет невыполненных достижений'}

    const formach2 = new ActionFormData()
        .title("Невыполненные достижения")
        .body(bodyText)

        .show(player)
}