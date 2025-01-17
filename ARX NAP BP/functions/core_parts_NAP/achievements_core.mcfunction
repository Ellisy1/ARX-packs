# Это функция анализа достижений. Автозапуск каждые 20tcs (1 сек) функцией 20ticks.mcfunction

    # Космоса
        scoreboard players add @a ach_in_space 0
        scoreboard players add @a[tag=in_space, scores={ach_in_space=0}] ach_in_space 1
        tellraw @a[scores={ach_in_space=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rКосмоса (Подняться в космос)!" } ] }
        scoreboard players add @a[scores={ach_in_space=1}] xp_tray 800
        execute as @a[scores={ach_in_space=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_in_space=1}] ach_in_space 99

    # Камень кирка палладий
        scoreboard players add @a ach_in_hot_mines 0
        scoreboard players add @a[tag=in_hot_deep, tag=!at_respawn_room, scores={ach_in_hot_mines=0}] ach_in_hot_mines 1
        tellraw @a[scores={ach_in_hot_mines=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rКамень кирка палладий (Спуститься в нижние пещеры)!" } ] }
        scoreboard players add @a[scores={ach_in_hot_mines=1}] xp_tray 600
        execute as @a[scores={ach_in_hot_mines=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_in_hot_mines=1}] ach_in_hot_mines 99

    # Отморозок
        scoreboard players add @a ach_coldy 0
        scoreboard players add @a[scores={freezing=1000.., ach_coldy=0}] ach_coldy 1
        tellraw @a[scores={ach_coldy=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rОтморозок (Обморозиться до критического уровня)!" } ] }
        scoreboard players add @a[scores={ach_coldy=1}] xp_tray 250
        execute as @a[scores={ach_coldy=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_coldy=1}] ach_coldy 99

    # Самая горячая~
        scoreboard players add @a ach_warm 0
        scoreboard players add @a[scores={freezing=..-1000, ach_warm=0}] ach_warm 1
        tellraw @a[scores={ach_warm=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rСамая горячая~ (Перегресться до критического уровня)!" } ] }
        scoreboard players add @a[scores={ach_warm=1}] xp_tray 250
        execute as @a[scores={ach_warm=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_warm=1}] ach_warm 99

    # Добро пожаловать в Аркс
        scoreboard players add @a ach_die 0
        scoreboard players add @a[scores={count_death=1.., ach_die=0}] ach_die 1
        tellraw @a[scores={ach_die=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rДобро пожаловать в Аркс (Умереть)!" } ] }
        scoreboard players add @a[scores={ach_die=1}] xp_tray 100
        execute as @a[scores={ach_die=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_die=1}] ach_die 99

    # Три дороги
        scoreboard players add @a ach_three_roads 0
        # External trigger
        tellraw @a[scores={ach_three_roads=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rТри дороги (Впервые потратить очко обучения)!" } ] }
        scoreboard players add @a[scores={ach_three_roads=1}] xp_tray 300
        execute as @a[scores={ach_three_roads=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_three_roads=1}] ach_three_roads 99

    # Начало пути
        scoreboard players add @a ach_1k_blocks_walked 0
        scoreboard players add @a[scores={count_distance=1000.., ach_1k_blocks_walked=0}] ach_1k_blocks_walked 1
        tellraw @a[scores={ach_1k_blocks_walked=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rНачало пути (Пройти 1к блоков)!" } ] }
        scoreboard players add @a[scores={ach_1k_blocks_walked=1}] xp_tray 100
        execute as @a[scores={ach_1k_blocks_walked=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_1k_blocks_walked=1}] ach_1k_blocks_walked 99

    # Походник
        scoreboard players add @a ach_10k_blocks_walked 0
        scoreboard players add @a[scores={count_distance=10000.., ach_10k_blocks_walked=0}] ach_10k_blocks_walked 1
        tellraw @a[scores={ach_10k_blocks_walked=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rПоходник (Пройти 10к блоков)!" } ] }
        scoreboard players add @a[scores={ach_10k_blocks_walked=1}] xp_tray 500
        execute as @a[scores={ach_10k_blocks_walked=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_10k_blocks_walked=1}] ach_10k_blocks_walked 99

    # Опытный путешественник
        scoreboard players add @a ach_100k_blocks_walked 0
        scoreboard players add @a[scores={count_distance=100000.., ach_100k_blocks_walked=0}] ach_100k_blocks_walked 1
        tellraw @a[scores={ach_100k_blocks_walked=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rОпытный путешественник (Пройти 100к блоков)!" } ] }
        scoreboard players add @a[scores={ach_100k_blocks_walked=1}] xp_tray 1200
        execute as @a[scores={ach_100k_blocks_walked=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_100k_blocks_walked=1}] ach_100k_blocks_walked 99

    # Кругосветное путешествие
        scoreboard players add @a ach_1m_blocks_walked 0
        scoreboard players add @a[scores={count_distance=1000000.., ach_1m_blocks_walked=0}] ach_1m_blocks_walked 1
        tellraw @a[scores={ach_1m_blocks_walked=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rКругосветное путешествие (Пройти 1 миллион блоков)!" } ] }
        scoreboard players add @a[scores={ach_1m_blocks_walked=1}] xp_tray 7000
        execute as @a[scores={ach_1m_blocks_walked=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_1m_blocks_walked=1}] ach_1m_blocks_walked 99

    # А таксую я так, для души
        scoreboard players add @a ach_10m_blocks_walked 0
        scoreboard players add @a[scores={count_distance=10000000.., ach_10m_blocks_walked=0}] ach_10m_blocks_walked 1
        tellraw @a[scores={ach_10m_blocks_walked=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rА таксую я так, для души (Пройти 10 миллионов блоков)!" } ] }
        scoreboard players add @a[scores={ach_10m_blocks_walked=1}] xp_tray 15000
        execute as @a[scores={ach_10m_blocks_walked=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_10m_blocks_walked=1}] ach_10m_blocks_walked 99

    # Как в старые добрые
        scoreboard players add @a ach_has_diamond 0
        scoreboard players add @a[hasitem={item=minecraft:diamond}, scores={ach_has_diamond=0}] ach_has_diamond 1
        tellraw @a[scores={ach_has_diamond=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rКак в старые добрые (Добыть алмаз)!" } ] }
        scoreboard players add @a[scores={ach_has_diamond=1}] xp_tray 100
        execute as @a[scores={ach_has_diamond=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_diamond=1}] ach_has_diamond 99

    # Дурак
        scoreboard players add @a ach_has_fool_potion 0
        scoreboard players add @a[hasitem={item=arx:long_bottle_blood_karelo_evergreen_dream_jackal_grass}, scores={ach_has_fool_potion=0}] ach_has_fool_potion 1
        tellraw @a[scores={ach_has_fool_potion=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rДурак (Получить зелье дурака)!" } ] }
        scoreboard players add @a[scores={ach_has_fool_potion=1}] xp_tray 2500
        execute as @a[scores={ach_has_fool_potion=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_fool_potion=1}] ach_has_fool_potion 99

    # Майнкрафт по-новому
        scoreboard players add @a ach_has_crafting_table 0
        scoreboard players add @a[hasitem={item=arx:crafting_table}, scores={ach_has_crafting_table=0}] ach_has_crafting_table 1
        tellraw @a[scores={ach_has_crafting_table=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rМайнкрафт по-новому (Создать верстак)!" } ] }
        scoreboard players add @a[scores={ach_has_crafting_table=1}] xp_tray 20
        execute as @a[scores={ach_has_crafting_table=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_crafting_table=1}] ach_has_crafting_table 99

    # Загадочный бутон
        scoreboard players add @a ach_has_evergreen_dream 0
        scoreboard players add @a[hasitem={item=arx:evergreen_dream}, scores={ach_has_evergreen_dream=0}] ach_has_evergreen_dream 1
        tellraw @a[scores={ach_has_evergreen_dream=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЗагадочный бутон (Найти вечнозеленый сон)!" } ] }
        scoreboard players add @a[scores={ach_has_evergreen_dream=1}] xp_tray 300
        execute as @a[scores={ach_has_evergreen_dream=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_evergreen_dream=1}] ach_has_evergreen_dream 99

    # Царская находка
        scoreboard players add @a ach_has_royal_sorrel 0
        scoreboard players add @a[hasitem={item=arx:royal_sorrel}, scores={ach_has_royal_sorrel=0}] ach_has_royal_sorrel 1
        tellraw @a[scores={ach_has_royal_sorrel=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЦарская находка (Найти царский щавель)!" } ] }
        scoreboard players add @a[scores={ach_has_royal_sorrel=1}] xp_tray 300
        execute as @a[scores={ach_has_royal_sorrel=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_royal_sorrel=1}] ach_has_royal_sorrel 99

    # Блестящая метель
        scoreboard players add @a ach_has_ice_iris 0
        scoreboard players add @a[hasitem={item=arx:ice_iris}, scores={ach_has_ice_iris=0}] ach_has_ice_iris 1
        tellraw @a[scores={ach_has_ice_iris=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rБлестящая метель (Найти снежный ирис)!" } ] }
        scoreboard players add @a[scores={ach_has_ice_iris=1}] xp_tray 300
        execute as @a[scores={ach_has_ice_iris=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_ice_iris=1}] ach_has_ice_iris 99

    # Воплощение пепла
        scoreboard players add @a ach_has_ash_lavaflower 0
        scoreboard players add @a[hasitem={item=arx:ash_lavaflower}, scores={ach_has_ash_lavaflower=0}] ach_has_ash_lavaflower 1
        tellraw @a[scores={ach_has_ash_lavaflower=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rВоплощение пепла (Найти пепельный лавоцвет)!" } ] }
        scoreboard players add @a[scores={ach_has_ash_lavaflower=1}] xp_tray 300
        execute as @a[scores={ach_has_ash_lavaflower=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_ash_lavaflower=1}] ach_has_ash_lavaflower 99

    # Бледный блеск
        scoreboard players add @a ach_has_aluminum_ingot 0
        scoreboard players add @a[hasitem={item=arx:aluminum_ingot}, scores={ach_has_aluminum_ingot=0}] ach_has_aluminum_ingot 1
        tellraw @a[scores={ach_has_aluminum_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rБледный блеск (Получить алюминиевый слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_aluminum_ingot=1}] xp_tray 50
        execute as @a[scores={ach_has_aluminum_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_aluminum_ingot=1}] ach_has_aluminum_ingot 99

    # Время обновить кирку!
        scoreboard players add @a ach_has_tin_ingot 0
        scoreboard players add @a[hasitem={item=arx:tin_ingot}, scores={ach_has_tin_ingot=0}] ach_has_tin_ingot 1
        tellraw @a[scores={ach_has_tin_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rВремя обновить кирку! (Получить оловянный слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_tin_ingot=1}] xp_tray 75
        execute as @a[scores={ach_has_tin_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_tin_ingot=1}] ach_has_tin_ingot 99

    # Жесть...
        scoreboard players add @a ach_has_iron_ingot 0
        scoreboard players add @a[hasitem={item=minecraft:iron_ingot}, scores={ach_has_iron_ingot=0}] ach_has_iron_ingot 1
        tellraw @a[scores={ach_has_iron_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЖесть... (Получить железный слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_iron_ingot=1}] xp_tray 100
        execute as @a[scores={ach_has_iron_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_iron_ingot=1}] ach_has_iron_ingot 99

    # Из чего оно делается!?
        scoreboard players add @a ach_has_riolik_ingot 0
        scoreboard players add @a[hasitem={item=arx:riolik_ingot}, scores={ach_has_riolik_ingot=0}] ach_has_riolik_ingot 1
        tellraw @a[scores={ach_has_riolik_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rИз чего оно делается!? (Получить риоликовый слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_riolik_ingot=1}] xp_tray 150
        execute as @a[scores={ach_has_riolik_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_riolik_ingot=1}] ach_has_riolik_ingot 99

    # Ледяной блеск
        scoreboard players add @a ach_has_altaite_ingot 0
        scoreboard players add @a[hasitem={item=arx:altaite_ingot}, scores={ach_has_altaite_ingot=0}] ach_has_altaite_ingot 1
        tellraw @a[scores={ach_has_altaite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЛедяной блеск (Получить альтаитовый слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_altaite_ingot=1}] xp_tray 1200
        execute as @a[scores={ach_has_altaite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_altaite_ingot=1}] ach_has_altaite_ingot 99

    # Синее сиянее
        scoreboard players add @a ach_has_caryite_ingot 0
        scoreboard players add @a[hasitem={item=arx:caryite_ingot}, scores={ach_has_caryite_ingot=0}] ach_has_caryite_ingot 1
        tellraw @a[scores={ach_has_caryite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rСинее сиянее (Получить кариитовый слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_caryite_ingot=1}] xp_tray 1000
        execute as @a[scores={ach_has_caryite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_caryite_ingot=1}] ach_has_caryite_ingot 99

    # Зелёная смерть
        scoreboard players add @a ach_has_chloronite_ingot 0
        scoreboard players add @a[hasitem={item=arx:chloronite_ingot}, scores={ach_has_chloronite_ingot=0}] ach_has_chloronite_ingot 1
        tellraw @a[scores={ach_has_chloronite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЗелёная смерть (Получить хлоронитовый слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_chloronite_ingot=1}] xp_tray 1200
        execute as @a[scores={ach_has_chloronite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_chloronite_ingot=1}] ach_has_chloronite_ingot 99

    # Прочность солнца
        scoreboard players add @a ach_has_dorionite_ingot 0
        scoreboard players add @a[hasitem={item=arx:dorionite_ingot}, scores={ach_has_dorionite_ingot=0}] ach_has_dorionite_ingot 1
        tellraw @a[scores={ach_has_dorionite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rПрочность солнца (Получить дорионитовый слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_dorionite_ingot=1}] xp_tray 1200
        execute as @a[scores={ach_has_dorionite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_dorionite_ingot=1}] ach_has_dorionite_ingot 99

    # Загадочная мощь
        scoreboard players add @a ach_has_draphorite_ingot 0
        scoreboard players add @a[hasitem={item=arx:draphorite_ingot}, scores={ach_has_draphorite_ingot=0}] ach_has_draphorite_ingot 1
        tellraw @a[scores={ach_has_draphorite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЗагадочная мощь (Получить драфоритовый слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_draphorite_ingot=1}] xp_tray 5000
        execute as @a[scores={ach_has_draphorite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_draphorite_ingot=1}] ach_has_draphorite_ingot 99

    # Звёздный слиток
        scoreboard players add @a ach_has_forfactorite_ingot 0
        scoreboard players add @a[hasitem={item=arx:forfactorite_ingot}, scores={ach_has_forfactorite_ingot=0}] ach_has_forfactorite_ingot 1
        tellraw @a[scores={ach_has_forfactorite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rЗвёздный слиток (Получить форфакоритовый слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_forfactorite_ingot=1}] xp_tray 1000
        execute as @a[scores={ach_has_forfactorite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_forfactorite_ingot=1}] ach_has_forfactorite_ingot 99

    # Фиолетовое сокровище
        scoreboard players add @a ach_has_lamenite_ingot 0
        scoreboard players add @a[hasitem={item=arx:lamenite_ingot}, scores={ach_has_lamenite_ingot=0}] ach_has_lamenite_ingot 1
        tellraw @a[scores={ach_has_lamenite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rФиолетовое сокровище (Получить ламенитовый слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_lamenite_ingot=1}] xp_tray 3000
        execute as @a[scores={ach_has_lamenite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_lamenite_ingot=1}] ach_has_lamenite_ingot 99

    # Тёмный слиток
        scoreboard players add @a ach_has_naginitis_ingot 0
        scoreboard players add @a[hasitem={item=arx:naginitis_ingot}, scores={ach_has_naginitis_ingot=0}] ach_has_naginitis_ingot 1
        tellraw @a[scores={ach_has_naginitis_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rТёмный слиток (Получить нагинитовый слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_naginitis_ingot=1}] xp_tray 800
        execute as @a[scores={ach_has_naginitis_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_naginitis_ingot=1}] ach_has_naginitis_ingot 99

    # Адский блеск
        scoreboard players add @a ach_has_malafiotironite_ingot 0
        scoreboard players add @a[hasitem={item=arx:malafiotironite_ingot}, scores={ach_has_malafiotironite_ingot=0}] ach_has_malafiotironite_ingot 1
        tellraw @a[scores={ach_has_malafiotironite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rАдский блеск (Получить малафиотиронитовый слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_malafiotironite_ingot=1}] xp_tray 1600
        execute as @a[scores={ach_has_malafiotironite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_malafiotironite_ingot=1}] ach_has_malafiotironite_ingot 99

    # Адский арбитр
        scoreboard players add @a ach_has_toliriite_ingot 0
        scoreboard players add @a[hasitem={item=arx:toliriite_ingot}, scores={ach_has_toliriite_ingot=0}] ach_has_toliriite_ingot 1
        tellraw @a[scores={ach_has_toliriite_ingot=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rАдский арбитр (Получить толириитовый слиток)!" } ] }
        scoreboard players add @a[scores={ach_has_toliriite_ingot=1}] xp_tray 3000
        execute as @a[scores={ach_has_toliriite_ingot=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_toliriite_ingot=1}] ach_has_toliriite_ingot 99

    # Начало шахтёра
        scoreboard players add @a ach_has_wooden_pickaxe 0
        scoreboard players add @a[hasitem={item=minecraft:wooden_pickaxe}, scores={ach_has_wooden_pickaxe=0}] ach_has_wooden_pickaxe 1
        tellraw @a[scores={ach_has_wooden_pickaxe=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rНачало шахтёра (Получить каменную кирку)!" } ] }
        scoreboard players add @a[scores={ach_has_wooden_pickaxe=1}] xp_tray 50
        execute as @a[scores={ach_has_wooden_pickaxe=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_wooden_pickaxe=1}] ach_has_wooden_pickaxe 99

    # Металлический стук
        scoreboard players add @a ach_has_stone_pickaxe 0
        scoreboard players add @a[hasitem={item=minecraft:stone_pickaxe}, scores={ach_has_stone_pickaxe=0}] ach_has_stone_pickaxe 1
        tellraw @a[scores={ach_has_stone_pickaxe=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rМеталлический стук (Получить оловянную кирку)!" } ] }
        scoreboard players add @a[scores={ach_has_stone_pickaxe=1}] xp_tray 200
        execute as @a[scores={ach_has_stone_pickaxe=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_stone_pickaxe=1}] ach_has_stone_pickaxe 99

    # Уровень профи
        scoreboard players add @a ach_has_iron_pickaxe 0
        scoreboard players add @a[hasitem={item=minecraft:iron_pickaxe}, scores={ach_has_iron_pickaxe=0}] ach_has_iron_pickaxe 1
        tellraw @a[scores={ach_has_iron_pickaxe=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rУровень профи (Получить дюрастальную кирку)!" } ] }
        scoreboard players add @a[scores={ach_has_iron_pickaxe=1}] xp_tray 800
        execute as @a[scores={ach_has_iron_pickaxe=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_iron_pickaxe=1}] ach_has_iron_pickaxe 99

    # Синие искры
        scoreboard players add @a ach_has_diamond_pickaxe 0
        scoreboard players add @a[hasitem={item=minecraft:diamond_pickaxe}, scores={ach_has_diamond_pickaxe=0}] ach_has_diamond_pickaxe 1
        tellraw @a[scores={ach_has_diamond_pickaxe=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rСиние искры (Получить кариитовую кирку)!" } ] }
        scoreboard players add @a[scores={ach_has_diamond_pickaxe=1}] xp_tray 2000
        execute as @a[scores={ach_has_diamond_pickaxe=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_diamond_pickaxe=1}] ach_has_diamond_pickaxe 99

    # Мощь, достойная богов
        scoreboard players add @a ach_has_netherite_pickaxe 0
        scoreboard players add @a[hasitem={item=minecraft:netherite_pickaxe}, scores={ach_has_netherite_pickaxe=0}] ach_has_netherite_pickaxe 1
        tellraw @a[scores={ach_has_netherite_pickaxe=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rМощь, достойная богов (Получить спектральную кирку)!" } ] }
        scoreboard players add @a[scores={ach_has_netherite_pickaxe=1}] xp_tray 7500
        execute as @a[scores={ach_has_netherite_pickaxe=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_has_netherite_pickaxe=1}] ach_has_netherite_pickaxe 99

    # Воплощение пустыни
        scoreboard players add @a ach_kill_sand_elemental 0
        # External trigger
        tellraw @a[scores={ach_kill_sand_elemental=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rВоплощение пустыни (Убить песчанного элементаля)!" } ] }
        scoreboard players add @a[scores={ach_kill_sand_elemental=1}] xp_tray 400
        execute as @a[scores={ach_kill_sand_elemental=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_kill_sand_elemental=1}] ach_kill_sand_elemental 99

    # Мир стал безопаснее
        scoreboard players add @a ach_kill_rat_monster 0
        # External trigger
        tellraw @a[scores={ach_kill_rat_monster=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rМир стал безопаснее (Убить крысомонстра)!" } ] }
        scoreboard players add @a[scores={ach_kill_rat_monster=1}] xp_tray 120
        execute as @a[scores={ach_kill_rat_monster=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_kill_rat_monster=1}] ach_kill_rat_monster 99

    # Прощай, дедуля
        scoreboard players add @a ach_kill_swamp_monster 0
        # External trigger
        tellraw @a[scores={ach_kill_swamp_monster=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rПрощай, дедуля (Убить болотного монстра)!" } ] }
        scoreboard players add @a[scores={ach_kill_swamp_monster=1}] xp_tray 300
        execute as @a[scores={ach_kill_swamp_monster=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_kill_swamp_monster=1}] ach_kill_swamp_monster 99

    # Оно умеет говорить?
        scoreboard players add @a ach_kill_snow_lady 0
        # External trigger
        tellraw @a[scores={ach_kill_snow_lady=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rОно умеет говорить? (Убить снежную деву)!" } ] }
        scoreboard players add @a[scores={ach_kill_snow_lady=1}] xp_tray 300
        execute as @a[scores={ach_kill_snow_lady=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_kill_snow_lady=1}] ach_kill_snow_lady 99

    # Первая кровь
        scoreboard players add @a ach_1_kills 0
        scoreboard players add @a[scores={count_mob_kills=1.., ach_1_kills=0}] ach_1_kills 1
        tellraw @a[scores={ach_1_kills=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rПервая кровь (Убить одного моба)!" } ] }
        scoreboard players add @a[scores={ach_1_kills=1}] xp_tray 50
        execute as @a[scores={ach_1_kills=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_1_kills=1}] ach_1_kills 99

    # Охотник
        scoreboard players add @a ach_10_kills 0
        scoreboard players add @a[scores={count_mob_kills=10.., ach_10_kills=0}] ach_10_kills 1
        tellraw @a[scores={ach_10_kills=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rОхотник (Убить десять мобов)!" } ] }
        scoreboard players add @a[scores={ach_10_kills=1}] xp_tray 200
        execute as @a[scores={ach_10_kills=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_10_kills=1}] ach_10_kills 99

    # Истребитель
        scoreboard players add @a ach_100_kills 0
        scoreboard players add @a[scores={count_mob_kills=100.., ach_100_kills=0}] ach_100_kills 1
        tellraw @a[scores={ach_100_kills=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rИстребитель (Убить сто мобов)!" } ] }
        scoreboard players add @a[scores={ach_100_kills=1}] xp_tray 800
        execute as @a[scores={ach_100_kills=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_100_kills=1}] ach_100_kills 99

    # Ху Тао
        scoreboard players add @a ach_1000_kills 0
        scoreboard players add @a[scores={count_mob_kills=1000.., ach_1000_kills=0}] ach_1000_kills 1
        tellraw @a[scores={ach_1000_kills=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rХу Тао (Убить тысячу мобов)!" } ] }
        scoreboard players add @a[scores={ach_1000_kills=1}] xp_tray 3200
        execute as @a[scores={ach_1000_kills=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_1000_kills=1}] ach_1000_kills 99

    # Правая рука Смерти
        scoreboard players add @a ach_10000_kills 0
        scoreboard players add @a[scores={count_mob_kills=10000.., ach_10000_kills=0}] ach_10000_kills 1
        tellraw @a[scores={ach_10000_kills=1}] { "rawtext": [ { "text": "Ę §2§lВыполнено достижение: §rПравая рука Смерти (Убить 10 тысяч мобов)!" } ] }
        scoreboard players add @a[scores={ach_10000_kills=1}] xp_tray 10000
        execute as @a[scores={ach_10000_kills=1}] at @s run playsound get_achievement @s ~ ~ ~
        scoreboard players set @a[scores={ach_10000_kills=1}] ach_10000_kills 99

