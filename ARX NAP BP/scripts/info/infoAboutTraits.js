import { ActionFormData } from "@minecraft/server-ui"
import { getSkillsData, getInfoAboutHowToIncreaseSkills, getInfoAboutSkillsBuffs } from "../skillsOperations"
import { display_all_traits, display_my_traits, how_traits_work } from '../traits/display_traits'

// Выводим экранчик с опциями навыков
export function infoAboutTraits(player) {
    const form = new ActionFormData()
        .title("Черты характера")
        .button("Мои черты", 'textures/ui/info/my_traits')
        .button("Все существующие черты", 'textures/ui/info/all_traits')
        .button("Как работает механика черт", 'textures/ui/info/how_traits_work')

        .show(player)
        .then((response) => {
            if (response.selection === 0) {
                const form1 = new ActionFormData()
                    .title("Мои черты")
                    .body(display_my_traits(player))
                    .show(player)

            } else if (response.selection === 1) {
                const form2 = new ActionFormData()
                    .title("Все существующие черты")
                    .body(display_all_traits(player))
                    .show(player)

            } else if (response.selection === 2) {
                const form2 = new ActionFormData()
                    .title("Все существующие черты")
                    .body(how_traits_work(player))
                    .show(player)

            }
        })
}