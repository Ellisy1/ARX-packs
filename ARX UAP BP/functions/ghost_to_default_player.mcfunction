tag @p add self

#Действия в нормальной позиции
execute @p[tag=self, rxm=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aЯ могу сейчас это использовать, чтобы вернуться в своё настоящее тело." } ] } 
execute @p[tag=self, rxm=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ tellraw @p { "rawtext": [ { "text": "§8§oЕсли вы уверены, что хотите перестать быть призраком и вернуться в настоящее тело, поднимите камеру вертикально вверх и используйте этот предмет ещё раз." } ] } 
execute @p[tag=self, rxm=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ tellraw @p { "rawtext": [ { "text": "§8§oВы навсегда обретёте хорошую черту характера, но потеряете свой опыт АS&S и вложенные очки обучения." } ] } 
execute @p[tag=self, rxm=-89, scores={class=1, xp_stage=..6}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§fЯ смогу это использовать, чтобы вернуться в своё настоящее тело, когда достигну седьмого уровня АS&S." } ] } 
execute @p[tag=self, rxm=-89, scores={class=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§fЕсли вдруг я стану призраком, мне это пригодится." } ] } 

#Действия при поднятой камере
#Чего-то не хватает
    execute @p[tag=self, rx=-89, scores={class=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§fЯ не призрак." } ] } 
    execute @p[tag=self, rx=-89, scores={class=1, xp_stage=..6}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§fМне не хватает опыта. Будет достаточно 7-го уровня АS&S." } ] } 
#Успех
    execute @p[tag=self, rx=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ event entity @s arx:return_default_family_data
    execute @p[tag=self, rx=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aВы обретаете материальность!" } ] } 
    execute @p[tag=self, rx=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ playsound undemon @a ~ ~ ~ 30
    execute @p[tag=self, rx=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ scoreboard players set @p speed_skill 0
    execute @p[tag=self, rx=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ scoreboard players set @p magic_skill 0
    execute @p[tag=self, rx=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ scoreboard players set @p strength_skill 0
    execute @p[tag=self, rx=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ scoreboard players set @p skill_point 0
    execute @p[tag=self, rx=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ clear @p arx:scroll_of_reborning 0 1
    #Черта
        execute @p[tag=self, rx=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ scoreboard players set @p c_seen_death 1
    #!!!Переменная в условии
        execute @p[tag=self, rx=-89, scores={class=1, xp_stage=7..}] ~ ~ ~ tag @p add success
        execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players set @p xp_stage 0
        execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players set @p xp 0
        execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players set @p class 0
        tag @p remove success
#

#Если нет инфо о классах
execute @p[tag=self, scores={class=!0..1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Системная ошибка scroll_of_reborning>>score_error>>class>>=!0..1" } ] } 

tag @p remove self