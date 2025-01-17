tag @p add self
tag @p[tag=self, hasitem={item=arx:might_up}] add has_upgrade

tellraw @p[tag=self, tag=has_upgrade] { "rawtext": [ { "text": "§cУ вас уже есть предмет возвышения Могущества!" } ] }
tellraw @p[tag=self, tag=!has_upgrade] { "rawtext": [ { "text": "§dТень Могущества дарует вам свою силу" } ] }
give @p[tag=self, tag=!has_upgrade] arx:might_up
						
tag @p remove has_upgrade
tag @p remove self