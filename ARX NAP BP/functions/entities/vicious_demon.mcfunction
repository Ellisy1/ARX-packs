scoreboard players set @a[scores={verify=2}] vicious_demon 0
scoreboard players set @a[scores={verify=2}] vic_dem_defeated 1
# Проход через бронзовый проход
    fill -204 34 337 -204 36 335 air
# Блок на входе в комнату боя
    fill -191 56 336 -191 56 336 air
particle vicious_demon_spawn_flame_outward ~ ~1 ~
tellraw @a[r=15] { "rawtext": [ { "text": "§dПорочный демон побеждён!\n§6§l--- §aШансы выпадения:\n§r§d10% §aПорочная пика §c[Мифическое+]\n§d10% §aПорочный посох §c[Мифическое+]\n§d10% §aПорочный кинжал §c[Мифическое+]\n§d20% §aРуна nakamata §c[Мифическое++]\n§d100% §aСущность порочного демона §c[Мифическое++]\n§d4% §aКомпозитный пиломеч демона §c[Мифическое+++]\n§d100% 1-3 §aЭссенция опыта §g[Эпическое]" } ] }