import { world } from "@minecraft/server"

import { queueCommand } from "./commandQueue"

// Все Арксовские порталы
export const portals = {
    // Люменессионные, АКА активные порталы. Представляют собой данные портал - точка назначения
    "lumenession": {
        // Выход из основных порочных садов
        "portal_in_vicious_gardens": {
            "location": [-2256, 22, 1789],
            "destination": [-2236, 63, 1816]
        }
    },
    // Ноксенессионные, АКА пассивные порталы. Представляют собой цепочку порталов
    "noxenession": [
        // Порталы спавн - город
        [[-2245, 63, 1649], [-2420, 100, 1056]]
    ]
}

// Пытаемся телепортировать от свитка/закла
export function TPWithNoxenessionPortal(player, initiator, source) {
    // source - источник телепортации. Может быть либо scroll, либо spell

    // Проверяем, стоим ли мы в портале
    for (const chain of portals.noxenession) {
        let portalNum = 0
        for (const portal of chain) {
            // Получаем всех игроков в портале
            const players = getPlayersInRadiusFromCoords(portal, 1.9)
            if (players.includes(player)) {

                let destinationPortal

                // Если мы не в последнем портале в цепи
                if (hasIndex(chain, portalNum + 1)) {
                    destinationPortal = chain[portalNum + 1]
                }
                // Если мы в последнем портале в цепи
                else {
                    destinationPortal = chain[0]
                }

                player.runCommand('playsound portal.embark @a ~ ~ ~')
                player.runCommand('particle arx:portal_embark ~ ~1.3 ~')

                executeTelepotration(player, destinationPortal)

                if (source === "scroll") {
                    player.runCommand('clear @s arx:scroll_of_teleportation 0 1')
                }

                queueCommand(player, 'playsound portal.arrive @a ~ ~ ~')
                player.runCommand('camera @s fade time 0 2 2 color 100 0 180')
                player.runCommand('particle arx:portal_arrive ~ ~1.3 ~')
                player.runCommand('effect @s slowness 2 255 true')

                player.runCommand('tellraw @s { "rawtext": [ { "text": "§dВы проваливаетесь в обволакивающее вас пространство..." } ] }')

                return undefined

            }
            portalNum++
        }
    }
    initiator.runCommand('tellraw @s { "rawtext": [ { "text": "§cКажется, без портала это бесполезно..." } ] }')
}

// Исполнение телепортации
function executeTelepotration(player, coordinates) {
    const TPVector = { x: coordinates[0] + 0.5, y: coordinates[1], z: coordinates[2] + 0.5 }

    player.teleport(TPVector)
}

function hasIndex(arr, index) {
    return index >= 0 && index < arr.length;
}

// Считаем расстояние от портала до игрока
export function getPlayersInRadiusFromCoords(centerCoords, radius) {
    // Валидация координат
    if (!Array.isArray(centerCoords) || centerCoords.length < 3) {
        console.warn("getPlayersInRadiusFromCoords: centerCoords должен быть массивом из трёх чисел [x, y, z]!");
        return [];
    }

    const [x, y, z] = centerCoords;

    if (typeof x !== 'number' || typeof y !== 'number' || typeof z !== 'number') {
        console.warn("getPlayersInRadiusFromCoords: координаты должны быть числами!");
        return [];
    }

    // Валидация радиуса
    if (typeof radius !== 'number' || radius <= 0) {
        console.warn("getPlayersInRadiusFromCoords: radius должен быть положительным числом!");
        return [];
    }

    const playersInRadius = [];
    const allPlayers = Array.from(world.getPlayers());

    const radiusSquared = radius * radius;

    for (const player of allPlayers) {
        const loc = player.location;
        const dx = loc.x - x;
        const dy = loc.y - y;
        const dz = loc.z - z;
        const distanceSquared = dx * dx + dy * dy + dz * dz;

        if (distanceSquared <= radiusSquared) {
            playersInRadius.push(player);
        }
    }

    return playersInRadius;
}