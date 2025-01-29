tellraw @s { "rawtext": [{"text": "§6=====§aХАРАКТЕРИСТИКИ§6====="}] }
tellraw @s[scores={gender=!1..2}] { "rawtext": [{ "text": "Ваш пол неопределён" } ] } 
tellraw @s[scores={gender=1}] { "rawtext": [{ "text": "Ваш пол - §bмужчина" } ] } 
tellraw @s[scores={gender=2}] { "rawtext": [{ "text": "Ваш пол - §dженщина" } ] } 

tellraw @s[scores={class=1}] { "rawtext": [{ "text": "Вы - §4призрак" } ] } 

tellraw @s[scores={religion=1}] { "rawtext": [{ "text": "Ваша религия - §aУченик Палласа" } ] } 
tellraw @s[scores={religion=2}] { "rawtext": [{ "text": "Ваша религия - §bСлужитель Палласа" } ] } 
tellraw @s[scores={religion=3}] { "rawtext": [{ "text": "Ваша религия - §6Адепт Палласа" } ] } 
tellraw @s[scores={religion=4}] { "rawtext": [{ "text": "Ваша религия - §cМаг Палласа" } ] } 
tellraw @s[scores={religion=5}] { "rawtext": [{ "text": "Ваша религия - §dАрхимаг Палласа" } ] } 
tellraw @s[scores={religion=6}] { "rawtext": [{ "text": "Ваша религия - §cВоин Палласа" } ] } 
tellraw @s[scores={religion=7}] { "rawtext": [{ "text": "Ваша религия - §dЗавоеватель Палласа" } ] } 
tellraw @s[scores={religion=8}] { "rawtext": [{ "text": "Ваша религия - §cСтрелок Палласа" } ] } 
tellraw @s[scores={religion=9}] { "rawtext": [{ "text": "Ваша религия - §dАссасин Палласа" } ] } 

tellraw @s[scores={religion=11}] { "rawtext": [{ "text": "Ваша религия - §aУченик Пиреса" } ] } 
tellraw @s[scores={religion=12}] { "rawtext": [{ "text": "Ваша религия - §bСлужитель Пиреса" } ] } 
tellraw @s[scores={religion=13}] { "rawtext": [{ "text": "Ваша религия - §6Адепт Пиреса" } ] } 
tellraw @s[scores={religion=14}] { "rawtext": [{ "text": "Ваша религия - §cМаг Пиреса" } ] } 
tellraw @s[scores={religion=15}] { "rawtext": [{ "text": "Ваша религия - §dАрхимаг Пиреса" } ] } 
tellraw @s[scores={religion=16}] { "rawtext": [{ "text": "Ваша религия - §cРыцарь Пиреса" } ] } 
tellraw @s[scores={religion=17}] { "rawtext": [{ "text": "Ваша религия - §dПаладин Пиреса" } ] } 
tellraw @s[scores={religion=18}] { "rawtext": [{ "text": "Ваша религия - §cРейнджер Пиреса" } ] } 
tellraw @s[scores={religion=19}] { "rawtext": [{ "text": "Ваша религия - §dСтраж леса Пиреса" } ] } 

tellraw @s[scores={religion=21}] { "rawtext": [{ "text": "Ваша религия - §cНекромант" } ] } 
tellraw @s[scores={religion=22}] { "rawtext": [{ "text": "Ваша религия - §dАрхинекромант" } ] } 

tellraw @s[scores={karma_pallas=1..}] { "rawtext": [{ "text": "§4Карма Палласа продлится ещё "}, { "score": {"name": "@s", "objective": "karma_pallas" } }, { "text": " минут." } ] }
tellraw @s[scores={karma_pires=1..}] { "rawtext": [{ "text": "§4Карма Пиреса продлится ещё "}, { "score": {"name": "@s", "objective": "karma_pires" } }, { "text": " минут." } ] }

tellraw @s[scores={sk_a_21=1}] { "rawtext": [ { "text": "МАНА§f: §b" }, { "score": {"name": "@s", "objective": "mp" } }, { "text": "§f маны, §3" }, { "score": {"name": "@s", "objective": "mp_max" } }, { "text": "§f макс. маны, " } ] }

tellraw @s[scores={regen_mp=9999.., sk_a_22=1}] { "rawtext": [ { "text": "РЕГЕН МАНЫ: мана не регенирируется." } ] }
tellraw @s[scores={regen_mp=1..9999, sk_a_22=1}] { "rawtext": [ { "text": "РЕГЕН МАНЫ: §d" }, { "score": {"name": "@s", "objective": "regen_mp" } }, { "text": "§f сек. скорость регенерации §d" }, { "score": {"name": "@s", "objective": "mp_regeneration_amplification" } }, { "text": "§f маны" } ] }
tellraw @s[scores={regen_mp=..0, sk_a_22=1}] { "rawtext": [ { "text": "РЕГЕН МАНЫ: " }, { "text": "1 сек. скорость регенерации очка маны" } ] }
tellraw @s[scores={sk_a_21=1, sk_a_22=0}] { "rawtext": [ { "text": "РЕГЕН МАНЫ: §cНе изучено, требуется навык A22" } ] }

