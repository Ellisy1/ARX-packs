import { ActionFormData } from "@minecraft/server-ui"

import { infoAboutCharacter } from "./infoAboutCharacter"
import { infoAboutTastes } from "./infoAboutTastes"
import { infoSkillsScreen } from "./infoSkillsScreen"
import { infoAboutStats } from "./infoAboutStats"
import { infoAboutStatistics } from "./infoAboutStatistics"
import { infoAboutAchievements } from "./infoAboutAchievements"
import { arxSettings } from "./arxSettings"
import { guide } from "./guide"

import { getStabilityTestResult } from '../stabilityTesting'

// Выводим экранчик с книжки инфо
export function infoScreen(player) {
    let form = new ActionFormData()

    if (player.getDynamicProperty("myRule:canSeeServerSpeedInInfoBook") === true) {
        const serverSpeed = getStabilityTestResult()
        if (serverSpeed) {
            form = form.body(`Производительность сервера: ${serverSpeed}`); // Добавляем .body() если serverSpeed есть
        } else {
            form = form.body('Измерения стабильности на этом хосте ещё не происходило. Подождите немного.'); // Добавляем .body() если serverSpeed нет
        }
    }

    form.title("Информация")
    form.button("Гид", 'textures/ui/info/guide')
    form.button("О персонаже", 'textures/ui/info/about_character')
    form.button("Навыки", 'textures/ui/info/about_skills')
    form.button("Характеристики", 'textures/ui/info/about_stats')
    form.button("Черты характера", 'textures/ui/info/about_traits')
    form.button("Вкусы", 'textures/ui/info/about_tastes')
    form.button("Достижения", 'textures/ui/info/about_achievements')
    form.button("Настройки Аркса", 'textures/ui/info/options')
    form.button("Статистика", 'textures/ui/info/about_statistics')
    form.button("Авторы и разработчики", 'textures/ui/info/about_authors')

    form.show(player).then((response) => {
        if (response.selection === 0) {
            guide(player)
        } else if (response.selection === 1) {
            infoAboutCharacter(player)
        } else if (response.selection === 2) {
            infoSkillsScreen(player)
        } else if (response.selection === 3) {
            infoAboutStats(player)
        } else if (response.selection === 4) {
            player.runCommand('function traits/traitdata')
        } else if (response.selection === 5) {
            infoAboutTastes(player)
        } else if (response.selection === 6) {
            infoAboutAchievements(player)
        } else if (response.selection === 7) {
            arxSettings(player)
        } else if (response.selection === 8) {
            infoAboutStatistics(player)
        } else if (response.selection === 9) {
            player.runCommand('function info/authors')
        }
    })
}