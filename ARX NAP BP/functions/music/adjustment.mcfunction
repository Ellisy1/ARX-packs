#Опции громкости music_volume = 0 10 20 .. 90 100
tag @p add self

stopsound @p[tag=self, scores={music_volume=!-1}]

scoreboard players set @p[tag=self, rx=-74, rxm=-90] music_volume 100
scoreboard players set @p[tag=self, rx=-57, rxm=-74] music_volume 90
scoreboard players set @p[tag=self, rx=-40, rxm=-57] music_volume 80
scoreboard players set @p[tag=self, rx=-25, rxm=-40] music_volume 70
scoreboard players set @p[tag=self, rx=-8, rxm=-25] music_volume 60
scoreboard players set @p[tag=self, rx=8, rxm=-8] music_volume 50
scoreboard players set @p[tag=self, rx=25, rxm=8] music_volume 40
scoreboard players set @p[tag=self, rx=40, rxm=25] music_volume 30
scoreboard players set @p[tag=self, rx=57, rxm=40] music_volume 20
scoreboard players set @p[tag=self, rx=74, rxm=57] music_volume 10
scoreboard players set @p[tag=self, rx=90, rxm=74] music_volume -1

scoreboard players set @p music_delay 0

tellraw @p[tag=self, scores={music_volume=!50, music_volume=0..}] { "rawtext": [ { "text": "Установлена громкость: " }, { "score": {"name": "@p", "objective": "music_volume" } }, { "text": "%" } ] }
tellraw @p[tag=self, scores={music_volume=50, music_volume=0..}] { "rawtext": [ { "text": "Установлена громкость: " }, { "score": {"name": "@p", "objective": "music_volume" } }, { "text": "% §a(рекомендуется)" } ] }
tellraw @p[tag=self, scores={music_volume=-1}] { "rawtext": [ { "text": "Установлена громкость: 0% §c(музыка отключена)" } ] }
tag @p remove self