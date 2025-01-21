function registration/separation_line

# Подготавливаем игрока к первому погружению
    scoreboard players set @s spawn_location 1

    clear @s arx:registration_step5_ready
    tellraw @s { "rawtext": [ { "text": "Вы в игре! Используйте §aгид§f (зеленая книжка у вас в инвентаре), он всегда подскажет что делать!" } ] }
    function registration/set_all_scoreboards
    give @s arx:united_player_data 1 0 {"keep_on_death": {}}
    give @s arx:guide 1 0 {"keep_on_death": {}}
    give @s arx:pose_tuning 1 0 {"keep_on_death": {}}
    give @s arx:scroll_of_healing 1 0 {"item_lock": {"mode": "lock_in_inventory"}}
    scoreboard players random @s UID 0 1000000000
    function runes/_autoreg
    function tp/1_spawn

tellraw @s { "rawtext": [ { "text": " " } ] }