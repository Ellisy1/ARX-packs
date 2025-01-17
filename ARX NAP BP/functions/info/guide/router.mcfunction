# Эта функция определяет режим работы гида - либо для обучения, либо для обычной игры

execute as @s[tag=learning] run function info/guide/learning
execute as @s[tag=!learning] run function info/guide/default