tellraw @s { "rawtext": [ { "text": "РЕГЕН ХП: (§eуровень эффекта§f/§6раз в .. сек.§f): §e" }, { "score": {"name": "@s", "objective": "regen_effect" } }, { "text": "§f/§6" }, { "score": {"name": "@s", "objective": "regen_speed" } } ] }

tellraw @s { "rawtext": [{"text": "§6=====§aОПЫТ АS&S§6====="}] }

tellraw @s { "rawtext": [{ "text": "Уровень: §a" }, { "score": {"name": "@s", "objective": "xp_stage" } } ] } 
tellraw @s[scores={skill_point=1..}] { "rawtext": [{ "text": "§dДоступные очки обучения§f: §a" }, { "score": {"name": "@s", "objective": "skill_point" } } ] } 
tellraw @s { "rawtext": [{ "text": "ОП/След. ур.: §a" }, { "score": {"name": "@s", "objective": "xp" } }, { "text": "/" }, { "score": {"name": "@s", "objective": "xp_lim" } } ] } 

tellraw @s[scores={speed_skill=0}] { "rawtext": [{ "text": "§6=> §7Ловкость [базовый навык]: §80" } ] } 
tellraw @s[scores={speed_skill=!0}] { "rawtext": [{ "text": "§6=> §aЛовкость§f [базовый навык]: §a" }, { "score": {"name": "@s", "objective": "speed_skill" } } ] } 
tellraw @s[scores={strength_skill=0}] { "rawtext": [{ "text": "§6=> §7Сила [базовый навык]: §80" } ] } 
tellraw @s[scores={strength_skill=!0}] { "rawtext": [{ "text": "§6=> §cСила§f [базовый навык]: §a" }, { "score": {"name": "@s", "objective": "strength_skill" } } ] } 
tellraw @s[scores={magic_skill=0}] { "rawtext": [{ "text": "§6=> §7Магия [базовый навык]: §80" } ] } 
tellraw @s[scores={magic_skill=!0}] { "rawtext": [{ "text": "§6=> §bМагия§f [базовый навык]: §a" }, { "score": {"name": "@s", "objective": "magic_skill" } } ] } 

tellraw @s[scores={trailblazer_skill=!0}] { "rawtext": [{ "text": "§6=> §eПервопроходец§f [теневой навык]: §a" }, { "score": {"name": "@s", "objective": "trailblazer_skill" } } ] } 
tellraw @s[scores={might_skill=!0}] { "rawtext": [{ "text": "§6=> §dМогущество§f [теневой навык]: §a" }, { "score": {"name": "@s", "objective": "might_skill" } } ] } 

tellraw @s { "rawtext": [{ "text": "§6=====§aСТРЕСС§6=====" } ] } 
tellraw @s[scores={stress_cond=4}] { "rawtext": [{ "text": "đ Стресс 4 (макс.) уровня." } ] } 
tellraw @s[scores={stress_cond=3}] { "rawtext": [{ "text": "đ Стресс 3 (из 4) уровня." } ] } 
tellraw @s[scores={stress_cond=2}] { "rawtext": [{ "text": "đ Стресс 2 (из 4) уровня." } ] } 
tellraw @s[scores={stress_cond=1}] { "rawtext": [{ "text": "đ Стресс 1 (из 4) уровня." } ] } 
tellraw @s[scores={stress_cond=0}] { "rawtext": [{ "text": "ē Нейтральное настроение." } ] } 
tellraw @s[scores={stress_cond=-1}] { "rawtext": [{ "text": "Ē Счастье 1 (из 4) уровня." } ] } 
tellraw @s[scores={stress_cond=-2}] { "rawtext": [{ "text": "Ē Счастье 2 (из 4) уровня." } ] } 
tellraw @s[scores={stress_cond=-3}] { "rawtext": [{ "text": "Ē Счастье 3 (из 4) уровня." } ] } 
tellraw @s[scores={stress_cond=-4}] { "rawtext": [{ "text": "Ē Счастье 4 (макс.) уровня." } ] } 

tellraw @s[scores={stress_cond=4}] { "rawtext": [{ "text": "Сильно понижены характеристики: §4авторегенерация маны и здоровья, сила, прыжок и скорость, переносимый вес." } ] } 
tellraw @s[scores={stress_cond=3}] { "rawtext": [{ "text": "Понижены характеристики: §4авторегенерация маны и здоровья, сила и скорость, переносимый вес." } ] } 
tellraw @s[scores={stress_cond=2}] { "rawtext": [{ "text": "Понижены характеристики: §4авторегенерация маны и здоровья, переносимый вес." } ] } 
tellraw @s[scores={stress_cond=-1..1}] { "rawtext": [{ "text": "Характеристики §eне изменены." } ] } 
tellraw @s[scores={stress_cond=-2}] { "rawtext": [{ "text": "Улучшены характеристики: §aавторегенерация маны и здоровья, переносимый вес." } ] } 
tellraw @s[scores={stress_cond=-3}] { "rawtext": [{ "text": "Улучшены характеристики: §aавторегенерация маны и здоровья, сила и скорость, переносимый вес" } ] } 
tellraw @s[scores={stress_cond=-4}] { "rawtext": [{ "text": "Сильно улучшены характеристики: §aавторегенерация маны и здоровья, сила, прыжок и скорость, переносимый вес." } ] } 

