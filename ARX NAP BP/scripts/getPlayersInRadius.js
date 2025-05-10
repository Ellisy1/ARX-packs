import { world, Player } from "@minecraft/server";

/**
 * Возвращает массив игроков в заданном радиусе от указанного игрока.
 * @param {Player} self Игрок, относительно которого ищется.
 * @param {number} radius Радиус поиска в блоках.
 * @returns {Player[]} Массив игроков в радиусе.
 */
export function getPlayersInRadius(self, radius) {
    if (!(self instanceof Player)) {
        console.warn("getPlayersInRadius: self должен быть объектом Player!");
        return []; // Возвращаем пустой массив, если self не Player
    }

    if (typeof radius !== 'number' || radius <= 0) {
        console.warn("getPlayersInRadius: radius должен быть положительным числом!");
        return []; // Возвращаем пустой массив, если радиус некорректен
    }

    const playersInRadius = [];
    const allPlayers = Array.from(world.getPlayers());

    const selfLocation = self.location;
    const radiusSquared = radius * radius; // Квадрат радиуса для оптимизации

    for (const player of allPlayers) {
        if (player === self) {
            continue; // Не включаем игрока самого в себя
        }

        const playerLocation = player.location;
        const dx = playerLocation.x - selfLocation.x;
        const dy = playerLocation.y - selfLocation.y;
        const dz = playerLocation.z - selfLocation.z;

        const distanceSquared = dx * dx + dy * dy + dz * dz;

        if (distanceSquared <= radiusSquared) {
            playersInRadius.push(player);
        }
    }

    return playersInRadius;
}