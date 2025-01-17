playsound click @a ~ ~ ~ 

execute if entity @a[scores={verify=2, hail6_enabled=1..}] run tag @a[scores={verify=2}] add __hail6_control__

# Только если есть электричество
    execute if entity @a[scores={verify=2, e19_tracer_condition=11}, tag=!__hail6_control__] run scoreboard players set @a[scores={verify=2}] hail6_enabled 1
    execute if entity @a[scores={verify=2, e19_tracer_condition=11}, tag=__hail6_control__] run scoreboard players set @a[scores={verify=2}] hail6_enabled 0


tag @a remove __hail6_control__