# Эта функция запускается 10ticks.mcfunction в NAP

# Теги кузнечных клещей
    tag @a[hasitem={item=arx:blacksmith_tongs, location=slot.weapon.offhand}] add tongs
    tag @a[hasitem={item=arx:blacksmith_tongs_super, location=slot.weapon.offhand}] add tongs
    tag @a[hasitem={item=arx:blacksmith_tongs_super, location=slot.weapon.offhand}] add tongs_super
    tag @a[hasitem={item=arx:blacksmith_tongs, location=slot.weapon.mainhand}] add tongs
    tag @a[hasitem={item=arx:blacksmith_tongs_super, location=slot.weapon.mainhand}] add tongs
    tag @a[hasitem={item=arx:blacksmith_tongs_super, location=slot.weapon.mainhand}] add tongs_super

# Обжигание
    execute @a[tag=!tongs_super, hasitem={item=arx:altaite_forged_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:altaite_hot_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:altaite_hot_protective_plate}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs, hasitem={item=arx:aluminum_forged_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:aluminum_hot_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:aluminum_hot_protective_plate}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:bronze_forged_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:bronze_hot_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:bronze_hot_protective_plate}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:caryite_forged_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:caryite_hot_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:caryite_hot_protective_plate}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs, hasitem={item=arx:cast_iron_forged_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:cast_iron_hot_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:cast_iron_hot_protective_plate}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:chloronite_forged_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:chloronite_hot_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:chloronite_hot_protective_plate}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:dorionite_forged_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:dorionite_hot_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:dorionite_hot_protective_plate}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:draphorite_forged_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:draphorite_hot_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:draphorite_hot_protective_plate}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs, hasitem={item=arx:duraluminum_forged_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:duraluminum_hot_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:duraluminum_hot_protective_plate}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:durasteel_forged_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:durasteel_hot_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:durasteel_hot_protective_plate}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:forfactorite_forged_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:forfactorite_hot_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:forfactorite_hot_protective_plate}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs, hasitem={item=arx:gold_forged_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:gold_hot_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:gold_hot_protective_plate}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:iron_forged_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:iron_hot_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:iron_hot_protective_plate}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:lamenite_forged_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:lamenite_hot_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:lamenite_hot_protective_plate}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:malafiotironite_forged_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:malafiotironite_hot_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:malafiotironite_hot_protective_plate}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:naginitis_forged_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:naginitis_hot_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:naginitis_hot_protective_plate}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:netherite_forged_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:netherite_hot_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:netherite_hot_protective_plate}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs, hasitem={item=arx:plumbum_forged_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:plumbum_hot_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:plumbum_hot_protective_plate}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:riolik_forged_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:riolik_hot_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:riolik_hot_protective_plate}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:steel_forged_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:steel_hot_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:steel_hot_protective_plate}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:tin_forged_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:tin_hot_billet}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs, hasitem={item=arx:tin_hot_protective_plate}] ~ ~ ~ damage @s 2 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:toliriite_forged_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:toliriite_hot_billet}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs_super, hasitem={item=arx:toliriite_hot_protective_plate}] ~ ~ ~ damage @s 4 fire
    execute @a[tag=!tongs, hasitem={item=minecraft:lava_bucket}] ~ ~ ~ damage @s 2 fire

# Чистка
    tag @a remove tongs
    tag @a remove tongs_super