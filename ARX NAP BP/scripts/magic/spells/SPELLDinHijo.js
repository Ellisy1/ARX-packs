import { findSpell } from '../findSpell';
import { spellsList } from '../spells_list';

export function dinHijo(player, channels) {
    for (let i = 1; i <= channels; i++) {
        const spellIndex = findSpell(player, i, 'index');
        const spellName = spellIndex !== undefined ? spellsList[spellIndex] : null;
        const message = spellName
            ? `У меня в §d${i}§f канале заготовлено §6${spellName}`
            : `У меня в §d${i}§f канале не заготовлено заклинаний`;
        player.runCommand(`tellraw @s { "rawtext": [ { "text": "${message}" } ] }`);
    }
    player.setDynamicProperty('hasEverCastedDinHijo', true);
}