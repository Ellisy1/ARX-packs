import { traits_list } from './traits_list'

/*
Черты хранятся в dp вида trait:traitId = ( 0 == нет черты || 1 == есть черта || 2 == закреп )
*/

export function display_all_traits(trait_list) {
    let result = ''

    // Display positive traits
    result += '§eПоложительные§f:\n'
    for (const traitKey in traits_list.positive) {
        const trait = traits_list.positive[traitKey]
        result += ` §l${trait.name}§r: §7${trait.description}\n`
    }

    // Display neutral traits
    result += '\n§bНейтральные§f:\n'
    for (const traitKey in traits_list.neutral) {
        const trait = traits_list.neutral[traitKey]
        result += ` §l${trait.name}§r: §7${trait.description}\n`
    }

    // Display negative traits
    result += '\n§cОтрицательные§f:\n'
    for (const traitKey in traits_list.negative) {
        const trait = traits_list.negative[traitKey]
        result += ` §l${trait.name}§r: §7${trait.description}\n`
    }

    return result
}

export function display_my_traits(player) {
    let result = '';

    // Вспомогательная функция для проверки наличия черты
    function hasTrait(traitKey) {
        const dpValue = player.getDynamicProperty(`trait:${traitKey}`);
        return dpValue === 1 || dpValue === 2 ? dpValue : 0;
    }

    // Функция добавления черт из категории
    function addTraitsFrom(category, title, icon) {
        const traits = traits_list[category];
        const foundTraits = [];

        for (const traitKey in traits) {
            const status = hasTrait(traitKey);
            if (status > 0) {
                const trait = traits[traitKey];
                const pin = status === 2 ? '§a●§f' : '○'; // ● = закреплена, ○ = обычная
                foundTraits.push(`  ${pin} ${trait.name}: §7${trait.description}`);
            }
        }

        if (foundTraits.length > 0) {
            result += title + '\n';
            result += foundTraits.join('\n') + '\n';
        }
    }

    // Собираем черты по категориям
    addTraitsFrom('positive', '§eПоложительные§f:', '');
    addTraitsFrom('neutral', '§bНейтральные§f:', '');
    addTraitsFrom('negative', '§cОтрицательные§f:', '');

    // Если ни одной черты нет
    if (result === '') {
        result = '§7У вас пока нет ни одной черты характера.';
    }

    return result;
}

export function how_traits_work(player) {
    return "123"
}