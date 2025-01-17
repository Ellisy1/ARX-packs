function registration/separation_line

# Определяем, установлены ли вкусы
    tag @s[scores={t_spicy=!0}] add has_defined_tastes
    tag @s[scores={t_salty=!0}] add has_defined_tastes
    tag @s[scores={t_sweet=!0}] add has_defined_tastes
    tag @s[scores={t_sour=!0}] add has_defined_tastes
    tag @s[scores={t_exotic=!0}] add has_defined_tastes

    tag @s[scores={t_herbal=!0}] add has_defined_tastes
    tag @s[scores={t_meat=!0}] add has_defined_tastes
    tag @s[scores={t_fish=!0}] add has_defined_tastes
    tag @s[scores={t_bread=!0}] add has_defined_tastes
    tag @s[scores={t_lactic=!0}] add has_defined_tastes

#Действия при поднятой камере
    execute @s[rx=-89, tag=!has_defined_tastes] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§cВы ещё не выбрали вкусы! Для начала используйте этот предмет не в вертикальном положении." } ] }

    execute @s[rx=-89, tag=has_defined_tastes] ~ ~ ~ clear @s arx:registration_step4_rerun
    execute @s[rx=-89, tag=has_defined_tastes] ~ ~ ~ give @s[tag=at_respawn_room] arx:registration_step5_ready 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
    execute @s[rx=-89, tag=has_defined_tastes] ~ ~ ~ tellraw @s[tag=at_respawn_room] { "rawtext": [ { "text": "§l§6Готовы ли вы?" } ] }

#Действия в нормальной позиции
    execute @s[rxm=-89, tag=!has_defined_tastes] ~ ~ ~ tellraw @s { "rawtext": [{ "text": "§aВкусы установлены! Вы можете обновлять свои вкусы, пока они вам не понравятся." } ] } 
    execute @s[rxm=-89, tag=has_defined_tastes] ~ ~ ~ tellraw @s { "rawtext": [{ "text": "§aВкусы обновлены!" } ] } 
    execute @s[rxm=-89] ~ ~ ~ function food/set_tastes
    execute @s[rxm=-89] ~ ~ ~ function food/taste_data

tellraw @s { "rawtext": [ { "text": " " } ] }

tag @s remove has_defined_tastes