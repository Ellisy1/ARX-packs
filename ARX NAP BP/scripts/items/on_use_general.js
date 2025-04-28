// Imports - Minecraft
import { world, EntityComponentTypes, EquipmentSlot, system } from "@minecraft/server";
import { setScore } from "../scoresOperations";
import { getNearestPlayer } from "../getNearestPlayer"
import { checkForItem } from "../checkForItem"
import { infoScreen } from '../info/_infoScreen'
import { manageCD } from "../manageCD";

// Использование предметов
world.afterEvents.itemUse.subscribe((event) => { // Обнаружаем юзание предмета на ПКМ
    const player = event.source; // Получаем объект игрока
    const item = player.getComponent(EntityComponentTypes.Equippable).getEquipment(EquipmentSlot.Mainhand)
    switch (event.itemStack.typeId) {

        // Тест
        case "arx:mod_sword":
            if (manageCD(player)) {
                console.warn("test")
            }
            break

        // АЛХИМИЯ
        // Сигареты
        case "arx:cigarette_kavra":
            if (manageCD(player)) {
                player.runCommand("function alchemy/cigarettes/cigarette_kavra")
            }
            break
        case "arx:cigarette_fiolix":
            if (manageCD(player)) {
                player.runCommand("function alchemy/cigarettes/cigarette_fiolix")
                player.setDynamicProperty('FiolixNarcoticPower', player.getDynamicProperty('FiolixNarcoticPower') + 600)
            }
            break

        // Флаконы с маслом для лампы
        case "arx:vial_lamp_oil_fire":
            if (manageCD(player)) {
                player.runCommand("function alchemy/vials/vial_lamp_oil_fire")
            }
            break
        case "arx:vial_lamp_oil_grease":
            if (manageCD(player)) {
                player.runCommand("function alchemy/vials/vial_lamp_oil_grease")
            }
            break
        case "arx:vial_lamp_oil_plumbum":
            if (manageCD(player)) {
                player.runCommand("function alchemy/vials/vial_lamp_oil_plumbum")
            }
            break
        case "arx:vial_lamp_oil_spirt":
            if (manageCD(player)) {
                player.runCommand("function alchemy/vials/vial_lamp_oil_spirt")
            }
            break

        // Бутылки
        case "arx:beer_bottle":
            if (manageCD(player)) {
                player.runCommand("function alchemy/bottles/beer_bottle")
            }
            break
        case "arx:default_bottle":
            if (manageCD(player)) {
                player.runCommand("function alchemy/bottles/default_bottle")
            }
            break
        case "arx:rounded_bottle":
            if (manageCD(player)) {
                player.runCommand("function alchemy/bottles/rounded_bottle")
            }
            break
        case "arx:triangle_bottle":
            if (manageCD(player)) {
                player.runCommand("function alchemy/bottles/triangle_bottle")
            }
            break



        // КНИГИ
        // Книги, дропающие чар книги
        case "arx:book_case_a":
            player.runCommand("function books/enchanted_books/book_case_a")
            break
        case "arx:book_case_b":
            player.runCommand("function books/enchanted_books/book_case_b")
            break
        case "arx:book_case_c":
            player.runCommand("function books/enchanted_books/book_case_c")
            break
        case "arx:book_case_d":
            player.runCommand("function books/enchanted_books/book_case_d")
            break

        // Читаемые
        case "arx:book_about_ancients":
            player.runCommand("function books/storybooks/book_about_ancients")
            break
        case "arx:book_about_march":
            player.runCommand("function books/storybooks/book_about_march")
            break
        case "arx:book_about_tsaskhin":
            player.runCommand("function books/storybooks/book_about_tsaskhin")
            break

        case "arx:book_asarocchi_i":
            player.runCommand("function books/storybooks/book_asarocchi_i")
            break
        case "arx:book_asarocchi_ii":
            player.runCommand("function books/storybooks/book_asarocchi_ii")
            break
        case "arx:book_asarocchi_iii":
            player.runCommand("function books/storybooks/book_asarocchi_iii")
            break
        case "arx:book_asarocchi_iv":
            player.runCommand("function books/storybooks/book_asarocchi_iv")
            break
        case "arx:book_asarocchi_ix":
            player.runCommand("function books/storybooks/book_asarocchi_ix")
            break
        case "arx:book_asarocchi_v":
            player.runCommand("function books/storybooks/book_asarocchi_v")
            break
        case "arx:book_asarocchi_vi":
            player.runCommand("function books/storybooks/book_asarocchi_vi")
            break
        case "arx:book_asarocchi_vii":
            player.runCommand("function books/storybooks/book_asarocchi_vii")
            break
        case "arx:book_asarocchi_viii":
            player.runCommand("function books/storybooks/book_asarocchi_viii")
            break
        case "arx:book_asarocchi_x":
            player.runCommand("function books/storybooks/book_asarocchi_x")
            break

        case "arx:book_dext":
            player.runCommand("function books/storybooks/book_dext")
            break
        case "arx:book_dragon_artifacts":
            player.runCommand("function books/storybooks/book_dragon_artifacts")
            break
        case "arx:book_golfari":
            player.runCommand("function books/storybooks/book_golfari")
            break
        case "arx:book_holy_sakura":
            player.runCommand("function books/storybooks/book_holy_sakura")
            break
        case "arx:book_legend_of_fallen_god":
            player.runCommand("function books/storybooks/book_legend_of_fallen_god")
            break
        case "arx:book_mage_notes":
            player.runCommand("function books/storybooks/book_mage_notes")
            break
        case "arx:book_nameless_paladin":
            player.runCommand("function books/storybooks/book_nameless_paladin")
            break
        case "arx:book_of_immortal_eagle":
            player.runCommand("function books/storybooks/book_of_immortal_eagle")
            break
        case "arx:book_philosophy":
            player.runCommand("function books/storybooks/book_philosophy")
            break
        case "arx:book_thinking_about_gods":
            player.runCommand("function books/storybooks/book_thinking_about_gods")
            break
        case "arx:book_wandering_puppet":
            player.runCommand("function books/storybooks/book_wandering_puppet")
            break

        // Читаемые иностранные
        case "arx:book_oculus_primae_maledictionis":
            player.runCommand("function books/storybooks/foreign/book_oculus_primae_maledictionis")
            break

        // Особые 
        case "arx:big_storybook":
            if (manageCD(player)) {
                player.runCommand("function books/big_storybook")
            }
            break

        case "arx:scientific_book":
            if (manageCD(player)) {
                player.runCommand("function books/scientific_book")
            }
            break
        case "arx:scientific_book_unused":
            if (manageCD(player)) {
                player.runCommand("function books/scientific_book_unused")
            }
            break

        case "arx:big_xp_book":
            player.runCommand("function books/big_xp_book")
            break
        case "arx:mid_xp_book":
            player.runCommand("function books/mid_xp_book")
            break
        case "arx:small_xp_book":
            player.runCommand("function books/small_xp_book")
            break

        // Кристаллы
        case "arx:crystal_of_durability":
            player.runCommand("function crystals/crystal_of_durability")
            break
        case "arx:crystal_of_mob_calmness":
            player.runCommand("function crystals/crystal_of_mob_calmness")
            break
        case "arx:crystal_of_return":
            player.runCommand("function crystals/crystal_of_return")
            break
        case "arx:crystal_of_swift_respawn":
            player.runCommand("function crystals/crystal_of_swift_respawn")
            break

        // Мертвые мобы
        case "arx:dead_allay":
            player.runCommand("function dead_mobs/allay")
            break
        case "arx:dead_arctic_fox":
            player.runCommand("function dead_mobs/arctic_fox")
            break
        case "arx:dead_bat":
            player.runCommand("function dead_mobs/bat")
            break
        case "arx:dead_bear":
            player.runCommand("function dead_mobs/bear")
            break
        case "arx:dead_big_leech":
            player.runCommand("function dead_mobs/big_leech")
            break
        case "arx:dead_camel":
            player.runCommand("function dead_mobs/camel")
            break
        case "arx:dead_cat":
            player.runCommand("function dead_mobs/cat")
            break
        case "arx:dead_cave_rat":
            player.runCommand("function dead_mobs/cave_rat")
            break
        case "arx:dead_cave_spider":
            player.runCommand("function dead_mobs/cave_spider")
            break
        case "arx:dead_chicken":
            player.runCommand("function dead_mobs/chicken")
            break
        case "arx:dead_cow":
            player.runCommand("function dead_mobs/cow")
            break
        case "arx:dead_deer":
            player.runCommand("function dead_mobs/deer")
            break
        case "arx:dead_dolphin":
            player.runCommand("function dead_mobs/dolphin")
            break
        case "arx:dead_duckling":
            player.runCommand("function dead_mobs/duckling")
            break
        case "arx:dead_elemental_desert":
            player.runCommand("function dead_mobs/elemental_desert")
            break
        case "arx:dead_elemental_snow":
            player.runCommand("function dead_mobs/elemental_snow")
            break
        case "arx:dead_fiercewolf":
            player.runCommand("function dead_mobs/fiercewolf")
            break
        case "arx:dead_fox":
            player.runCommand("function dead_mobs/fox")
            break
        case "arx:dead_frog":
            player.runCommand("function dead_mobs/frog")
            break
        case "arx:dead_glow_squid":
            player.runCommand("function dead_mobs/glow_squid")
            break
        case "arx:dead_goat":
            player.runCommand("function dead_mobs/goat")
            break
        case "arx:dead_horse":
            player.runCommand("function dead_mobs/horse")
            break
        case "arx:dead_kapibara":
            player.runCommand("function dead_mobs/kapibara")
            break
        case "arx:dead_lama":
            player.runCommand("function dead_mobs/lama")
            break
        case "arx:dead_lavra":
            player.runCommand("function dead_mobs/lavra")
            break
        case "arx:dead_leech":
            player.runCommand("function dead_mobs/leech")
            break
        case "arx:dead_meat_beatle":
            player.runCommand("function dead_mobs/meat_beatle")
            break
        case "arx:dead_panda":
            player.runCommand("function dead_mobs/panda")
            break
        case "arx:dead_parrot":
            player.runCommand("function dead_mobs/parrot")
            break
        case "arx:dead_pig":
            player.runCommand("function dead_mobs/pig")
            break
        case "arx:dead_polar_bear":
            player.runCommand("function dead_mobs/polar_bear")
            break
        case "arx:dead_rabbit":
            player.runCommand("function dead_mobs/rabbit")
            break
        case "arx:dead_rat_monstr":
            player.runCommand("function dead_mobs/rat_monstr")
            break
        case "arx:dead_sand_elemental":
            player.runCommand("function dead_mobs/sand_elemental")
            break
        case "arx:dead_sand_leech":
            player.runCommand("function dead_mobs/sand_leech")
            break
        case "arx:dead_sea_turtle":
            player.runCommand("function dead_mobs/sea_turtle")
            break
        case "arx:dead_sheep":
            player.runCommand("function dead_mobs/sheep")
            break
        case "arx:dead_skorpion":
            player.runCommand("function dead_mobs/skorpion")
            break
        case "arx:dead_small_rat_black":
            player.runCommand("function dead_mobs/small_rat_black")
            break
        case "arx:dead_small_rat_white":
            player.runCommand("function dead_mobs/small_rat_white")
            break
        case "arx:dead_snow_bars":
            player.runCommand("function dead_mobs/snow_bars")
            break
        case "arx:dead_snow_bug":
            player.runCommand("function dead_mobs/snow_bug")
            break
        case "arx:dead_snow_lady":
            player.runCommand("function dead_mobs/snow_lady")
            break
        case "arx:dead_squid":
            player.runCommand("function dead_mobs/squid")
            break
        case "arx:dead_swamp_monster":
            player.runCommand("function dead_mobs/swamp_monster")
            break
        case "arx:dead_warden":
            player.runCommand("function dead_mobs/warden")
            break
        case "arx:dead_wolf":
            player.runCommand("function dead_mobs/wolf")
            break

        case "arx:xp_shard":
            player.runCommand('xp 30')
            player.runCommand('summon xp_orb')
            player.runCommand('summon xp_orb')
            player.runCommand('summon xp_orb')
            player.runCommand('clear @s arx:xp_shard 0 1')
            break

        case "arx:xp_megashard":
            player.runCommand('xp 270')
            player.runCommand('summon xp_orb')
            player.runCommand('summon xp_orb')
            player.runCommand('summon xp_orb')
            player.runCommand('summon xp_orb')
            player.runCommand('summon xp_orb')
            player.runCommand('summon xp_orb')
            player.runCommand('summon xp_orb')
            player.runCommand('summon xp_orb')
            player.runCommand('summon xp_orb')
            player.runCommand('clear @s arx:xp_megashard 0 1')
            break

        case "arx:myterious_eye":
            if (manageCD(player)) {
                const randTitle = Math.floor(Math.random() * 10)
                if (randTitle == 0) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§dМистическое око предсказывает вам хороший день для рыбалки" } ] }`) }
                if (randTitle == 1) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§dМистическое око предсказывает вам хороший день для приключений" } ] }`) }
                if (randTitle == 2) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§dМистическое око предсказывает вам плохой день" } ] }`) }
                if (randTitle == 3) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§dМистическое око предсказывает вам ужасный день. Лучшим решением будет остаться дома" } ] }`) }
                if (randTitle == 4) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§dМистическое око предсказывает вам хороший день для сделок" } ] }`) }

                if (randTitle == 5) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§dМистическое око предсказывает вам хороший день для сражений" } ] }`) }
                if (randTitle == 6) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§dМистическое око предсказывает вам хороший день для вызова вашей удаче" } ] }`) }
                if (randTitle == 7) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§dМистическое око предсказывает вам хороший день для похода в шахту" } ] }`) }
                if (randTitle == 8) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§dМистическое око предсказывает вам хороший день для путешествий" } ] }`) }
                if (randTitle == 9) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§dМистическое око предсказывает вам хороший день для пополнения своих коллекций. Займитесь созданием экипировки" } ] }`) }
            }
            break

        // Свитки
        case "arx:scroll_of_fire_resistance":
            if (player.getDynamicProperty('freezing') < 0) {
                player.setDynamicProperty('freezing', 0)
            }
            player.setDynamicProperty('heatingBlockByScroll', 30)

            player.runCommand('effect @s fire_resistance 30 0 true')
            player.runCommand('clear @s arx:scroll_of_fire_resistance 0 1')
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aСвиток использован!" } ] }`)
            player.runCommand('playsound elemental_use @a ~ ~ ~')
            break

        case "arx:scroll_of_healing":
            if (player.getDynamicProperty('scrollOfHealingCD') == 0) {
                player.setDynamicProperty('scrollOfHealingCD', 60)
                player.runCommand('effect @s regeneration 10 1 true')
                player.runCommand('clear @s arx:scroll_of_healing 0 1')
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aСвиток использован!" } ] }`)
                player.runCommand('playsound elemental_use @a ~ ~ ~')
            }
            else {
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cНевозможно использовать свиток регенерации чаще, чем раз в минуту!" } ] }`)
            }
            break

        case "arx:scroll_of_oblivion":
            setScore(player, 'stress', 0)
            player.runCommand('clear @s arx:scroll_of_oblivion 0 1')
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aСвиток использован!" } ] }`)
            player.runCommand('playsound elemental_use @a ~ ~ ~')
            break

        case "arx:scroll_of_water_blocking":
            setScore(player, 'water_delay', 0)
            setScore(player, 'water_block', 30)
            player.runCommand('clear @s arx:scroll_of_water_blocking 0 1')
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aСвиток использован!" } ] }`)
            player.runCommand('playsound elemental_use @a ~ ~ ~')
            break

        case "arx:scroll_of_reborning":
            if (player.getProperty('arx:is_ghost') == true) {

                player.setDynamicProperty('ghostWithering', 0)

                player.setProperty('arx:is_ghost', false)
                player.runCommand('clear @s arx:scroll_of_reborning 0 1')

                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aВы перевоплощаетесь!" } ] }`)
                player.runCommand('playsound stop_being_ghost @a ~ ~ ~')
                player.runCommand('effect @s slowness 5 255 true')

                player.runCommand('camera @s fade time 0.5 4 1 color 230 255 230')
            } else {
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cМне сейчас это не нужно, я не призрак." } ] }`)
            }
            break


        // ДЕМОНСКОЕ
        case "arx:demon_book":
            if (manageCD(player)) {
                player.runCommand("function demon/demon_book")
            }
            break
        case "arx:undemon_book":
            player.runCommand("function demon/undemon_book")
            break

        // ИНФО
        case "arx:united_player_data":
            infoScreen(player)
            break

        // Хай-тек
        case "arx:universal_radio_key":
            player.runCommand("function high_tec/urk/router")
            break

        // Прочее
        case "arx:action_break_arm":
            if (manageCD(player)) {
                player.runCommand("function actions/beat_prisoner/action_break_arm")
            }
            break
        case "arx:action_break_leg":
            if (manageCD(player)) {
                player.runCommand("function actions/beat_prisoner/action_break_leg")
            }
            break
        case "arx:action_stab":
            if (manageCD(player)) {
                player.runCommand("function actions/beat_prisoner/action_stab")
            }
            break

        case "arx:dildo":
            if (player.getProperty("arx:gender") == 2) {
                if (checkForItem(player, "Chest", undefined) === false) {
                    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cМне нужно раздеться, чтобы использовать дилдо." } ] }`)
                } else if (player.hasTag('is_moving')) {
                    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cИспользовать дилдо на ходу - плохая идея." } ] }`)
                } else {
                    player.runCommand(`playanimation @s animation.humanoid.dildo.default a 0.1 "query.is_moving || q.property('arx:is_knocked') > 0 || !query.equipped_item_any_tag('slot.weapon.mainhand', 'is_dildo') || q.is_sneaking"`)
                    player.setProperty("arx:cd", 40)
                }
            } else if (player.getProperty("arx:gender") == 1) {
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "Вам не приходит в голову, каким образом это можно использовать" } ] }`)
            }
            break

        // Сравнение НЕ через ID предмета
        default:
            if (item?.getTags() == "is_dagger") {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.dagger.a')
                }
            }
            else if (item?.getTags() == "is_default_sword") {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.default.a')
                }
            }
            else if (item?.getTags() == "is_heavy_sword") {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.heavy.a')
                }
            }
            else if (item?.getTags() == "is_lance") {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.lance.a')
                }
            }
            else if (item?.getTags() == "is_long_sword") {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.longsword.a')
                }
            }
            else if (item?.getTags() == "is_scythe") {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.scythe.a')
                }
            }
            else if (item?.getTags() == "is_hheavy_sword") {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.veryheavy.a')
                }
            }
    }
})

function launchBlocking(player) {
    player.runCommand('effect @s resistance 1 1 true')
    player.setDynamicProperty('prohibit_damage', 20)
    player.setDynamicProperty('attackCD', player.getDynamicProperty('attackCD') + 25)
    player.runCommand("summon arx:blocking_invisible_shield")
}