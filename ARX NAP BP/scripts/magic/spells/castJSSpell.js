// Imports
import { getNearestPlayer } from '../../getNearestPlayer';
import { getEntityFamilies } from '../../_main';
import { system } from "@minecraft/server"
import { spellRegistry } from './spellRegistry';

// Создает и возвращает объект spellData, хранящий в себе всё, что может пригодиться в обработке заклинания
function defineSpellData(player, runeSequence, currentTargetRaw) {
    let spellData = {}

    // 1 - на себя, 2 - по направлению взгляда
    if (![1, 2].includes(currentTargetRaw)) {
        console.log(`Получена неожиданная цель ${currentTargetRaw} в обработчике заклинаний для ${player.name}`)
    }

    // Определяем дальность действия заклинания
    let spellDistance = 10

    // Определяем, по площади ли заклинание? Если оно содержит руну disortari, то по площади
    const isAreaSpell = runeSequence.includes("disortari")

    // Определяем инициатора
    spellData['initiator'] = player

    // Определяем ближайшего игрока
    spellData['nearestPlayer'] = getNearestPlayer(player, spellDistance)

    // Определяем, используем ли мы закл на себя? (для быстрых запросов)
    spellData['castingOnSelf'] = currentTargetRaw == 1

    // Определяем цель
    spellData['targetRaw'] = currentTargetRaw

    // По площади ли заклинание?
    spellData['isAreaSpell'] = isAreaSpell

    // Определяем объекты целей
    let targets = []
    if (!isAreaSpell) {
        if (currentTargetRaw === 1) {
            targets = [player]
        }
        else if (currentTargetRaw === 2) {
            const rayHits = player.getEntitiesFromViewDirection({ maxDistance: spellDistance })
                .filter(hit => hit.entity.name !== player.name)
            if (rayHits.length > 0) {
                // Находим hit с минимальной дистанцией
                const nearestHit = rayHits.reduce((closest, current) =>
                    current.distance < closest.distance ? current : closest
                );
                targets = [nearestHit.entity];
            }
        }
    }
    else {
        if (currentTargetRaw === 1) {
            targets = player.dimension.getEntities({ location: player.location, maxDistance: spellDistance })
                .filter(entity => !getEntityFamilies(entity).includes('furniture'))
        } else {
            targets = player.dimension.getEntities({ location: player.location, maxDistance: spellDistance, minDistance: 0.001 })
                .filter(entity => !getEntityFamilies(entity).includes('furniture'))
        }
    }
    // Записываем в массив
    spellData['targets'] = targets

    // Создаем только если цель одна
    spellData['singleTarget'] = targets.length === 1 ? targets[0] : undefined

    // Всё составили, возвращаем
    return spellData
}

/**
 * Основная функция вызова заклинания. 
 * Напрямую вызывает заклинание, не проверяя требуемые условия
 * Управляет всей внутренней логикой заклинания
 * @param {Player} player
 * @param {string} runeSequence
 */
export function castJSSpell(player, runeSequence, target) {
    // Получаем нужное нам заклинание из реестра
    const spell = spellRegistry[runeSequence];
    if (!spell) return 'noSpell'

    // Получем spellData
    const spellData = defineSpellData(player, runeSequence, target)

    // Проверка: поддерживает ли заклинание выбранную цель?
    if (spell.validTargets !== undefined && !spell.validTargets.includes(spellData.targetRaw)) {
        return 'noValidTarget'
    }

    // Вызов обработчика конкретного заклинания с нужными данными для каждой сущности
    if (spellData.targets.length > 0) {
        let successfulCastsCounter = 0
        let wasWrongEntityType = false
        for (const entity of spellData.targets) {
            // Проверка onlyOnPlayers: true
            if (spell.onlyOnPlayers === true && entity.typeId !== 'minecraft:player') {
                wasWrongEntityType = true
                continue
            }
            // Луч заклинания
            if (!spellData.isAreaSpell && !spellData.castingOnSelf) spawnParticleTrail(spellData.initiator, entity, runeSequence)
            // Активируем заклинание
            spell.handler(entity, spellData)
            successfulCastsCounter++
        }
        if (successfulCastsCounter === 0 && wasWrongEntityType) return 'wrongEntityType'
        return 'ok'
    }
    else {
        return ('noValidEntity')
    }
}

function spawnParticleTrail(initiator, entity, runeSequence, delayTicks = 0.25) {
    let p0, p1;

    try {
        p0 = initiator.getHeadLocation();
        p1 = entity.getHeadLocation();
    } catch (e) {
        return;
    }

    // Определяем частицу
    const magicDirection = runeSequence.substring(0, 3)
    const particleName = `arx:magic_trace_${magicDirection}`

    const dx = p1.x - p0.x;
    const dy = p1.y - p0.y;
    const dz = p1.z - p0.z;

    const distance = Math.sqrt(dx * dx + dy * dy + dz * dz);
    const steps = Math.max(2, Math.round(distance * 1)); // минимум 2 точки

    for (let i = 1; i <= steps; i++) {
        const t = i / steps;
        const x = p0.x + dx * t;
        const y = p0.y + dy * t;
        const z = p0.z + dz * t;

        system.runTimeout(() => {
            initiator.dimension.spawnParticle(particleName, { x, y, z });
        }, (i - 1) * delayTicks);
    }
}