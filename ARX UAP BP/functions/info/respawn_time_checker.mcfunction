execute @s[scores={respawn_delay=-1}, tag=rp_is_dead] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§cВы окончательно мертвы. Если вы хотите зарегистрировать нового персонажа, обратитесть к управляющим." } ] }
execute @s[scores={respawn_delay=-1}, tag=!rp_is_dead] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§6Вы вырублены. Дождитесь, пока вас решат возродить." } ] }
execute @s[scores={respawn_delay=1..}] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§aДо возрождения осталось §6" }, { "score": {"name": "@s", "objective": "respawn_delay" } }, { "text": "§a сек." } ] }

execute @s[scores={respawn_delay=0}] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§6У вас не установлен счётчик возрождения." } ] }