import { acquireTrait } from "../traits/traitsOperations"
import { ssDP, iDP } from "../DPOperations"

export function onFoodConsume(player, foodname) {
    // Тип пищи у конкретной съеденной еды
    let foodType
    let foodTaste

    const playerTaste_meat = player.getDynamicProperty('playerTaste_meat')
    const playerTaste_fish = player.getDynamicProperty('playerTaste_fish')
    const playerTaste_bread = player.getDynamicProperty('playerTaste_bread')
    const playerTaste_dairy = player.getDynamicProperty('playerTaste_dairy')
    const playerTaste_herbal = player.getDynamicProperty('playerTaste_herbal')
    const playerTaste_sweet = player.getDynamicProperty('playerTaste_sweet')

    // Далее в объектах хранится еда и её вкусность
    // Структура объекта "id еды": вкусность
    const meatFood = {
        "arx:bears_potato": 65,
        "arx:bloody_steak": 60,
        "arx:borsch": 60,
        "arx:cake_contemplator": 65,
        "arx:camel_shashlik": 35,
        "arx:caretaker": 15,
        "arx:cave_rat_meat_in_caramel": 58,
        "arx:chicken_in_vodka": 50,
        "arx:cutlet": 32,
        "arx:duckling_crisps": 42,
        "arx:dumplings": 35,
        "arx:firesalo": 80,
        "arx:fried_brain": 17,
        "arx:fried_eggs": 20,
        "arx:fried_frog_legs_in_elvish": 75,
        "arx:heart_stew": 35,
        "arx:hoof_bouillon": 22,
        "arx:horse_shashlik": 64,
        "arx:juicy_goat_ribs": 46,
        "arx:khryuchevo": 55,
        "arx:king_steak": 87,
        "arx:lama_in_wine": 60,
        "arx:liver_stew": 43,
        "arx:meat_bug_bug": 30,
        "arx:meat_hurricane": 90,
        "arx:pirate_steak": 48,
        "arx:rat_monstr_with_potatoes_and_mayonnaise": 68,
        "arx:rat_potato_casserole": 65,
        "arx:reconstruction_meat_cake": 58,
        "arx:salo": 18,
        "arx:sausage": 38,
        "arx:small_rat_cutlet": 10,
        "arx:snow_bars_steak": 60,
        "arx:steamed_dolphin": 35,
        "arx:stew": 55,
        "arx:storm_steak": 67,

        "arx:fried_allay_meat": 10,
        "arx:fried_animal_heart": 10,
        "arx:fried_bat_meat": 10,
        "arx:fried_beast_heart": 10,
        "arx:fried_camel_meat": 14,
        "arx:fried_cat_meat": 10,
        "arx:fried_cave_rat_meat": 10,
        "arx:fried_dolphin_meat": 10,
        "arx:fried_duckling_fowl": 10,
        "arx:fried_fiercewolf_meat": 10,
        "arx:fried_fox_meat": 10,
        "arx:fried_venison": 10,
        "arx:fried_frog_legs": 10,
        "arx:fried_goat_meat": 10,
        "arx:fried_horse_meat": 10,
        "arx:fried_human_meat": 10,
        "arx:fried_kapibara_meat": 10,
        "arx:fried_lama_meat": 10,
        "arx:fried_liver": 10,
        "arx:fried_meat_beatle_meat": 10,
        "arx:fried_parrot_fowl": 10,
        "arx:fried_polar_bear_meat": 14,
        "arx:fried_rabbit_meat": 10,
        "arx:fried_rat_monstr_meat": 12,
        "arx:fried_sea_turtle_meat": 10,
        "arx:fried_small_rat_meat": 10,
        "arx:fried_snow_bars_meat": 10,
        "arx:fried_wolf_meat": 10,

        "arx:fried_beef": 10,
        "arx:fried_chicken": 10,
        "arx:fried_mutton": 10,
        "arx:fried_porkchop": 10,
        "arx:fried_rabbit": 10,
    }
    const fishFood = {
        "arx:devil_soup": 95,
        "arx:electrodinner": 85,
        "arx:fish_crisps": 20,
        "arx:fish_cutlet": 24,
        "arx:fish_pie": 45,
        "arx:fish_soup": 30,
        "arx:fried_fugu": 41,
        "arx:fulfilled_wish": 80,
        "arx:shark_soup": 95,
        "arx:sun_snack": 92,
        "arx:wave_of_taste": 87,

        "arx:baby_shark_meat_fried": 30,
        "arx:cramp_fish_meat_fried": 34,
        "arx:devil_fish_meat_fried": 30,
        "arx:fish_fillet_fried": 12,
        "arx:gold_tail_fish_meat_fried": 30,
        "arx:piranha_meat_fried": 25,
        "arx:salmon_fillet_fried": 20,
        "arx:sun_fish_meat_fried": 33,
        "arx:wave_fish_meat_fried": 30,

        "arx:le_fishe_au_chocolat": 42,
    }
    const breadFood = {
        "arx:allaybread": 40,
        "arx:apple_pie": 60,
        "arx:bandit_pie": 55,
        "arx:beefbread": 40,
        "arx:brainbread": 30,
        "arx:bread": 22,
        "arx:cactus_sandwich": 26,
        "arx:cheese_pie": 70,
        "arx:chocolate_donut": 58,
        "arx:chocolate_waffles": 50,
        "arx:cookie": 24,
        "arx:eggbread": 35,
        "arx:fiercebread": 50,
        "arx:gnil_pie": -30,
        "arx:iron_pie": 30,
        "arx:king_bun": 80,
        "arx:lasagna": 85,
        "arx:loaf": 40,
        "arx:meat_pie": 65,
        "arx:pie": 30,
        "arx:piratebread": 40,
        "arx:pumpkin_pie": 47,
        "arx:spicy_beefbread": 65,
    }
    const dairyFood = {
        "arx:cheese": 55,
        "arx:curd": 20,
        "arx:kefir": 35,
        "arx:sour_cream": 44,
    }
    const herbalFood = {
        "arx:baked_apple": 15,
        "arx:cactus_soup": 15,
        "arx:crisps": 35,
        "arx:dough": 0,
        "arx:elven_salad": 44,
        "arx:fiolix": 20,
        "arx:fire_berry": 8,
        "arx:grass_soup": 3,
        "arx:green_salad": 35,
        "arx:juicy_grass": 2,
        "arx:kaspora_salad": 36,
        "arx:mayonnaise": 20,
        "arx:moon_potato": 65,
        "arx:mushroom_soup": 35,
        "arx:royal_salad": 65,
        "arx:spicy_mushroom_soup": 42,
        "arx:spicy_sauce": 18,
        "arx:tea_cup_of_evergreen_dream": 85,
        "arx:tea_cup_of_fioletic": 30,
        "arx:tea_cup_of_fok": 45,
        "arx:tea_cup_of_kavra": 37,
        "arx:wooden_crust": 0,
        "arx:apple": 8,

        "arx:black_tea": 25,
        "arx:black_teamed": 50,
        "arx:celestial_tea": 37,
        "arx:green_tea": 22,
        "arx:green_teasugaralt": 39,
        "arx:milk_ylyn": 34,
        "arx:pyer_tea": 30,
        "arx:see_tea": 32,
        "arx:snow_tea": 45,
        "arx:sun_tea": 52,
        "arx:white_tea": 30,
        "arx:yellow_tea": 26,
    }
    const sweetFood = {
        "arx:caramel": 23,
        "arx:chocolate_bar": 27,
        "arx:chocolate_cubes": 36,
        "arx:cupcake": 42,
        "arx:caramel_buns": 60,
        "arx:sugar_donut": 52,
        "arx:sweet_bun": 50,
        "arx:sweet_pie": 62,
    }

    // Зелья. Зелье: отравление.
    const potions = {
        "arx:beer_bottle_solod": 350,
        "arx:beer_bottle_solod_kari": 350,
        "arx:beer_bottle_solod_kari_substractor": 350,
        "arx:beer_bottle_solod_salt": 200,
        "arx:beer_bottle_solod_solod": 350,
        "arx:beer_bottle_solod_solod_substractor": 350,
        "arx:beer_bottle_water": 0,

        "arx:default_bottle_sugar": 1800,
        "arx:default_bottle_water": 0,
        "arx:vodka": 1000,
        "arx:vodka_apple": 800,
        "arx:vodka_cactus": 650,
        "arx:vodka_fiolix": 1200,
        "arx:vodka_light_berries": 800,
        "arx:vodka_mushroom": 1100,
        "arx:vodka_sweet_berrie": 750,
        "arx:wine": 350,

        "arx:hole_bottle_mp_potion": 350,
        "arx:hole_bottle_mp_potion_royal_sorrel": 700,

        "arx:long_bottle_blood": 350,
        "arx:long_bottle_blood_karelo": 350,
        "arx:long_bottle_blood_karelo_evergreen_dream": 350,
        "arx:long_bottle_blood_karelo_evergreen_dream_dragon_pion": 350,
        "arx:long_bottle_blood_karelo_evergreen_dream_jackal_grass": 350,

        "arx:rounded_bottle_blood": 350,
        "arx:rounded_bottle_water": 0,
        "arx:rounded_bottle_water_fiuli": 350,
        "arx:rounded_bottle_water_fiuli_kari": 350,
        "arx:rounded_bottle_water_fiuli_night_kosk": 350,
        "arx:rounded_bottle_water_fiuli_night_kosk_dragon_pion": 350,
        "arx:rounded_bottle_water_fiuli_wolf_death": 5000,
        "arx:rounded_bottle_water_fiuli_yuan": 350,
        "arx:rounded_bottle_water_golden_hay": 350,
        "arx:rounded_bottle_water_golden_hay_animal_eye": 350,
        "arx:rounded_bottle_water_golden_hay_animal_eye_day_kosk": 350,
        "arx:rounded_bottle_water_golden_hay_animal_eye_night_kosk": 350,
        "arx:rounded_bottle_water_golden_hay_animal_eye_night_kosk_dragon_pion": 350,
        "arx:rounded_bottle_water_golden_hay_beast_heart": 350,
        "arx:rounded_bottle_water_golden_hay_beast_heart_dragon_pion": 350,
        "arx:rounded_bottle_water_golden_hay_bone": 350,
        "arx:rounded_bottle_water_golden_hay_bone_dragon_pion": 350,
        "arx:rounded_bottle_water_golden_hay_brain": 350,
        "arx:rounded_bottle_water_golden_hay_claws": 350,
        "arx:rounded_bottle_water_golden_hay_claws_jackal_grass": 350,
        "arx:rounded_bottle_water_golden_hay_fang": 350,
        "arx:rounded_bottle_water_golden_hay_fang_dragon_pion": 350,
        "arx:rounded_bottle_water_golden_hay_feather": 350,
        "arx:rounded_bottle_water_golden_hay_feather_dragon_pion": 350,
        "arx:rounded_bottle_water_golden_hay_hoof": 350,
        "arx:rounded_bottle_water_golden_hay_hoof_dragon_pion": 350,
        "arx:rounded_bottle_water_golden_hay_kari": 350,
        "arx:rounded_bottle_water_golden_hay_kavra": 350,
        "arx:rounded_bottle_water_golden_hay_kavra_dragon_pion": 350,
        "arx:rounded_bottle_water_golden_hay_liver": 350,
        "arx:rounded_bottle_water_golden_hay_liver_dragon_pion": 350,
        "arx:rounded_bottle_water_golden_hay_liver_dragon_pion_dragon_pion": 350,
        "arx:rounded_bottle_water_golden_hay_liver_dragon_pion_dragon_pion_dragon_pion": 350,
        "arx:rounded_bottle_water_golden_hay_monster_eye": 350,
        "arx:rounded_bottle_water_golden_hay_mp_flower": 350,
        "arx:rounded_bottle_water_golden_hay_mp_flower_dragon_pion": 350,
        "arx:rounded_bottle_water_golden_hay_snowflower": 350,
        "arx:rounded_bottle_water_golden_hay_snowflower_jackal_grass": 350,
        "arx:rounded_bottle_water_golden_hay_squama": 350,
        "arx:rounded_bottle_water_golden_hay_yuan": 350,
        "arx:triangle_bottle_water": 0,
        "arx:triangle_bottle_water_karelo": 350,
        "arx:triangle_bottle_water_karelo_fioletic": 350,
        "arx:fioletic_dose": 350,
    }

    // Мы определяем, какой тип у нашей еды и какая вкусность
    if (Object.keys(meatFood).includes(foodname)) { foodType = 'meat'; foodTaste = meatFood[foodname] }
    if (Object.keys(fishFood).includes(foodname)) { foodType = 'fish'; foodTaste = fishFood[foodname] }
    if (Object.keys(breadFood).includes(foodname)) { foodType = 'bread'; foodTaste = breadFood[foodname] }
    if (Object.keys(dairyFood).includes(foodname)) { foodType = 'dairy'; foodTaste = dairyFood[foodname] }
    if (Object.keys(herbalFood).includes(foodname)) { foodType = 'herbal'; foodTaste = herbalFood[foodname] }
    if (Object.keys(sweetFood).includes(foodname)) { foodType = 'sweets'; foodTaste = sweetFood[foodname] }

    if (Object.keys(potions).includes(foodname)) { foodType = 'potion'; const poisoning = potions[foodname] }

    // Проводим особые операции, если это требуется

    switch (foodname) {
        // Еда
        case "arx:iron_pie": {
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cВ пирожке что-то острое!" } ] }`)
            player.runCommand(`effect @s fatal_poison infinite 255 true`)
            break
        }
        case "arx:fiolix": {
            iDP(player, 'FiolixNarcoticPower', 1800)
            break
        }
        case "arx:le_fishe_au_chocolat": {
            player.runCommand(`playsound le_fishe_au_chocolat @s ~ ~ ~ 0.5`)
            iDP(player, 'eatenLeFisheCounter')
            break
        }

        // Пиво
        case "arx:beer_bottle_solod": {
            player.runCommand(`effect @s regeneration 5 0 true`)
            player.runCommand(`effect @s nausea 7 0 true`)
            iDP(player, 'stress', -500)
            break
        }
        case "arx:beer_bottle_solod_kari": {
            player.runCommand(`effect @s regeneration 10 0 true`)
            player.runCommand(`effect @s nausea 5 0 true`)
            iDP(player, 'stress', -500)
            break
        }
        case "arx:beer_bottle_solod_kari_substractor": {
            player.runCommand(`effect @s regeneration 15 0 true`)
            iDP(player, 'stress', -500)
            break
        }
        case "arx:beer_bottle_solod_salt": {
            player.runCommand(`effect @s regeneration 8 0 true`)
            iDP(player, 'stress', -500)
            break
        }
        case "arx:beer_bottle_solod_solod": {
            player.runCommand(`effect @s regeneration 5 0 true`)
            player.runCommand(`effect @s nausea 5 0 true`)
            player.runCommand(`effect @s haste 10 0 true`)
            iDP(player, 'stress', -500)
            break
        }
        case "arx:beer_bottle_solod_solod_substractor": {
            player.runCommand(`effect @s regeneration 10 0 true`)
            player.runCommand(`effect @s haste 30 0 true`)
            iDP(player, 'stress', -500)
            break
        }

        // Обычные бутылки
        case "arx:default_bottle_sugar": {
            player.runCommand(`effect @s nausea 30 0 true`)
            player.runCommand(`damage @s 2 magic`)
            break
        }
        case "arx:vodka": {
            player.runCommand(`effect @s nausea 10 0 true`)
            player.runCommand(`effect @s night_vision 15 0 true`)
            break
        }
        case "arx:vodka_apple": {
            player.runCommand(`effect @s nausea 8 0 true`)
            iDP(player, 'stress', -1000)
            break
        }
        case "arx:vodka_cactus": {
            player.runCommand(`effect @s nausea 8 0 true`)
            iDP(player, 'stress', -1000)
            break
        }
        case "arx:vodka_fiolix": {
            player.runCommand(`effect @s nausea 8 0 true`)
            iDP(player, 'stress', -1000)
            break
        }
        case "arx:vodka_light_berries": {
            player.runCommand(`effect @s nausea 8 0 true`)
            iDP(player, 'stress', -1000)
            break
        }
        case "arx:vodka_mushroom": {
            player.runCommand(`effect @s nausea 8 0 true`)
            iDP(player, 'stress', -1000)
            break
        }
        case "arx:vodka_sweet_berrie": {
            player.runCommand(`effect @s nausea 8 0 true`)
            iDP(player, 'stress', -1000)
            break
        }
        case "arx:wine": {
            player.runCommand(`effect @s regeneration 8 1 true`)
            iDP(player, 'stress', -1000)
            break
        }

        // Бутыки тора
        case "arx:hole_bottle_mp_potion": {
            iDP(player, 'MPSmoothAccrue', 20)
            break
        }
        case "arx:hole_bottle_mp_potion_royal_sorrel": {
            if (player.getDynamicProperty('MPPermanentBonus') < 5) {
                iDP(player, 'MPPermanentBonus', 1)
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aМаксимальная мана §d+1§a!" } ] }`)
            }
            else {
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cВы уже очень мощны, и это зелье не вас усилит." } ] }`)
            }
            break
        }
        // Вертикальные бутылки
        case "arx:long_bottle_blood_karelo_evergreen_dream": {
            acquireTrait(player, [0, 1, 0])
            break
        }
        case "arx:long_bottle_blood_karelo_evergreen_dream_dragon_pion": {
            acquireTrait(player, [1, 0, 0])
            break
        }
        case "arx:long_bottle_blood_karelo_evergreen_dream_jackal_grass": {
            acquireTrait(player, [0, 0, 1])
            break
        }
        // Круглые бутылки
        case "arx:rounded_bottle_water_fiuli_kari": {
            iDP(player, 'stress', 3000)
            break
        }
        case "arx:rounded_bottle_water_fiuli_night_kosk": {
            player.runCommand(`effect @s blindness 60 0 true`)
            break
        }
        case "arx:rounded_bottle_water_fiuli_night_kosk_dragon_pion": {
            player.runCommand(`effect @s blindness 300 0 true`)
            break
        }
        case "arx:rounded_bottle_water_fiuli_yuan": {
            player.runCommand(`effect @s hunger 20 0 true`)
            if (player.getDynamicProperty('saturation') > 60) {
                iDP(player, 'saturation', -60)
            } else {
                ssDP(player, 'saturation', 0)
            }
            break
        }
        case "arx:rounded_bottle_water_golden_hay_animal_eye": {
            player.runCommand(`effect @s night_vision 30 0 true`)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_animal_eye_day_kosk": {
            ssDP(player, 'noRainFog', 300)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_animal_eye_night_kosk": {
            ssDP(player, 'noNightFog', 300)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_animal_eye_night_kosk_dragon_pion": {
            player.runCommand(`effect @s darkness 30 0 true`)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_beast_heart": {
            player.runCommand(`effect @s fire_resistance 30 0 true`)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_beast_heart_dragon_pion": {
            player.runCommand(`effect @s fire_resistance 120 0 true`)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_bone": {
            ssDP(player, 'jumpBoostByPotion', 60)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_bone_dragon_pion": {
            ssDP(player, 'jumpBoostByPotion', 300)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_brain": {
            ssDP(player, 'mpRegenBoostByPotion', 60)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_claws": {
            player.runCommand(`effect @s haste 60 0 true`)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_claws_jackal_grass": {
            player.runCommand(`effect @s mining_fatigue 60 0 true`)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_fang": {
            ssDP(player, 'weighLimitBonusByPotion', 120)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_fang_dragon_pion": {
            ssDP(player, 'weighLimitBonusByPotion', 480)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_feather": {
            player.runCommand(`effect @s slow_falling 2 0 true`)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_feather_dragon_pion": {
            player.runCommand(`effect @s levitation 1 3 true`)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_hoof": {
            ssDP(player, 'speedBonusByPotion', 60)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_hoof_dragon_pion": {
            ssDP(player, 'speedBonusByPotion', 300)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_kari": {
            iDP(player, 'stress', -1200)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_kavra": {
            player.runCommand(`effect @s regeneration 20 0 true`)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_kavra_dragon_pion": {
            player.runCommand(`effect @s regeneration 20 1 true`)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_liver": {
            ssDP(player, 'intitoxicationBonusByPotion100', 60)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_liver_dragon_pion": {
            ssDP(player, 'intitoxicationBonusByPotion100', 300)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_liver_dragon_pion_dragon_pion": {
            ssDP(player, 'intitoxicationBonusByPotion300', 60)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_liver_dragon_pion_dragon_pion_dragon_pion": {
            ssDP(player, 'intitoxicationBonusByPotion300', 300)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_monster_eye": {
            player.runCommand(`effect @s invisibility 10 0 true`)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_mp_flower": {
            ssDP(player, 'MPSmoothAccrue', 20)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_mp_flower_dragon_pion": {
            ssDP(player, 'MPSmoothAccrue', 80)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_snowflower": {
            ssDP(player, 'freezingBlockByPotion', 600)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_snowflower_jackal_grass": {
            ssDP(player, 'heatingBlockByPotion', 60)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_squama": {
            player.runCommand(`effect @s water_breathing 300 0 true`)
            break
        }
        case "arx:rounded_bottle_water_golden_hay_yuan": {
            ssDP(player, 'saturation', 1800)
            break
        }
        case "arx:fioletic_dose": {
            iDP(player, 'FiolixNarcoticPower', 600)
            break
        }
    }

    // Вычисляем полученное счастье, если тип еды не undefined и не potion. То есть мы едим еду, а не что-то ещё
    if (foodType !== undefined && foodType !== "potion") {
        if (player.getProperty('arx:is_ghost') == false) {
            // Обрабатываем подсказку
            if (player.getDynamicProperty('hasEverAteSomething') !== true) {
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "[§aГид§f] > §aЕда восстанавливает§f вам §dвсю сытость§f примерно на 5 минут.\n[§aГид§f] > §aЧем вкуснее еда§f, §aтем больше счастья§f и §aболее сильную регенерацию§f вы получите при съедании.\n" } ] }`)
            }
            ssDP(player, 'hasEverAteSomething', true)


            // Рассчет вкусности далее
            let happinessBonus = 0

            // Устанавливаем бонус счастья от нашего вкуса типа этой пищи
            if (foodType === 'meat') { playerTaste_meat > 0 ? happinessBonus = playerTaste_meat * meatFood[foodname] : happinessBonus = playerTaste_meat * 20 }
            if (foodType === 'fish') { playerTaste_fish > 0 ? happinessBonus = playerTaste_fish * fishFood[foodname] : happinessBonus = playerTaste_fish * 20 }
            if (foodType === 'bread') { playerTaste_bread > 0 ? happinessBonus = playerTaste_bread * breadFood[foodname] : happinessBonus = playerTaste_bread * 20 }
            if (foodType === 'dairy') { playerTaste_dairy > 0 ? happinessBonus = playerTaste_dairy * dairyFood[foodname] : happinessBonus = playerTaste_dairy * 20 }
            if (foodType === 'herbal') { playerTaste_herbal > 0 ? happinessBonus = playerTaste_herbal * herbalFood[foodname] : happinessBonus = playerTaste_herbal * 20 }
            if (foodType === 'sweets') { playerTaste_sweet > 0 ? happinessBonus = playerTaste_sweet * sweetFood[foodname] : happinessBonus = playerTaste_sweet * 20 }

            // Домножаем для того, чтобы значение было нормальным
            happinessBonus *= 0.5

            // Если мы ещё не проголодались
            if (player.getDynamicProperty('saturation') > 1) {
                if (happinessBonus > 0) { happinessBonus = 0 }
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cВы слишком сыты, чтобы получить удовольстве от еды." } ] }`)
            }
            // Если мы проголодались
            else {
                // Добавляем случайное значение к получаемому счастью
                // happinessBonus += (Math.random() - 0.5) * 500

                // Регенерируем
                const regenLevel = Math.floor(happinessBonus / 1000)

                if (regenLevel === NaN) {
                    console.warn(`Получено NaN значение для regenLevel при съедании еды. Еда ${foodname}, игрок ${player.name}`)
                } else {
                    player.runCommand(`effect @s regeneration 10 ${regenLevel} true`)
                }
            }

            // Сообщаем пользователю о вкусах
            let messageStart
            let messageColor
            if (happinessBonus < -500) { messageStart = 'Невкусно!'; messageColor = "§c" }
            else if (happinessBonus > 500) { messageStart = 'Вкусно!'; messageColor = "§a" }
            else { messageStart = 'Нормально.'; messageColor = "§e" }

            player.runCommand(`tellraw @s { "rawtext": [ { "text": "${messageColor}${messageStart}§f Бонус счастья ${messageColor}${(happinessBonus / 1000).toFixed(1)}§f." } ] }`)

            ssDP(player, 'saturation', 360)

            // Выдаем счастье
            iDP(player, 'stress', -happinessBonus)
        } else {
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cВам безразлична еда." } ] }`)
        }
    }
    // Мы выпили зелье. Надо накинуть отравление
    else if (foodType === "potion") {
        if (foodname in potions) {
            iDP(player, 'intoxication', potions[foodname])
        }
        else {
            console.warn(`Съета еда ${foodname}, подразумевается, что это зелье, но оно не найдено в списке зелий в onConsume`)
        }
    }
    // Проблема с едой
    else if (foodType === undefined) {
        console.warn(`Съедена еда ${foodname}, которая не идентефицирована в списке еды.`)
    }
}