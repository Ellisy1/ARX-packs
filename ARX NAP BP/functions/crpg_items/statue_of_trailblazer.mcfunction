tag @p add self
tag @p[tag=self, hasitem={item=arx:trailblazer_up}] add has_upgrade

tellraw @p[tag=self, tag=has_upgrade] { "rawtext": [ { "text": "§cУ вас уже есть предмет возвышения навыка Первопроходца!" } ] }
tellraw @p[tag=self, tag=!has_upgrade] { "rawtext": [ { "text": "§eТень Первопроходца дарует вам свою силу" } ] }
give @p[tag=self, tag=!has_upgrade] arx:trailblazer_up
						
tag @p remove has_upgrade
tag @p remove self