tellraw @s { "rawtext": [{ "text": "§6=====§aОТРАВЛЕНИЕ§6=====" } ] } 
# Отравление
    tellraw @s { "rawtext": [ { "text": "Эффективность снятия отравления: " }, { "score": {"name": "@s", "objective": "pois_dec" } }, { "text": "00%" } ] }
    tellraw @s[scores={pois_cond=0}] { "rawtext": [{ "text": "Отравление 0 (из 4) уровня." } ] } 
    tellraw @s[scores={pois_cond=1}] { "rawtext": [{ "text": "Отравление 1 (из 4) уровня." } ] } 
    tellraw @s[scores={pois_cond=2}] { "rawtext": [{ "text": "Отравление 2 (из 4) уровня." } ] } 
    tellraw @s[scores={pois_cond=3}] { "rawtext": [{ "text": "Отравление 3 (из 4) уровня." } ] } 
    tellraw @s[scores={pois_cond=4}] { "rawtext": [{ "text": "Отравление 4 (из 4) уровня." } ] } 

# Батареи
    tellraw @s[scores={battery_avail=1}] { "rawtext": [{ "text": "§6=====§aЗАРЯД БАТАРЕЙ§6=====" } ] } 
    tellraw @s[scores={battery_avail=1}] { "rawtext": [{ "text": "Заряд батарей:§b " }, { "score": {"name": "@s", "objective": "battery_charge" } }, { "text": "Ő" } ] } 
    tellraw @s[scores={battery_avail=1}] { "rawtext": [{ "text": "Объём батарей:§a " }, { "score": {"name": "@s", "objective": "battery_max" } } ] } 
    tellraw @s[scores={battery_avail=1}, hasitem={item=arx:battery_small, quantity=4..}] { "rawtext": [{ "text": "§cМаксимум можно подключить только три батареи одного типа!" } ] } 
    tellraw @s[scores={battery_avail=1}, hasitem={item=arx:battery_large, quantity=4..}] { "rawtext": [{ "text": "§cМаксимум можно подключить только три батареи одного типа!" } ] } 
    tellraw @s[scores={battery_avail=1}, hasitem={item=arx:battery_ultra, quantity=4..}] { "rawtext": [{ "text": "§cМаксимум можно подключить только три батареи одного типа!" } ] } 
    tellraw @s[scores={battery_avail=1}, hasitem={item=arx:battery_homemade, quantity=4..}] { "rawtext": [{ "text": "§cМаксимум можно подключить только три батареи одного типа!" } ] } 

# Кристаллы
    tag @s[scores={crys_dur=1}] add show_crystals
    tag @s[scores={crys_mob_calm=1}] add show_crystals
    tag @s[scores={crys_return=1}] add show_crystals
    tag @s[scores={crys_sw_respawn=1}] add show_crystals

    tellraw @s[tag=show_crystals] { "rawtext": [{ "text": "§6=====§aКРИСТАЛЛЫ§6=====" } ] } 
    tellraw @s[tag=show_crystals, scores={crys_dur=1}] { "rawtext": [{ "text": "§eАктивен кристалл стойкости" } ] } 
    tellraw @s[tag=show_crystals, scores={crys_mob_calm=1}] { "rawtext": [{ "text": "§cАктивен кристалл щита" } ] } 
    tellraw @s[tag=show_crystals, scores={crys_return=1}] { "rawtext": [{ "text": "§dАктивен кристалл второй жизни" } ] } 
    tellraw @s[tag=show_crystals, scores={crys_sw_respawn=1}] { "rawtext": [{ "text": "§aАктивен кристалл быстрого возрождения" } ] } 

    tag @s remove show_crystals

# Фракционка
    tellraw @s { "rawtext": [{ "text": "§6=====§aФРАКЦИИ§6=====" } ] } 

    tellraw @s[scores={faction=0}] { "rawtext": [{ "text": "§eВы не состоите ни в какой фракции. Чтобы вас приняли, попросите участников какой-то фракции об этом." } ] }
    tellraw @s[scores={faction=1}] { "rawtext": [{ "text": "§dВаша фракция - Полуночники" } ] }
    tellraw @s[scores={faction=2}] { "rawtext": [{ "text": "§dВаша фракция - Граждане Сандерры" } ] }
    tellraw @s[scores={faction=3}] { "rawtext": [{ "text": "§dВаша фракция - Предвестники чумы" } ] }

# Проблемы
    tag @s[scores={UID=0..}] add has_uid
    tellraw @s[tag=!has_uid] { "rawtext": [ { "text": "§c>>> Внутренняя ошибка UID игрока. §aИсправлено в автоматическом режиме." } ] }
    scoreboard players random @s[tag=!has_uid] UID 0 1000000000
    tag @s remove has_uid