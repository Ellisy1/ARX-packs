tag @p add self
execute @p[scores={verify=2, debugtp_drct=0}] ~ ~ ~ execute @p[tag=self, scores={check_one_point=2..}] ~ ~ ~ tp @p ~0.001 ~ ~
execute @p[scores={verify=2, debugtp_drct=1}] ~ ~ ~ execute @p[tag=self, scores={check_one_point=2..}] ~ ~ ~ tp @p ~-0.001 ~ ~
execute @p[scores={verify=2, debugtp_drct=2}] ~ ~ ~ execute @p[tag=self, scores={check_one_point=2..}] ~ ~ ~ tp @p ~ ~ ~0.001
execute @p[scores={verify=2, debugtp_drct=3}] ~ ~ ~ execute @p[tag=self, scores={check_one_point=2..}] ~ ~ ~ tp @p ~ ~ ~-0.001
scoreboard players set @p[tag=self, scores={check_one_point=2..}] check_one_point 0
scoreboard players add @p[scores={verify=2}] debugtp_drct 1
scoreboard players set @p[scores={verify=2, debugtp_drct=4}] debugtp_drct 0
tag @a[r=0.1] remove self