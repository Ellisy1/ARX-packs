# ЭТА ФУНКЦИЯ ЗАПУСКАЕТСЯ АВТОМАТИЧЕСКИ, КОГДА ИГРОК ВОЗРАЖДАЕТСЯ

# Плюсуем счётчик смертей
    scoreboard players add @s count_death 1

# Задаём откат респавна
    tellraw @s[scores={crys_sw_respawn=1}] { "rawtext": [ { "text": "§aВы возродитесь быстрее (кристалл быстрого возрождения использован)" } ] }
    scoreboard players set @s[scores={crys_sw_respawn=0}] respawn_delay 90
    scoreboard players set @s[scores={crys_sw_respawn=1}] respawn_delay 22
    title @s[scores={crys_sw_respawn=0}] subtitle 1 мин 30 сек
    title @s[scores={crys_sw_respawn=1}] subtitle 22 сек
    title @s title §4Ваш откат респавна

# Заражаем
    scoreboard players set @s[scores={custom_random=0..20, ill_mild_cold=!1.., xp_stage=2..}] ill_mild_cold 14600
    scoreboard players set @s[scores={custom_random=21..50, ill_broken_leg=!1.., xp_stage=2..}] ill_broken_leg 72000
    scoreboard players set @s[scores={custom_random=51..80, ill_broken_arm=!1.., xp_stage=2..}] ill_broken_arm 72000
    scoreboard players set @s[scores={custom_random=81..100, ill_helminth=!1.., xp_stage=2..}] ill_helminth 2400

#Обнуляем некоторые показатели
    scoreboard players set @s poisoning 0
    scoreboard players set @s freezing 0
    scoreboard players set @s water_delay 0

# Стрессуем
    execute @s[scores={crys_dur=1..}] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§aСчастье не уменьшено (крситалл стойкости использован)" } ] }
    execute @s[scores={crys_dur=0}] ~ ~ ~ scoreboard players add @s stress 4000

# Списываем опыт
    # Опыт отрицательный
        execute @s[scores={xp=..-1}] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§a§lШтраф опыта не наложен (у вас отрицательный опыт)." } ] } 

    # Опыт положительный
        # Стандартное списание 25% ОП
            execute @s[scores={xp=0..}, tag=!is_fighting_with_boss] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§c§lНаложен штраф опыта в 25%." } ] } 
            execute @s[scores={xp=0..}, tag=!is_fighting_with_boss] ~ ~ ~ scoreboard players operation @s xp /= @a[scores={verify=2}] const_4
            execute @s[scores={xp=0..}, tag=!is_fighting_with_boss] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§c§lСписано §a" }, { "score": {"name": "@s", "objective": "xp" } }, { "text": "§c опыта АS&S." } ] } 
            execute @s[scores={xp=0..}, tag=!is_fighting_with_boss] ~ ~ ~ scoreboard players operation @s xp *= @a[scores={verify=2}] const_3

        # Боссфайтовое списание 5% ОП
            execute @s[scores={xp=0..}, tag=is_fighting_with_boss] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§c§lНаложен штраф опыта в 5% (Смерть при бое с боссом)." } ] } 
            execute @s[scores={xp=0..}, tag=is_fighting_with_boss] ~ ~ ~ scoreboard players operation @s xp /= @a[scores={verify=2}] const_20
            execute @s[scores={xp=0..}, tag=is_fighting_with_boss] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§c§lСписано §a" }, { "score": {"name": "@s", "objective": "xp" } }, { "text": "§c опыта АS&S." } ] } 
            execute @s[scores={xp=0..}, tag=is_fighting_with_boss] ~ ~ ~ scoreboard players operation @s xp *= @a[scores={verify=2}] const_19

# Выдаем запрашивалку для времени
    give @s arx:respawn_time_checker

# Отправляемся откисать и попускаться в комнату попущения
    tp @p 10000 -33 10000

# Умираем, если серьёзно болели
    execute @s[scores={ill_cancer=1..4800}] ~ ~ ~ tag @s add death_by_disease
    execute @s[scores={ill_appendicitis=1..1200}] ~ ~ ~ tag @s add death_by_disease
    execute @s[scores={drugs_delay=1..1200}] ~ ~ ~ tag @s add death_by_disease

    execute @s[tag=death_by_disease] ~ ~ ~ function qa/death

# Умираем с маленьким шансом, если вы демон
    execute @s[scores={c_demon=1, custom_random=300..350}] ~ ~ ~ function qa/death

# Чистим данные о кристаллах
    scoreboard players set @s crys_dur 0
    scoreboard players set @s crys_mob_calm 0
    scoreboard players set @s crys_return 0
    scoreboard players set @s crys_sw_respawn 0

# Чистим данные о маги фонарях
    scoreboard players set @s allow_magilight 0
    scoreboard players set @s allow_archlight 0