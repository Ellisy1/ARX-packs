import { ActionFormData } from "@minecraft/server-ui"
import { getSkillsData, getInfoAboutHowToIncreaseSkills, getInfoAboutSkillsBuffs } from "../skillsOperations"


// Выводим экранчик с опциями навыков
export function infoSkillsScreen(player) {
    const form = new ActionFormData()
        .title("Навыки")
        .button("Мои навыки", 'textures/ui/info/about_skills_my_skills')
        .button("Как прокачать навыки", 'textures/ui/info/about_skills_levelup')
        .button("Бонусы от навыков", 'textures/ui/info/about_skills_buffs')

        .show(player)
        .then((response) => {
            if (response.selection === 0) {
                const form1 = new ActionFormData()
                    .title("Мои навыки")
                    .body(getSkillsData(player))
                    .show(player)

            } else if (response.selection === 1) {
                const form2 = new ActionFormData()
                    .title("Как прокачать навыки")
                    .body(getInfoAboutHowToIncreaseSkills(player))
                    .show(player)

            } else if (response.selection === 2) {
                const form3 = new ActionFormData()
                    .title("Бонусы от навыков")
                    .body(`За §a1 уровень§f навыка:\n\n${getInfoAboutSkillsBuffs(player)}`)
                    .show(player)
            }
        })
}