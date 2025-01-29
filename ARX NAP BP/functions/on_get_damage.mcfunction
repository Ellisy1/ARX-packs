# Эта функция запускается файлом игрока player.json в папке entities при получении урона

# Партиклы крови
    execute at @s[tag=!damaged_without_blood, scores={class=0}] run particle arx:blood ~ ~1 ~
    execute at @s[tag=!damaged_without_blood, scores={class=1}] run particle arx:ghost_blood ~ ~1.5 ~

# Графика (1 лицо)
    effect @s[scores={allow_block_buff=!15..20}] blindness 1 0 true

    camerashake add @s 0.5 0.1 rotational 
    camerashake add @s 0.2 0.1 positional 
    #                  инт. время тип

# Стресс
    scoreboard players add @s stress 400
    scoreboard players add @s[scores={religion=17}, hasitem={item=arx:pires_paladin_armor, location=slot.armor.chest}] stress -100

    scoreboard players add @s[scores={strength_skill=1}] stress -50
    scoreboard players add @s[scores={strength_skill=2}] stress -100
    scoreboard players add @s[scores={strength_skill=3}] stress -150
    scoreboard players add @s[scores={strength_skill=4}] stress -200
    scoreboard players add @s[scores={strength_skill=5}] stress -250
    scoreboard players add @s[scores={strength_skill=6..}] stress -300

    scoreboard players add @s[scores={might_skill=1}] stress -50
    scoreboard players add @s[scores={might_skill=2}] stress -100
    scoreboard players add @s[scores={might_skill=3}] stress -150
    scoreboard players add @s[scores={might_skill=4}] stress -200
    scoreboard players add @s[scores={might_skill=5}] stress -250
    scoreboard players add @s[scores={might_skill=6..}] stress -300
    
    scoreboard players add @s[scores={c_cowardly=1..}] stress 400

# Увеличение счётчика ударов
    scoreboard players add @s count_hits 1

# Запуск эффектов от религиозной брони
    scoreboard players set @s[scores={religion=9}, hasitem={item=arx:pallas_assasin_clothing, location=slot.armor.chest}] armor_assas_dmg 40
    scoreboard players set @s[scores={religion=7}, hasitem={item=arx:pallas_conqueror_armor, location=slot.armor.chest}] armor_conq_dmg 100
    scoreboard players set @s[scores={religion=19}, hasitem={item=arx:pires_ranger_coat, location=slot.armor.chest}] armor_ranger_dmg 140

# Отслеживание состояний
    # Отслеживание боя (нигде не используется, просто есть)
        scoreboard players set @s in_battle 10
    # Задержка для установки минимального интервала между получеными ударами
        scoreboard players set @s on_hurt_delay 10

# Исполнение блоков allow_block_buff
    # Идеальный блок 15..20
        title @s[scores={allow_block_buff=15..20}] title §dИдельный блок
        scoreboard players set @s[scores={allow_block_buff=15..20}] blocking 0
        scoreboard players set @s[scores={allow_block_buff=15..20, attack_weakness=..40}] attack_weakness 1
        scoreboard players add @s[scores={allow_block_buff=15..20, attack_weakness=41..}] attack_weakness -40
        scoreboard players add @s[scores={allow_block_buff=15..20, stress=0..}] stress -100

        scoreboard players set @s[scores={allow_block_buff=15..20}] allow_block_buff 0

    # Хороший блок 1..14
        title @s[scores={allow_block_buff=1..14}] title §aХороший блок
        scoreboard players set @s[scores={allow_block_buff=1..14}] blocking 0
        scoreboard players set @s[scores={allow_block_buff=1..14, attack_weakness=..20}] attack_weakness -1
        scoreboard players add @s[scores={allow_block_buff=1..14, attack_weakness=21..}] attack_weakness -20
        
        scoreboard players set @s[scores={allow_block_buff=1..14}] allow_block_buff 0

# Действие амулета брызг
    execute as @s[hasitem={item=arx:amul_of_splash, location=slot.armor.legs}, scores={custom_random=0..500}] run effect @s fire_resistance 2 0 true
    execute at @s[hasitem={item=arx:amul_of_splash, location=slot.armor.legs}] run particle arx:amul_of_splash ~ ~1.5 ~ 

# Снятие передаваемых данных
    tag @s remove damaged_without_blood

# Встаем, если притворялись мертвым
    event entity @s[has_property={arx:is_knocked=1..}, scores={respawn_delay=0}] arx:property_is_knockout_set_0