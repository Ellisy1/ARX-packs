import { ActionFormData } from "@minecraft/server-ui"

import { infoAboutCharacter } from "./infoAboutCharacter"
import { infoAboutTastes } from "./infoAboutTastes"
import { infoSkillsScreen } from "./infoSkillsScreen"
import { infoAboutStats } from "./infoAboutStats"
import { infoAboutStatistics } from "./infoAboutStatistics"
import { guide } from "./guide"

// Выводим экранчик с книжки инфо
export function infoScreen(player) {
    const form = new ActionFormData()
        .title("Информация")
        .button("Гид", 'textures/ui/info/guide')
        .button("О персонаже", 'textures/ui/info/about_character')
        .button("Навыки", 'textures/ui/info/about_skills')
        .button("Характеристики", 'textures/ui/info/about_stats')
        .button("Черты характера", 'textures/ui/info/about_traits')
        .button("Вкусы", 'textures/ui/info/about_tastes')
        .button("Достижения", 'textures/ui/info/about_achievements')
        .button("Статистика", 'textures/ui/info/about_statistics')
        .button("Авторы и разработчики", 'textures/ui/info/about_authors')

        .show(player)
        .then((response) => {
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
                player.runCommand('function info/achievements')
            } else if (response.selection === 7) {
                infoAboutStatistics(player)
            } else if (response.selection === 8) {
                player.runCommand('function info/authors')
            }
        })
}