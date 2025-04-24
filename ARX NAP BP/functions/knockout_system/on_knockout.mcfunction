# Эта функция запускается автоматически, когда игрок вырубается от полученного урона

# Увеличиваем счетчик ряда беспрерывных нокаутов (2 = смерть по рп, и 3 если есть кристалл второй жизни)
    scoreboard players add @s knockout_row_sounter 1

# Плюсуем счётчик нокаутов
    scoreboard players add @s count_death 1

# Задаём откат респавна
    tellraw @s[scores={crys_sw_respawn=1}] { "rawtext": [ { "text": "§aВы возродитесь быстрее (кристалл быстрого возрождения использован)" } ] }
    scoreboard players random @s[scores={crys_sw_respawn=0}] respawn_delay 60 90
    scoreboard players random @s[scores={crys_sw_respawn=1}] respawn_delay 30 45

# Сбрасываем камеру
    camera @s clear

# Изменяем некоторые показатели
    scoreboard players set @s[scores={poisoning=2000..}] poisoning 1999

# Стрессуем
    tellraw @s[scores={crys_dur=1..}] { "rawtext": [ { "text": "§aСчастье не уменьшено (кристалл стойкости использован)" } ] }
    scoreboard players add @s[scores={crys_dur=0}] stress 4000

# Выдаем тег, что надо дать защиту после нока
    tellraw @s[scores={crys_mob_calm=1..}] { "rawtext": [ { "text": "§aВокруг вас собирается магический щит (кристалл щита использован)" } ] }
    tag @s[scores={crys_mob_calm=1}] add crystal_of_shield_activate

# Сообщаем, если активен кристалл второй жизни
    tellraw @s[scores={crys_return=1}] { "rawtext": [ { "text": "§aВаш дух силён (кристалл второй жизни использован)" } ] }
    tag @s[scores={crys_return=1}] add crystal_of_second_life_activate
    # Сообщаем, что кристалл сработал 
        tellraw @s[scores={knockout_row_sounter=2}, tag=crystal_of_second_life_activate] { "rawtext": [ { "text": "§dВы не сдаётесь (кристалл второй жизни активен)" } ] }

# Выдаем блокировщики слота
    give @s arx:slot_blocker 100 0 {"item_lock": { "mode": "lock_in_slot" } }
    # Удаляем дропнутые рядом блокировщики
        kill @e[type=item, name="§r§cСлот заблокирован", r=4]

# Чистим данные о кристаллах
    scoreboard players set @s crys_dur 0
    scoreboard players set @s crys_mob_calm 0
    scoreboard players set @s crys_return 0
    scoreboard players set @s crys_sw_respawn 0

# Чистим данные о маги-фонарях
    scoreboard players set @s allow_magilight 0
    scoreboard players set @s allow_archlight 0

# Выставляем property
    event entity @s arx:property_is_knockout_set_true

# Убиваем по рп, если это требуется
    execute if entity @s[scores={knockout_row_sounter=2}, tag=!crystal_of_second_life_activate] run tag @s add __force_to_rp_death__
    execute if entity @s[scores={knockout_row_sounter=3..}, tag=crystal_of_second_life_activate] run tag @s add __force_to_rp_death__