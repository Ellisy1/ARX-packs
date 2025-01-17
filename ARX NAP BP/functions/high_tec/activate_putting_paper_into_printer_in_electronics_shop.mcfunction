# Контрольный тег
    tag @s[hasitem={item=arx:blueprint_paper, location=slot.weapon.mainhand}] add has_blueprint_paper

# Если есть чертежная бумага
    w @s[tag=has_blueprint_paper] §eВы кладете чертёжную бумагу в устройство...
    clear @s[tag=has_blueprint_paper] arx:blueprint_paper 0 1
    execute if entity @s[tag=has_blueprint_paper] run fill -159 60 138 -159 60 138 arx:printer_in_electronics_shop_with_paper

# Если нет чертежной бумаги
    w @s[tag=!has_blueprint_paper] §eКажется, сюда можно что-то положить

# Завершение
    tag @s remove has_blueprint_paper
    tag @s remove __activate_putting_paper_into_printer_in_electronics_shop__