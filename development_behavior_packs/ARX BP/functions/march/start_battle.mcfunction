# Спавним Марта
    summon arx:march 52.0 39 -191.0 facing ~-1000000 ~ ~

# Шум закрывания дверей
    execute if block 61 19 -191 minecraft:air run playsound abrupt_closing_of_metal_door @a 61 19 -191
    execute if block 42 19 -191 minecraft:air run playsound abrupt_closing_of_metal_door @a 42 19 -191

# Тряка камеры
    camerashake add @a[x=38, y=18, z=-205, dx=27, dy=10, dz=27] 1.20 0.5 positional 

# Закрываем все двери
    fill 61 19 -191 61 21 -192 arx:bronze_block
    fill 42 19 -191 42 21 -192 arx:bronze_block

# Отключаем свет из пола
    fill 48 17 -195 55 17 -188 minecraft:air