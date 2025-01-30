# Обучение механике стресса-счастья
    execute as @s[scores={learning=11}] run tellraw @s { "rawtext": [ { "text": "§eВы ведь не думали, что всё так сладко? §fТеперь про стресс. §aНе получайте урон и не отправляйтесь в нокаут, чтобы не получать стресс.§f Используйте меня, чтобы продолжить." } ] }
    execute as @s[scores={learning=11}] run scoreboard players set @s stress_normalize 0
    execute as @s[scores={learning=11}] run scoreboard players set @s stress 3000
    execute as @s[scores={learning=11}] run tellraw @s { "rawtext": [ { "text": "§6=====" } ] }
    execute as @s[scores={learning=11}] run scoreboard players set @s learning 12

    execute as @s[scores={learning=10}] run tellraw @s { "rawtext": [ { "text": "§aЧудесно. §fТеперь приступим к чему-то посложнее. Я выставил вам счастье. Механика тут проста, §aсчастье это плюс характеристики§f (скорость, копание, реген и т.д.). §aВкусно кушайте и не умирайте§f, чтобы быть счастливым. Используйте меня, чтобы продолжить." } ] }
    execute as @s[scores={learning=10}] run scoreboard players set @s stress_normalize 0
    execute as @s[scores={learning=10}] run scoreboard players set @s stress -3000
    execute as @s[scores={learning=10}] run tellraw @s { "rawtext": [ { "text": "§6=====" } ] }
    execute as @s[scores={learning=10}] run scoreboard players set @s learning 11

# Обучение юзанию пердметов на ПКМ
    execute as @s[scores={learning=2}] run tellraw @s { "rawtext": [ { "text": "§aВау, верное решение! §fДавайте закрепим, что стоит сделать, если вы без понятия, что сейчас делать." } ] }
    execute as @s[scores={learning=2}] run tellraw @s { "rawtext": [ { "text": "§6=====" } ] }
    execute as @s[scores={learning=2}] run scoreboard players set @s learning 10

    execute as @s[scores={learning=1}] run tellraw @s { "rawtext": [ { "text": "§aКруто! Вы справились. §fНачало положено.\nТо что вы держите, это §aГИД§f. Если вы не знаете, что делать, просто используйте его. Он будет с вами на протяжении всей игры. Вы не знаете, что сейчас делать. Ваши действия...?" } ] }
    execute as @s[scores={learning=1}] run tellraw @s { "rawtext": [ { "text": "§6=====" } ] }
    execute as @s[scores={learning=1}] run scoreboard players set @s learning 2

# Добавить в старт регистрации: tellraw @s { "rawtext": [ { "text": "§fВидите §6зеленую книжку§f в инвентаре? Выберите её, и используйте её на ПКМ, или если вы с телефона, зажмите на экране." } ] }