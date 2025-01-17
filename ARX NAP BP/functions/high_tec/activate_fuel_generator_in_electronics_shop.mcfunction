# Контрольный тег
    tag @s[hasitem={item=arx:canister_full, location=slot.weapon.mainhand}] add has_full_canister

# Если есть канистра
    w @s[tag=has_full_canister] §eВы заправляете устройство с помощью канистры...
    replaceitem entity @s[tag=has_full_canister] slot.weapon.mainhand 0 arx:canister_empty
    execute if entity @s[tag=has_full_canister] run playsound pour_fuel_into_generator @a ~ ~ ~
    execute if entity @s[tag=has_full_canister] run scoreboard players add @a[scores={verify=2}] generator_in_electronics_shop_cd 20

# Если нет канистры
    w @s[tag=!has_full_canister] §eКажется, в это устройство можно что-то влить

# Завершение
    tag @s remove has_full_canister
    tag @s remove __activate_fuel_generator_in_electronics_shop__