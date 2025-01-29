# Эта функция запускается автоматически, когда игрок вырубается от полученного урона

# Выставляем спавнпоинт туда, где умерли. Мы сейчас же возродимся прямо здесь
    spawnpoint @s ~ ~ ~

# Увеличиваем счетчик ряда беспрерывных нокаутов (2 = смерть по рп, и 3 если есть кристалл второй жизни)
    scoreboard players add @s knockout_row_sounter 1

# Плюсуем счётчик нокаутов
    scoreboard players add @s count_death 1

# Задаём откат респавна
    tellraw @s[scores={crys_sw_respawn=1}] { "rawtext": [ { "text": "§aВы возродитесь быстрее (кристалл быстрого возрождения использован)" } ] }
    scoreboard players random @s[scores={crys_sw_respawn=0}] respawn_delay 60 90
    scoreboard players random @s[scores={crys_sw_respawn=1}] respawn_delay 30 45

# Заражаем
    scoreboard players set @s[scores={custom_random=0..20, ill_mild_cold=!1.., xp_stage=2..}] ill_mild_cold 14600
    scoreboard players set @s[scores={custom_random=21..50, ill_broken_leg=!1.., xp_stage=2..}] ill_broken_leg 72000
    scoreboard players set @s[scores={custom_random=51..80, ill_broken_arm=!1.., xp_stage=2..}] ill_broken_arm 72000
    scoreboard players set @s[scores={custom_random=81..100, ill_helminth=!1.., xp_stage=2..}] ill_helminth 2400

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

# Чистим данные о кристаллах
    scoreboard players set @s crys_dur 0
    scoreboard players set @s crys_mob_calm 0
    scoreboard players set @s crys_return 0
    scoreboard players set @s crys_sw_respawn 0

# Чистим данные о маги-фонарях
    scoreboard players set @s allow_magilight 0
    scoreboard players set @s allow_archlight 0

# Убиваем по рп, если это требуется
    execute if entity @s[scores={knockout_row_sounter=2}, tag=!crystal_of_second_life_activate] run function knockout_system/on_rp_death
    execute if entity @s[scores={knockout_row_sounter=3..}, tag=crystal_of_second_life_activate] run function knockout_system/on_rp_death