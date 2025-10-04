import { system, world } from "@minecraft/server";

// Глобальное хранилище: ключ — "x,y,z", значение — { x, y, z, biome }
const biomeBlocks = new Map(); // лучше Map, чем обычный объект

/**
 * Извлекает название биома из тега игрока вида "BIOME_desert"
 * @param {Player} player
 * @returns {string | null} — например, "desert"
 */
function getBiomeFromPlayer(player) {
    for (const tag of player.getTags()) {
        if (tag.startsWith("BIOME_")) {
            return tag.substring(6); // "BIOME_desert" → "desert"
        }
    }
    return null;
}

/**
 * Получает все блоки вокруг игрока с координатами, кратными 10
 */
function getBlocksAtMultiplesOf10(player, radius = 30) {
    const dim = player.dimension;
    const loc = player.location;

    // Горизонтальные границы (X, Z) — как раньше
    const startX = Math.floor((loc.x - radius) / 10) * 10;
    const endX = Math.floor((loc.x + radius) / 10) * 10;
    const startZ = Math.floor((loc.z - radius) / 10) * 10;
    const endZ = Math.floor((loc.z + radius) / 10) * 10;

    // Вертикальные границы (Y) — только ±10 от игрока, шаг 5
    const startY = Math.max(0, Math.floor((loc.y - 10) / 5) * 5);
    const endY = Math.min(319, Math.floor((loc.y + 10) / 5) * 5);

    const blocks = [];

    for (let x = startX; x <= endX; x += 10) {
        for (let z = startZ; z <= endZ; z += 10) {
            for (let y = startY; y <= endY; y += 5) { // ← шаг 5 по Y
                const block = dim.getBlock({ x, y, z });
                if (block) {
                    blocks.push(block);
                }
            }
        }
    }

    return blocks;
}

// Основной цикл
system.runInterval(() => {
    // Очищаем карту перед новым проходом? Нет — лучше накапливать, но можно и обновлять.
    // Вариант: оставляем всё, что есть, и обновляем/добавляем заново.
    // Но если игрок ушёл — блоки останутся. Поэтому лучше **пересобирать полностью** каждый раз.

    biomeBlocks.clear(); // ← пересоздаём список каждый тик (или каждые 40 тиков)

    for (const player of world.getPlayers()) {
        const biome = getBiomeFromPlayer(player);
        if (!biome) continue; // игрок не в "отслеживаемом" биоме

        const nearbyBlocks = getBlocksAtMultiplesOf10(player, 12);

        for (const block of nearbyBlocks) {
            const key = `${block.x},${block.y},${block.z}`;
            // Сохраняем блок с биомом игрока
            biomeBlocks.set(key, {
                x: block.x,
                y: block.y,
                z: block.z,
                biome: biome
            });
        }
    }

    // === Теперь можно использовать biomeBlocks для частиц ===
    // Например, раз в несколько тиков спавнить частицы
    for (const blockData of biomeBlocks.values()) {

        if (blockData.biome === 'desert') world.getDimension("overworld").runCommand(`particle arx:ambience_desert ${blockData.x} ${blockData.y} ${blockData.z}`)
        if (blockData.biome === 'forest' && Math.random() < 0.3) world.getDimension("overworld").runCommand(`particle arx:forest_ambient_leaf ${blockData.x} ${blockData.y} ${blockData.z}`)
        if (blockData.biome === 'river' || blockData.biome === 'ocean' || blockData.biome === 'beach') world.getDimension("overworld").runCommand(`particle arx:river_fog ${blockData.x} ${blockData.y} ${blockData.z}`)
    }
}, 40)