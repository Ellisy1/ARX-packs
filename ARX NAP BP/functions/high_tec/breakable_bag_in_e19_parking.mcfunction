# Табличка блок
# Анализ
    tag @s[hasitem={item=arx:descriptor, location=slot.armor.head}] add descriptor_equipped
    tag @s[scores={battery_charge=200..}] add has_enough_charge

# Недопуск
    tellraw @s[scores={sk_a_26=0}] { "rawtext": [ { "text": "§cЯ не умею читать" } ] }

    tellraw @s[scores={sk_a_26=1, battery_avail=0}] { "rawtext": [ { "text": "§cНа бумаге в кейсе явно что-то написано, но язык вам абсолюно незнаком." } ] }
    tellraw @s[scores={sk_a_26=1, battery_avail=1}, tag=!descriptor_equipped] { "rawtext": [ { "text": "§cНа бумаге в кейсе явно что-то написано, но язык вам абсолюно незнаком." } ] }

    tellraw @s[scores={sk_a_26=1, battery_avail=1}, tag=!has_enough_charge, tag=descriptor_equipped] { "rawtext": [ { "text": "§cНедостаточно заряда батарей для расшифровки. Требуется 200§fŐ" } ] }

# Успех
    execute as @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] run tellraw @s { "rawtext": [ { "text": "§f[§bПереведено§f>>> §o§lДиректива: ИСХ.218-ЛИКЛ/О218\n§r§f§o§lТема:§r§f§o Регуляция излучения Лунного Инфракрасного Лазера (ЛИКЛ) – Операция 218\nУровень доступа: «Military X-Safe»\n\n§lОснова:§r§f§o\nПротокол регулирования ЛИКЛ для обеспечения стабилизации “Призрачных Личностей” (П-Л) и стандартизированного проведения процедуры реинкарнации погибших людей. Ваша цель - установить удовлетварительное значение (185 кВт) мощности ЛИКЛ используя радиорадар Оклик-6 (URKM-5F8E7D827D2C10A1).\n\n§lПараметры мощности ЛИКЛ:§r§f§o\n< 100 кВт: Неэффективно. Отсутствие воздействия на П-Л, они погибают спустя 48 - 96 часов после фактической смерти человека.\n100 - 150 кВт: Минимальная стабилизация П-Л. Применимо в особых случаях.\n150 - 200 кВт: Адекватная стабилизация П-Л. Оптимально для проведения процедуры реинкарнации.\n200 - 400 кВт: Не рекомендуется. Повышенный риск нестабильности П-Л.\n> 400 кВт: Запрещено. Угроза неконтролируемой активности П-Л.\n\n§lОтветственность:§r§f§o\nОтклонение от протокола влечет за собой преследование по закону. Внеочередно докладывать о любых отклонениях.\nВ случае любой неисправности оборудования или подозрений в его неисправности внеочередно завершить миссию и отчитаться в ЭНИИ.\n§lЭНИИ / Утверждено 05-07-29.§r§f]" } ] }
    execute as @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] run scoreboard players add @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] battery_charge -200

# Чистка
    tag @s remove descriptor_equipped
    tag @s remove has_enough_charge