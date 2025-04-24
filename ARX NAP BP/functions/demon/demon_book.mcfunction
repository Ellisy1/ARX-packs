# Книга демона

# Дарование силы
    execute if entity @s[scores={custom_random=0..500}] run playsound demon.say @a ~ ~ ~
    execute if entity @s[scores={custom_random=0..500}] run scoreboard players set @s demon_power 20
    execute if entity @s[scores={custom_random=0..500}] run scoreboard players add @s stress -200
    execute if entity @s[scores={custom_random=0..500}] run tellraw @s { "rawtext": [ { "text": "Демон дарует вам свою силу!" } ] }

# Демон занят
    execute if entity @s[scores={custom_random=501..900}] run scoreboard players add @s stress 100
    execute if entity @s[scores={custom_random=501..900}] run tellraw @s { "rawtext": [ { "text": "Кажется, демон чем-то занят и ему не до вас" } ] }

# Заражение демоном
    execute if entity @s[scores={custom_random=901..950}] run scoreboard players add @s stress 500
    execute if entity @s[scores={custom_random=901..950}] run playsound getdemon @a ~0.1 ~2 ~0.1
    execute if entity @s[scores={custom_random=901..950}] run clear @s arx:demon_book 0 1
    execute if entity @s[scores={custom_random=901..950}] run effect @s darkness 16 0
    execute if entity @s[scores={custom_random=901..950}] run effect @s nausea 18 0
    execute if entity @s[scores={custom_random=901..950}] run effect @s levitation 5 0
    execute if entity @s[scores={custom_random=901..950}] run effect @s slowness 16 10
    execute if entity @s[scores={custom_random=901..950}] run camerashake add @s 1 16 rotational
    execute if entity @s[scores={custom_random=901..950}] run scoreboard players set @s c_demon 1
    execute if entity @s[scores={custom_random=901..950}] run tellraw @s { "rawtext": [ { "text": "Вы одержимы демоном! Если вас вырубят в таком состоянии, то вы погибнете навсегда!" } ] }
    execute if entity @s[scores={custom_random=901..950}] run title @s subtitle §4При смерти с демоном вы погибнете навсегда!
    execute if entity @s[scores={custom_random=901..950}] run title @s title §сВЫ ОДЕРЖИМЫ ДЕМОНОМ

# Подарок от демона - маска
    execute if entity @s[scores={custom_random=951..960}] run scoreboard players add @s stress -500
    execute if entity @s[scores={custom_random=951..960}] run playsound demon.say @a ~ ~ ~
    execute if entity @s[scores={custom_random=951..960}] run give @s arx:demon_mask
    execute if entity @s[scores={custom_random=951..960}] run tellraw @s { "rawtext": [ { "text": "Демон решил сделать вам подарок!" } ] }

# Подарок от демона - уголь
    execute if entity @s[scores={custom_random=961..990}] run scoreboard players add @s stress 500
    execute if entity @s[scores={custom_random=961..990}] run playsound demon.say @a ~ ~ ~
    execute if entity @s[scores={custom_random=961..990}] run give @s coal
    execute if entity @s[scores={custom_random=961..990}] run tellraw @s { "rawtext": [ { "text": "Демон решил сделать вам подарок..." } ] }

# Великая сила
    execute if entity @s[scores={custom_random=991..992}] run scoreboard players add @s stress -1000
    execute if entity @s[scores={custom_random=991..992}] run playsound demon.say @a ~ ~ ~
    execute if entity @s[scores={custom_random=991..992}] run scoreboard players set @s demon_power 360
    execute if entity @s[scores={custom_random=991..992}] run tellraw @s { "rawtext": [ { "text": "Демон надолго дарует вам силу!" } ] }

# Покидание книги
    execute if entity @s[scores={custom_random=993..994}] run scoreboard players add @s stress 500
    execute if entity @s[scores={custom_random=993..994}] run clear @s arx:demon_book 0 1
    execute if entity @s[scores={custom_random=993..994}] run give @s book
    execute if entity @s[scores={custom_random=993..994}] run tellraw @s { "rawtext": [ { "text": "Демон решил покинуть вашу книгу" } ] }

# Отравление игрока
    execute if entity @s[scores={custom_random=995..996}] run scoreboard players add @s stress 2000
    execute if entity @s[scores={custom_random=995..996}] run playsound demon.say @a ~ ~ ~
    execute if entity @s[scores={custom_random=995..996}] run effect @s poison 999999 0
    execute if entity @s[scores={custom_random=995..996}] run tellraw @s { "rawtext": [ { "text": "Демон решил поиздеваться над вами" } ] }

# Подбрасывание игрока
    execute if entity @s[scores={custom_random=997..998}] run scoreboard players add @s stress 2000
    execute if entity @s[scores={custom_random=997..998}] run playsound demon.say @a ~ ~ ~
    execute if entity @s[scores={custom_random=997..998}] run effect @s levitation 3 100
    execute if entity @s[scores={custom_random=997..998}] run tellraw @s { "rawtext": [ { "text": "Демон решил поиздеваться над вами" } ] }

# Уход из книги
    execute if entity @s[scores={custom_random=999..}] run scoreboard players add @s stress -2000
    execute if entity @s[scores={custom_random=999..}] run playsound demon.say @a ~ ~ ~
    execute if entity @s[scores={custom_random=999..}] run give @s arx:undemon_book
    execute if entity @s[scores={custom_random=999..}] run tellraw @s { "rawtext": [ { "text": "Демон, кажется, очень переживает за вашу сохранность и не желает вам зла, давая заклинание против себя самого" } ] }