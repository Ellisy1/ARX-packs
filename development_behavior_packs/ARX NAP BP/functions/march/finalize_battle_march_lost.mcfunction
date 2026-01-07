# Открытие дверей
    # Внутренняя
        fill 61 19 -191 61 21 -192 air
    # Внешняя
        fill 42 19 -191 42 21 -192 air

# Устанавливаем, что Март был побежден
    scoreboard players set @a[scores={verify=2}] march_defeated 1

# Оканчиваем счет времени
    scoreboard players set @a[scores={verify=2}] march_battle_time 0

# Сообщаем о возможном луте
    tellraw @a[r=15] { "rawtext": [ { "text": "§dМарт побеждён!\n§6§l--- §aШансы выпадения:§r\n§d100% §a0 - 2 хромовый самородок §e[Легендарное]\n§d100% §a1 - 3 §aЭссенция опыта §g[Эпическое]\n§d10% §r§aПотоковый ускоритель §c[Мифическое]\n§d4% §r§aВенок Марта §r§f[Ā2 §1MP§f8] §c[Мифическое+++]\n§d2% §r§aУльтраёмкая батарея §b2000§fŐ §c[Мифическое+++]\n§d1% §r§aДрафоритовый слиток §c[Мифическое+++]" } ] }

kill @e[type=arx:march_sitting_calm]

# Вызываем избитого марта
    execute if entity @a[scores={verify=2, march_defeated=1}] run summon arx:march_sitting_calm 52.0 19 -199 facing ~ ~ ~10000000

event entity @e[type=arx:rat_monstr_meca, x=43, y=18, z=-200, dx=17, dy=10, dz=17] despawn