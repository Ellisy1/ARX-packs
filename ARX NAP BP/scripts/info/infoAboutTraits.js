import { ActionFormData } from "@minecraft/server-ui"
import { getSkillsData, getInfoAboutHowToIncreaseSkills, getInfoAboutSkillsBuffs } from "../skillsOperations"


// Выводим экранчик с опциями навыков
export function infoAboutTraits(player) {
    const form = new ActionFormData()
        .title("Черты характера")
        .button("Мои черты", 'textures/ui/info/about_skills_my_skills')
        .button("Все существующие черты", 'textures/ui/info/about_skills_levelup')

        .show(player)
        .then((response) => {
            if (response.selection === 0) {
                const form1 = new ActionFormData()
                    .title("Мои черты")
                    .body('В разработке!')
                    .show(player)

            } else if (response.selection === 1) {
                const form2 = new ActionFormData()
                    .title("Все существующие черты")
                    .body('В разработке!')
                    .show(player)

            }
        })
}