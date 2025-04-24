# Это функция анализа достижений. Автозапуск каждые 20tcs (1 сек) функцией 20ticks.mcfunction

    # Космоса
        scoreboard players add @a ach_in_space 0
        scoreboard players add @a[tag=in_space, scores={ach_in_space=0}] ach_in_space 1
        tellraw @a[scores={ach_in_space=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rКосмоса" } ] }
        execute as @a[scores={ach_in_space=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_in_space=1}] ach_in_space 99

    # Камень кирка палладий
        scoreboard players add @a ach_in_hot_mines 0
        scoreboard players add @a[tag=in_hot_deep, tag=!at_respawn_room, scores={ach_in_hot_mines=0}] ach_in_hot_mines 1
        tellraw @a[scores={ach_in_hot_mines=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rКамень кирка палладий" } ] }
        execute as @a[scores={ach_in_hot_mines=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_in_hot_mines=1}] ach_in_hot_mines 99

    # Отморозок
        scoreboard players add @a ach_coldy 0
        scoreboard players add @a[scores={freezing=1000.., ach_coldy=0}] ach_coldy 1
        tellraw @a[scores={ach_coldy=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rОтморозок" } ] }
        execute as @a[scores={ach_coldy=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_coldy=1}] ach_coldy 99

    # Самая горячая~
        scoreboard players add @a ach_warm 0
        scoreboard players add @a[scores={freezing=..-1000, ach_warm=0}] ach_warm 1
        tellraw @a[scores={ach_warm=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rСамая горячая~" } ] }
        execute as @a[scores={ach_warm=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_warm=1}] ach_warm 99

    # Добро пожаловать в Аркс
        scoreboard players add @a ach_die 0
        scoreboard players add @a[scores={count_death=1.., ach_die=0}] ach_die 1
        tellraw @a[scores={ach_die=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rДобро пожаловать в Аркс" } ] }
        execute as @a[scores={ach_die=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_die=1}] ach_die 99

    # Майнкрафт по-новому
        scoreboard players add @a ach_has_crafting_table 0
        scoreboard players add @a[hasitem={item=arx:crafting_table}, scores={ach_has_crafting_table=0}] ach_has_crafting_table 1
        tellraw @a[scores={ach_has_crafting_table=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rМайнкрафт по-новому" } ] }
        execute as @a[scores={ach_has_crafting_table=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_crafting_table=1}] ach_has_crafting_table 99

    # Путь мага
        scoreboard players add @a ach_has_rune_crafting_table 0
        scoreboard players add @a[hasitem={item=arx:rune_crafting_table}, scores={ach_has_rune_crafting_table=0}] ach_has_rune_crafting_table 1
        tellraw @a[scores={ach_has_rune_crafting_table=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rПуть мага" } ] }
        execute as @a[scores={ach_has_rune_crafting_table=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_rune_crafting_table=1}] ach_has_rune_crafting_table 99

    # Путь ведьмы
        scoreboard players add @a ach_has_boiler_crafting_table 0
        scoreboard players add @a[hasitem={item=arx:boiler_crafting_table}, scores={ach_has_boiler_crafting_table=0}] ach_has_boiler_crafting_table 1
        tellraw @a[scores={ach_has_boiler_crafting_table=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rПуть ведьмы" } ] }
        execute as @a[scores={ach_has_boiler_crafting_table=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_boiler_crafting_table=1}] ach_has_boiler_crafting_table 99

    # Отжарка по полной
        scoreboard players add @a ach_has_thermal_cooking_crafting_table 0
        scoreboard players add @a[hasitem={item=arx:thermal_cooking_crafting_table}, scores={ach_has_thermal_cooking_crafting_table=0}] ach_has_thermal_cooking_crafting_table 1
        tellraw @a[scores={ach_has_thermal_cooking_crafting_table=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rОтжарка по полной" } ] }
        execute as @a[scores={ach_has_thermal_cooking_crafting_table=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_thermal_cooking_crafting_table=1}] ach_has_thermal_cooking_crafting_table 99

    # Белиссимо
        scoreboard players add @a ach_has_cooking_crafting_table 0
        scoreboard players add @a[hasitem={item=arx:cooking_crafting_table}, scores={ach_has_cooking_crafting_table=0}] ach_has_cooking_crafting_table 1
        tellraw @a[scores={ach_has_cooking_crafting_table=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rБелиссимо" } ] }
        execute as @a[scores={ach_has_cooking_crafting_table=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_cooking_crafting_table=1}] ach_has_cooking_crafting_table 99

    # Нахимичим?
        scoreboard players add @a ach_has_alchemy_crafting_table 0
        scoreboard players add @a[hasitem={item=arx:alchemy_crafting_table}, scores={ach_has_alchemy_crafting_table=0}] ach_has_alchemy_crafting_table 1
        tellraw @a[scores={ach_has_alchemy_crafting_table=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rНахимичим?" } ] }
        execute as @a[scores={ach_has_alchemy_crafting_table=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_alchemy_crafting_table=1}] ach_has_alchemy_crafting_table 99

    # Как в старые добрые
        scoreboard players add @a ach_has_diamond 0
        scoreboard players add @a[hasitem={item=minecraft:diamond}, scores={ach_has_diamond=0}] ach_has_diamond 1
        tellraw @a[scores={ach_has_diamond=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rКак в старые добрые" } ] }
        execute as @a[scores={ach_has_diamond=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_diamond=1}] ach_has_diamond 99

    # Дурак
        scoreboard players add @a ach_has_fool_potion 0
        scoreboard players add @a[hasitem={item=arx:long_bottle_blood_karelo_evergreen_dream_jackal_grass}, scores={ach_has_fool_potion=0}] ach_has_fool_potion 1
        tellraw @a[scores={ach_has_fool_potion=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rДурак" } ] }
        execute as @a[scores={ach_has_fool_potion=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_fool_potion=1}] ach_has_fool_potion 99

    # Загадочный бутон
        scoreboard players add @a ach_has_evergreen_dream 0
        scoreboard players add @a[hasitem={item=arx:evergreen_dream}, scores={ach_has_evergreen_dream=0}] ach_has_evergreen_dream 1
        tellraw @a[scores={ach_has_evergreen_dream=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЗагадочный бутон" } ] }
        execute as @a[scores={ach_has_evergreen_dream=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_evergreen_dream=1}] ach_has_evergreen_dream 99

    # Царская находка
        scoreboard players add @a ach_has_royal_sorrel 0
        scoreboard players add @a[hasitem={item=arx:royal_sorrel}, scores={ach_has_royal_sorrel=0}] ach_has_royal_sorrel 1
        tellraw @a[scores={ach_has_royal_sorrel=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЦарская находка" } ] }
        execute as @a[scores={ach_has_royal_sorrel=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_royal_sorrel=1}] ach_has_royal_sorrel 99

    # Блестящая метель
        scoreboard players add @a ach_has_ice_iris 0
        scoreboard players add @a[hasitem={item=arx:ice_iris}, scores={ach_has_ice_iris=0}] ach_has_ice_iris 1
        tellraw @a[scores={ach_has_ice_iris=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rБлестящая метель" } ] }
        execute as @a[scores={ach_has_ice_iris=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_ice_iris=1}] ach_has_ice_iris 99

    # Воплощение пепла
        scoreboard players add @a ach_has_ash_lavaflower 0
        scoreboard players add @a[hasitem={item=arx:ash_lavaflower}, scores={ach_has_ash_lavaflower=0}] ach_has_ash_lavaflower 1
        tellraw @a[scores={ach_has_ash_lavaflower=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rВоплощение пепла" } ] }
        execute as @a[scores={ach_has_ash_lavaflower=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_ash_lavaflower=1}] ach_has_ash_lavaflower 99

    # Бледный блеск
        scoreboard players add @a ach_has_aluminum_ingot 0
        scoreboard players add @a[hasitem={item=arx:aluminum_ingot}, scores={ach_has_aluminum_ingot=0}] ach_has_aluminum_ingot 1
        tellraw @a[scores={ach_has_aluminum_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rБледный блеск" } ] }
        execute as @a[scores={ach_has_aluminum_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_aluminum_ingot=1}] ach_has_aluminum_ingot 99

    # Время обновить кирку!
        scoreboard players add @a ach_has_tin_ingot 0
        scoreboard players add @a[hasitem={item=arx:tin_ingot}, scores={ach_has_tin_ingot=0}] ach_has_tin_ingot 1
        tellraw @a[scores={ach_has_tin_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rВремя обновить кирку!" } ] }
        execute as @a[scores={ach_has_tin_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_tin_ingot=1}] ach_has_tin_ingot 99

    # Жесть...
        scoreboard players add @a ach_has_iron_ingot 0
        scoreboard players add @a[hasitem={item=minecraft:iron_ingot}, scores={ach_has_iron_ingot=0}] ach_has_iron_ingot 1
        tellraw @a[scores={ach_has_iron_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЖесть..." } ] }
        execute as @a[scores={ach_has_iron_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_iron_ingot=1}] ach_has_iron_ingot 99

    # Из чего оно делается!?
        scoreboard players add @a ach_has_riolik_ingot 0
        scoreboard players add @a[hasitem={item=arx:riolik_ingot}, scores={ach_has_riolik_ingot=0}] ach_has_riolik_ingot 1
        tellraw @a[scores={ach_has_riolik_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rИз чего оно делается!?" } ] }
        execute as @a[scores={ach_has_riolik_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_riolik_ingot=1}] ach_has_riolik_ingot 99

    # Ледяной блеск
        scoreboard players add @a ach_has_altaite_ingot 0
        scoreboard players add @a[hasitem={item=arx:altaite_ingot}, scores={ach_has_altaite_ingot=0}] ach_has_altaite_ingot 1
        tellraw @a[scores={ach_has_altaite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЛедяной блеск" } ] }
        execute as @a[scores={ach_has_altaite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_altaite_ingot=1}] ach_has_altaite_ingot 99

    # Синее сиянее
        scoreboard players add @a ach_has_caryite_ingot 0
        scoreboard players add @a[hasitem={item=arx:caryite_ingot}, scores={ach_has_caryite_ingot=0}] ach_has_caryite_ingot 1
        tellraw @a[scores={ach_has_caryite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rСинее сиянее" } ] }
        execute as @a[scores={ach_has_caryite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_caryite_ingot=1}] ach_has_caryite_ingot 99

    # Зелёная смерть
        scoreboard players add @a ach_has_chloronite_ingot 0
        scoreboard players add @a[hasitem={item=arx:chloronite_ingot}, scores={ach_has_chloronite_ingot=0}] ach_has_chloronite_ingot 1
        tellraw @a[scores={ach_has_chloronite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЗелёная смерть" } ] }
        execute as @a[scores={ach_has_chloronite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_chloronite_ingot=1}] ach_has_chloronite_ingot 99

    # Прочность солнца
        scoreboard players add @a ach_has_dorionite_ingot 0
        scoreboard players add @a[hasitem={item=arx:dorionite_ingot}, scores={ach_has_dorionite_ingot=0}] ach_has_dorionite_ingot 1
        tellraw @a[scores={ach_has_dorionite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rПрочность солнца" } ] }
        execute as @a[scores={ach_has_dorionite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_dorionite_ingot=1}] ach_has_dorionite_ingot 99

    # Загадочная мощь
        scoreboard players add @a ach_has_draphorite_ingot 0
        scoreboard players add @a[hasitem={item=arx:draphorite_ingot}, scores={ach_has_draphorite_ingot=0}] ach_has_draphorite_ingot 1
        tellraw @a[scores={ach_has_draphorite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЗагадочная мощь" } ] }
        execute as @a[scores={ach_has_draphorite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_draphorite_ingot=1}] ach_has_draphorite_ingot 99

    # Звёздный слиток
        scoreboard players add @a ach_has_forfactorite_ingot 0
        scoreboard players add @a[hasitem={item=arx:forfactorite_ingot}, scores={ach_has_forfactorite_ingot=0}] ach_has_forfactorite_ingot 1
        tellraw @a[scores={ach_has_forfactorite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЗвёздный слиток" } ] }
        execute as @a[scores={ach_has_forfactorite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_forfactorite_ingot=1}] ach_has_forfactorite_ingot 99

    # Фиолетовое сокровище
        scoreboard players add @a ach_has_lamenite_ingot 0
        scoreboard players add @a[hasitem={item=arx:lamenite_ingot}, scores={ach_has_lamenite_ingot=0}] ach_has_lamenite_ingot 1
        tellraw @a[scores={ach_has_lamenite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rФиолетовое сокровище" } ] }
        execute as @a[scores={ach_has_lamenite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_lamenite_ingot=1}] ach_has_lamenite_ingot 99

    # Тёмный слиток
        scoreboard players add @a ach_has_naginitis_ingot 0
        scoreboard players add @a[hasitem={item=arx:naginitis_ingot}, scores={ach_has_naginitis_ingot=0}] ach_has_naginitis_ingot 1
        tellraw @a[scores={ach_has_naginitis_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rТёмный слиток" } ] }
        execute as @a[scores={ach_has_naginitis_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_naginitis_ingot=1}] ach_has_naginitis_ingot 99

    # Адский блеск
        scoreboard players add @a ach_has_malafiotironite_ingot 0
        scoreboard players add @a[hasitem={item=arx:malafiotironite_ingot}, scores={ach_has_malafiotironite_ingot=0}] ach_has_malafiotironite_ingot 1
        tellraw @a[scores={ach_has_malafiotironite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rАдский блеск" } ] }
        execute as @a[scores={ach_has_malafiotironite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_malafiotironite_ingot=1}] ach_has_malafiotironite_ingot 99

    # Адский арбитр
        scoreboard players add @a ach_has_toliriite_ingot 0
        scoreboard players add @a[hasitem={item=arx:toliriite_ingot}, scores={ach_has_toliriite_ingot=0}] ach_has_toliriite_ingot 1
        tellraw @a[scores={ach_has_toliriite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rАдский арбитр" } ] }
        execute as @a[scores={ach_has_toliriite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_toliriite_ingot=1}] ach_has_toliriite_ingot 99

    # Начало шахтёра
        scoreboard players add @a ach_has_wooden_pickaxe 0
        scoreboard players add @a[hasitem={item=minecraft:wooden_pickaxe}, scores={ach_has_wooden_pickaxe=0}] ach_has_wooden_pickaxe 1
        tellraw @a[scores={ach_has_wooden_pickaxe=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rНачало шахтёра" } ] }
        execute as @a[scores={ach_has_wooden_pickaxe=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_wooden_pickaxe=1}] ach_has_wooden_pickaxe 99

    # Металлический стук
        scoreboard players add @a ach_has_stone_pickaxe 0
        scoreboard players add @a[hasitem={item=minecraft:stone_pickaxe}, scores={ach_has_stone_pickaxe=0}] ach_has_stone_pickaxe 1
        tellraw @a[scores={ach_has_stone_pickaxe=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rМеталлический стук" } ] }
        execute as @a[scores={ach_has_stone_pickaxe=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_stone_pickaxe=1}] ach_has_stone_pickaxe 99

    # Уровень профи
        scoreboard players add @a ach_has_iron_pickaxe 0
        scoreboard players add @a[hasitem={item=minecraft:iron_pickaxe}, scores={ach_has_iron_pickaxe=0}] ach_has_iron_pickaxe 1
        tellraw @a[scores={ach_has_iron_pickaxe=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rУровень профи" } ] }
        execute as @a[scores={ach_has_iron_pickaxe=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_iron_pickaxe=1}] ach_has_iron_pickaxe 99

    # Синие искры
        scoreboard players add @a ach_has_diamond_pickaxe 0
        scoreboard players add @a[hasitem={item=minecraft:diamond_pickaxe}, scores={ach_has_diamond_pickaxe=0}] ach_has_diamond_pickaxe 1
        tellraw @a[scores={ach_has_diamond_pickaxe=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rСиние искры" } ] }
        execute as @a[scores={ach_has_diamond_pickaxe=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_diamond_pickaxe=1}] ach_has_diamond_pickaxe 99

    # Мощь, достойная богов
        scoreboard players add @a ach_has_netherite_pickaxe 0
        scoreboard players add @a[hasitem={item=minecraft:netherite_pickaxe}, scores={ach_has_netherite_pickaxe=0}] ach_has_netherite_pickaxe 1
        tellraw @a[scores={ach_has_netherite_pickaxe=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rМощь, достойная богов" } ] }
        execute as @a[scores={ach_has_netherite_pickaxe=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_netherite_pickaxe=1}] ach_has_netherite_pickaxe 99

    # Воплощение пустыни
        scoreboard players add @a ach_kill_sand_elemental 0
        # External trigger
        tellraw @a[scores={ach_kill_sand_elemental=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rВоплощение пустыни" } ] }
        execute as @a[scores={ach_kill_sand_elemental=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_kill_sand_elemental=1}] ach_kill_sand_elemental 99

    # Мир стал безопаснее
        scoreboard players add @a ach_kill_rat_monster 0
        # External trigger
        tellraw @a[scores={ach_kill_rat_monster=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rМир стал безопаснее" } ] }
        execute as @a[scores={ach_kill_rat_monster=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_kill_rat_monster=1}] ach_kill_rat_monster 99

    # Прощай, дедуля
        scoreboard players add @a ach_kill_swamp_monster 0
        # External trigger
        tellraw @a[scores={ach_kill_swamp_monster=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rПрощай, дедуля" } ] }
        execute as @a[scores={ach_kill_swamp_monster=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_kill_swamp_monster=1}] ach_kill_swamp_monster 99

    # Оно умеет говорить?
        scoreboard players add @a ach_kill_snow_lady 0
        # External trigger
        tellraw @a[scores={ach_kill_snow_lady=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rОно умеет говорить?" } ] }
        execute as @a[scores={ach_kill_snow_lady=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_kill_snow_lady=1}] ach_kill_snow_lady 99

    # Первая кровь
        scoreboard players add @a ach_1_kills 0
        scoreboard players add @a[scores={count_mob_kills=1.., ach_1_kills=0}] ach_1_kills 1
        tellraw @a[scores={ach_1_kills=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rПервая кровь" } ] }
        execute as @a[scores={ach_1_kills=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_1_kills=1}] ach_1_kills 99

    # Охотник
        scoreboard players add @a ach_10_kills 0
        scoreboard players add @a[scores={count_mob_kills=10.., ach_10_kills=0}] ach_10_kills 1
        tellraw @a[scores={ach_10_kills=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rОхотник" } ] }
        execute as @a[scores={ach_10_kills=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_10_kills=1}] ach_10_kills 99

    # Истребитель
        scoreboard players add @a ach_100_kills 0
        scoreboard players add @a[scores={count_mob_kills=100.., ach_100_kills=0}] ach_100_kills 1
        tellraw @a[scores={ach_100_kills=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rИстребитель" } ] }
        execute as @a[scores={ach_100_kills=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_100_kills=1}] ach_100_kills 99

    # Ху Тао
        scoreboard players add @a ach_1000_kills 0
        scoreboard players add @a[scores={count_mob_kills=1000.., ach_1000_kills=0}] ach_1000_kills 1
        tellraw @a[scores={ach_1000_kills=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rХу Тао" } ] }
        execute as @a[scores={ach_1000_kills=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_1000_kills=1}] ach_1000_kills 99

    # Правая рука Смерти
        scoreboard players add @a ach_10000_kills 0
        scoreboard players add @a[scores={count_mob_kills=10000.., ach_10000_kills=0}] ach_10000_kills 1
        tellraw @a[scores={ach_10000_kills=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rПравая рука Смерти" } ] }
        execute as @a[scores={ach_10000_kills=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_10000_kills=1}] ach_10000_kills 99

