// Imports - Minecraft
import { world, EntityComponentTypes, ItemComponentTypes, EquipmentSlot, system, ItemStack } from "@minecraft/server";
import { ActionFormData } from "@minecraft/server-ui";

import { getScore, setScore } from "../scoresOperations";
import { getNearestPlayer } from "../getNearestPlayer"
import { checkForItem } from "../checkForItem"
import { infoScreen } from '../info/_infoScreen'
import { manageCD } from "../manageCD";
import { launchCameraUI } from '../camera/launchCameraUI'
import { TPWithNoxenessionPortal } from '../portals'

import { showDialog } from '../dialogues'
import { clearTraits, acquireTrait } from '../traits/traitsOperations'
import { iDP, ssDP } from "../DPOperations";

// Использование предметов
world.afterEvents.itemUse.subscribe((event) => { // Обнаружаем юзание предмета на ПКМ
    const player = event.source; // Получаем объект игрока
    const item = player.getComponent(EntityComponentTypes.Equippable).getEquipment(EquipmentSlot.Mainhand)
    switch (event.itemStack.typeId) {

        // Тест
        case "arx:mod_sword":
            if (manageCD(player)) {
                for (const playera of world.getPlayers()) {
                    console.warn(playera.name, playera.getDynamicProperty('name'), playera.getDynamicProperty('trueName'), player.getProperty('arx:is_ghost'), player.getDynamicProperty('height'))
                }
                // player.inputPermissions.setPermissionCategory(6, true)
                // const stack1 = new ItemStack('arx:small_stone', 1)
                // stack1.setLore(['§bЧто-то интересное'])
                // player.dimension.spawnItem(stack1, player.location)
                player.getComponent('minecraft:scale')
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
                iDP(player, 'FiolixNarcoticPower', 600)
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

        // Крысиные подарки
        case "arx:cult_nasty_gift_bomb":
            player.runCommand('clear @s arx:cult_nasty_gift_bomb 0 1')
            player.dimension.playSound('random.explode', player.location)
            player.dimension.spawnParticle('arx:dirty_fog', player.location)
            player.dimension.spawnParticle('arx:force_explosion', player.location)
            player.runCommand('damage @a[r=5] 10 block_explosion')
            player.runCommand('camerashake add @a[r=8] 2 0.5')
            player.runCommand("damage @s 40 block_explosion")
            break
        case "arx:cult_nasty_gift_poison":
            player.runCommand('clear @s arx:cult_nasty_gift_poison 0 1')
            player.runCommand("give @s arx:rounded_bottle_water_fiuli_wolf_death")
            break
        case "arx:cult_nasty_gift_iron_pie":
            player.runCommand('clear @s arx:cult_nasty_gift_iron_pie 0 1')
            const randNastyGift = Math.random()
            if (randNastyGift > 0.5) {
                player.runCommand("give @s arx:pie")
            } else {
                player.runCommand("give @s arx:iron_pie")
            }
            break
        case "arx:cult_nasty_gift_harakiri_sword":
            player.runCommand('clear @s arx:cult_nasty_gift_harakiri_sword 0 1')
            player.runCommand("give @s arx:harakiri_sword")
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
        case "arx:cultists_letter":
            player.sendMessage("§lПисьмо без названия\n§r§fВнимание! Вы вторглись на чужие земли без разрешения. Ваше грязное присутствие оскверняет великого Раттекса. Предупреждаем: не смейте общаться с разумными крысами, иначе ваша гниль заразит их. Убирайтесь с этих земель, пока мы еще настроены на мирное решение.\n\n§oСтражи священного порядка")
            break
        case "arx:cultists_letter_ii":
            player.sendMessage("§lПриказ Раттекса\n§r§fСлушайте голос великого Раттекса. Он в ярости от людей! Их шаги оскорбляют нашу священную землю, их дыхание заражает воздух, их города - гной на теле нашего мира, который создан для нас, избранных. Недостойные люди отвергли нашу милость разрешить им уйти по-хорошему, и мы исполняем священный долг, очищая эту землю от грязи во имя священного Раттекса.\n\nЧеловек - зараза. Он пришёл на наши земли, выжигая огнём наши дома, извращая нашу священную магию и вольно пользуясь нашей священной руной. Они пробрались к сбившимся с пути в бар и веселятся с ними, оскорбляя весь крысиный народ!\n\nПоэтому слушай и повинуйся! Человек - враг. Каждый уцелевший - оскорбление Раттекса. Каждое убийство человека - священно.\n\n§oАкх-цхакель, воплощая слова священного Раттекса")
            break
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
                const rand = Math.random()

                if (rand < 0.333) {
                    player.sendMessage('Вы прочитали §dполезную§f историю.')
                    player.runCommand('xp 100 @s')
                    for (let i = 0; i < 4; i++) {
                        player.runCommand('summon minecraft:xp_orb')
                    }
                }

                else if (rand < 0.5) {
                    player.sendMessage(' Вы прочитали §aинтересную§f историю!')
                    iDP(player, 'stress', -1000)
                }
                else if (rand < 0.666) {
                    player.sendMessage(' Вы прочитали §cгрустную§f историю.')
                    iDP(player, 'stress', 1500)
                }

                else if (rand < 0.8) {
                    player.sendMessage('Вы прочитали §cстрашную§f историю!')
                    acquireTrait(player, [0, 0, 1])
                }
                else if (rand < 0.932) {
                    player.sendMessage('Вы прочитали §bпоучительную§f историю.')
                    acquireTrait(player, [0, 1, 0])
                }
                else {
                    player.sendMessage('Вы прочитали §eвоодушевляющую§f историю!')
                    acquireTrait(player, [1, 0, 0])
                }


                player.runCommand('playsound item.book.page_turn @a ~ ~ ~')
                if (Math.random() < 0.15) {
                    player.sendMessage('Истории в книжке закончились')
                    player.runCommand('clear @s arx:big_storybook 0 1')
                    player.runCommand('playsound random.break @a ~ ~ ~')
                }
            }
            break

        case "arx:bunker_access_card":
            if (manageCD(player)) {
                if (!world.getDynamicProperty('isRatBarOpened')) {
                    ssDP(world, 'isRatBarOpened', true)
                    system.runTimeout(() => {
                        player.dimension.playSound('beep.long', { x: -2098, y: 63, z: 1497 })
                    }, 20)
                    system.runTimeout(() => {
                        player.dimension.playSound('beep.long', { x: -2098, y: 63, z: 1497 })
                    }, 60)
                    system.runTimeout(() => {
                        player.dimension.playSound('beep.long', { x: -2098, y: 63, z: 1497 })
                    }, 90)
                    system.runTimeout(() => {
                        player.dimension.playSound('abrupt_closing_of_metal_door', { x: -2098, y: 63, z: 1497 })
                        player.runCommand('fill -2100 61 1498 -2100 63 1497 air')
                        player.runCommand('execute positioned -2098 63 1497 run camerashake add @a[r=10]')
                    }, 220)
                }
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

        // Полотенце
        case "arx:towel":
            if (manageCD(player, false)) {
                if (!player.hasTag('is_moving')) {
                    if (!player.hasTag('in_block_water')) {
                        manageCD(player)
                        const currentWet = player.getDynamicProperty('wetness')
                        const valueWet = checkForItem(player, 'chest', undefined) ? 1200 : 300
                        ssDP(player, 'wetness', currentWet - valueWet)
                        player.runCommand('playsound armor.equip_leather @a ~ ~ ~ ')
                        player.addEffect('slowness', 30, { amplifier: 1, showParticles: false })
                    } else {
                        player.sendMessage('§cВылезьте из воды, чтобы вытереться')
                    }
                } else {
                    player.sendMessage('§cВстаньте на месте, чтобы вытереться')
                }
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

        case "arx:pouch_with_dyes":
            const dyeVar = Math.floor(Math.random() * 19) + 1
            player.runCommand(`playsound bundle.insert @a ~ ~ ~`)
            player.runCommand(`clear @s arx:pouch_with_dyes 0 1`)
            player.runCommand(`give @s dye 1 ${dyeVar}`)
            break

        case "arx:bundle_with_vinyl":
            const vinylVar = Math.floor(Math.random() * 14)
            player.runCommand(`clear @s arx:bundle_with_vinyl 0 1`)
            switch (vinylVar) {
                case 0: player.runCommand('give @s minecraft:music_disc_11')
                    break
                case 1: player.runCommand('give @s minecraft:music_disc_13')
                    break
                case 2: player.runCommand('give @s minecraft:music_disc_5')
                    break
                case 3: player.runCommand('give @s minecraft:music_disc_blocks')
                    break
                case 4: player.runCommand('give @s minecraft:music_disc_cat')
                    break
                case 5: player.runCommand('give @s minecraft:music_disc_chirp')
                    break
                case 6: player.runCommand('give @s minecraft:music_disc_far')
                    break
                case 7: player.runCommand('give @s minecraft:music_disc_mall')
                    break
                case 8: player.runCommand('give @s minecraft:music_disc_mellohi')
                    break
                case 9: player.runCommand('give @s minecraft:music_disc_otherside')
                    break
                case 10: player.runCommand('give @s minecraft:music_disc_stal')
                    break
                case 11: player.runCommand('give @s minecraft:music_disc_strad')
                    break
                case 12: player.runCommand('give @s minecraft:music_disc_wait')
                    break
                case 13: player.runCommand('give @s minecraft:music_disc_ward')
                    break
            }
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
                ssDP(player, 'freezing', 0)
            }
            ssDP(player, 'heatingBlockByScroll', 30)

            player.runCommand('effect @s fire_resistance 30 0 true')
            player.runCommand('clear @s arx:scroll_of_fire_resistance 0 1')
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aСвиток использован!" } ] }`)
            player.runCommand('playsound elemental_use @a ~ ~ ~')
            break

        case "arx:scroll_of_healing":
            if (player.getDynamicProperty('scrollOfHealingCD') == 0) {
                ssDP(player, 'scrollOfHealingCD', 60)
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
            ssDP(player, 'wetness', 0)
            setScore(player, 'water_block', 30)
            player.runCommand('clear @s arx:scroll_of_water_blocking 0 1')
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aСвиток использован!" } ] }`)
            player.runCommand('playsound elemental_use @a ~ ~ ~')
            break

        case "arx:scroll_of_reborning":
            if (player.getProperty('arx:is_ghost') == true) {

                player.runCommand('effect @s clear')

                ssDP(player, 'ghostWithering', 0)
                ssDP(player, 'ghostWitheringLevel', 0)
                ssDP(player, 'ghostUltimateResistance', 0)
                ssDP(player, 'ghostBoostByScarletMoon', false)

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

        case "arx:scroll_of_teleportation":
            if (manageCD(player)) {
                TPWithNoxenessionPortal(player, player, 'scroll')
            }
            break

        case "arx:scroll_of_barrier_breaking":
            let cubeSize = 10;
            // Получаем координаты игрока
            let playerPos = player.location;

            // Вычисляем начальную точку куба (левый нижний ближний угол), 
            // чтобы центр куба совпадал с позицией игрока.
            let origin = {
                x: Math.floor(playerPos.x - cubeSize / 2),
                y: Math.floor(playerPos.y - cubeSize / 2),
                z: Math.floor(playerPos.z - cubeSize / 2)
            };

            // Получаем измерение
            const dimension = world.getDimension("minecraft:overworld");

            // Итерируемся по каждому блоку в кубе
            for (let x = 0; x < cubeSize; x++) {
                for (let y = 0; y < cubeSize; y++) {
                    for (let z = 0; z < cubeSize; z++) {
                        // Вычисляем абсолютные координаты блока
                        let blockX = origin.x + x;
                        let blockY = origin.y + y;
                        let blockZ = origin.z + z;

                        // Строим команду fill для замены конкретного блока, если он arx:magic_barrier
                        let fillCommand = `fill ${blockX} ${blockY} ${blockZ} ${blockX} ${blockY} ${blockZ} minecraft:air replace arx:magic_barrier`;

                        // Выполняем команду fill для этого блока
                        dimension.runCommand(fillCommand);
                    }
                }
            }

            player.runCommand('playsound elemental_use @a ~ ~ ~')

            // Убираем использованный свиток у игрока
            player.runCommand('clear @s arx:scroll_of_barrier_breaking 0 1');

            break;
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
            if (player.getDynamicProperty('myRule:cinematographicMode') === true && player.hasTag('is_sneaking') && player.getDynamicProperty('respawnDelay') === 0) {
                launchCameraUI(player)
            } else {
                infoScreen(player)
            }
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

        case "arx:wipe_traits":
            clearTraits(player, true)
            player.sendMessage('Все черты §aсброшены!')
            player.runCommand('clear @s arx:wipe_traits 0 1')
            player.runCommand('playsound elemental_use @a ~ ~ ~')
            break

        case "arx:harakiri_sword":
            const form1 = new ActionFormData()
                .title("Харакири")
                .body('§l§cПРОЧИТАЙТЕ ВНИМАТЕЛЬНО!!!\n\n§r§fВы погибните навсегда. Если вы человек, вы станете призраком. Если вы призрак, вы умрёте навсегда.')
                .button("Убиться")
                .button("Пока не стоит")

                .show(player)
                .then((response) => {
                    if (response.selection === 0) { // Муж
                        setScore(player, 'knockout_row_sounter', 10)
                        player.runCommand('kill @s')
                    }
                })
            break
            break

        // Сравнение НЕ через ID предмета
        default:
            if (item?.getTags() == "is_dildo") {
                if (player.getProperty("arx:gender") == 2) {
                    if (checkForItem(player, "Chest", undefined) === false) {
                        player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cМне нужно раздеться, чтобы использовать дилдо." } ] }`)
                    } else if (player.hasTag('is_moving')) {
                        player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cИспользовать дилдо на ходу - плохая идея." } ] }`)
                    } else {
                        player.runCommand(`playanimation @s animation.humanoid.dildo.default a 0.1 "query.is_moving || q.property('arx:is_knocked') == true || !query.equipped_item_any_tag('slot.weapon.mainhand', 'is_dildo') || q.is_sneaking"`)
                    }
                } else {
                    player.runCommand(`tellraw @s { "rawtext": [ { "text": "Довольно необычное наощупь." } ] }`)
                }
            }
            if (item?.getTags().includes("is_dagger")) {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.dagger.a')
                }
            }
            else if (item?.getTags().includes("is_default_sword")) {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.default.a')
                }
            }
            else if (item?.getTags().includes("is_heavy_sword")) {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.heavy.a')
                }
            }
            else if (item?.getTags().includes("is_lance")) {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.lance.a')
                }
            }
            else if (item?.getTags().includes("is_long_sword")) {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.longsword.a')
                }
            }
            else if (item?.getTags().includes("is_scythe")) {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.scythe.a')
                }
            }
            else if (item?.getTags().includes("is_hheavy_sword")) {
                if (manageCD(player)) {
                    launchBlocking(player)
                    player.runCommand('playanimation @s animation.block.veryheavy.a')
                }
            }
    }
})

function launchBlocking(player) {
    // Выдаем группу компонентов для блокировки
    player.runCommand('event entity @s arx:set_blocking_damage_sensor')
    ssDP(player, 'blockingResistanceCD', 30)
    // Запрещаем урон
    ssDP(player, 'prohibit_damage', 30)
}