import { traitsList } from './traitsList'

/*
Черты хранятся в dynamicProperty игрока вида trait:traitId = ( 0 == нет черты || 1 == есть черта || 2 == закреп )
*/

// Выводим ВСЕ СУЩЕСТВУЮЩИЕ черты характера
export function display_all_traits(trait_list) {
    let result = ''

    // Display positive traits
    result += '§eПоложительные§f:\n'
    for (const traitKey in traitsList.positive) {
        const trait = traitsList.positive[traitKey]
        result += ` §f§l${trait.name}§r: §7${trait.description}\n`
    }

    // Display neutral traits
    result += '\n§bНейтральные§f:\n'
    for (const traitKey in traitsList.neutral) {
        const trait = traitsList.neutral[traitKey]
        result += ` §f§l${trait.name}§r: §7${trait.description}\n`
    }

    // Display negative traits
    result += '\n§cОтрицательные§f:\n'
    for (const traitKey in traitsList.negative) {
        const trait = traitsList.negative[traitKey]
        result += ` §f§l${trait.name}§r: §7${trait.description}\n`
    }

    return result
}



// Выводим черты характера ПОЛЬЗОВАТЕЛЯ
export function display_my_traits(player) {
    let result = '';

    // Вспомогательная функция для проверки наличия черты
    function hasTrait(traitKey) {
        const dpValue = player.getDynamicProperty(`trait:${traitKey}`);
        return dpValue === 1 || dpValue === 2 ? dpValue : 0;
    }

    // Функция добавления черт из категории
    function addTraitsFrom(category, title, iconNotLocked, iconLocked) {
        const traits = traitsList[category];
        const foundTraits = [];

        for (const traitKey in traits) {
            const status = hasTrait(traitKey);
            if (status > 0) {
                const trait = traits[traitKey];
                const icon = status === 2 ? iconLocked : iconNotLocked
                const lockText = status === 2 ? '§d' : '§f'
                foundTraits.push(`§r${icon} ${lockText}${trait.name}§r: §7${trait.description}`);
            }
        }

        if (foundTraits.length > 0) {
            if (result !== '') {
                result += '\n' + title + '\n';
            } else {
                result += title + '\n';
            }
            result += foundTraits.join('\n') + '\n';
        }
    }

    // Собираем черты по категориям
    addTraitsFrom('positive', '§eПоложительные§f:', '', '');
    addTraitsFrom('neutral', '§bНейтральные§f:', '', '');
    addTraitsFrom('negative', '§cОтрицательные§f:', '', '');

    // Если ни одной черты нет
    if (result === '') {
        result = '§7У вас пока нет ни одной черты характера.';
    }

    return result;
}



export function how_traits_work(player) {
    let text = ''

    text += '§r§f[§ai§f] Черты характера - это:\n§o- Свойства личности вашего персонажа, влияющие на него. Бывают §eположительные§f, §bнейтральные§f и §cотрицательные§f.'

    text += '\n\n§r§f[§ai§f] Как получить черту:\n§o- Находитесь под стрессом 4 ур . У вас будет вероятность получить случайную черту.'

    text += '\n\n§r§f[§ai§f] Как снять черту:\n§o- Получите счастье 4 ур. , и незакреплённые черты сразу же снимутся.'

    text += '\n\n§r§f[§ai§f] Закреплённость черты:\n§o- Если вы получите черту характера, которая у вас уже есть, то эта черта станет §lзакреплённой§r§f§o. Такие черты уже не снять 4-м уровнем счастья.'

    text += '\n\n§r§f[§ai§f] Иконки:\n §oПоложительная незакреп.§r§f\n §oПоложительная закреп.§r§f\n §oНейтральная незакреп.§r§f\n §oНейтральная закреп.§r§f\n §oОтрицательная незакреп.§r§f\n §oОтрицательная закреп.§r§f'

    return text
}