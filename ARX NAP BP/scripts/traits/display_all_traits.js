import { traits_list } from './traits_list'

export function display_all_traits(trait_list) {
    let result = ''

    result += 'Положительные:\n'
    for (const trait in traits_list.positive) {
        result += `${traits_list.positive.trait.name}: ${traits_list.positive.trait.description}\n`
    }
}