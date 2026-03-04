// Key - potion, value - posioning 
// Potions, alcohol, etc.
export const potionsRegistry = {
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

export function onPotionConsume(player, itemStack) {
    // Проводим особые операции, если это требуется
    switch (foodId) {

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
                sl(player, 'food.permanent_mp_potion.successful')
            }
            else {
                sl(player, 'food.permanent_mp_potion.max_already_reached')
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
}