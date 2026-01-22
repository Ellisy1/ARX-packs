import { world, Player } from "@minecraft/server";

/**
 * Возвращает ближайшего игрока к заданному игроку в пределах заданного расстояния.
 * @param {Player} self Игрок, относительно которого ищется ближайший.
 * @param {number} [limitDistance=Infinity] Максимальное расстояние (в блоках). По умолчанию — Infinity (без ограничений).
 * @returns {Player | undefined} Ближайший игрок в пределах limitDistance, или undefined.
 */
export function getNearestPlayer(self, limitDistance = Infinity) {
    if (!(self instanceof Player)) {
        console.warn("getNearestPlayer: self должен быть объектом Player!");
        return undefined;
    }

    if (typeof limitDistance !== 'number' || limitDistance < 0) {
        console.warn("getNearestPlayer: limitDistance должен быть неотрицательным числом!");
        return undefined;
    }

    const allPlayers = Array.from(world.getPlayers());
    if (allPlayers.length <= 1) {
        return undefined; // Нет других игроков
    }

    let nearestPlayer = undefined;
    let nearestDistanceSquared = Infinity;

    const selfLocation = self.location;
    const limitDistanceSquared = limitDistance * limitDistance; // Квадрат для сравнения

    for (const player of allPlayers) {
        if (player === self) continue;

        const loc = player.location;
        const dx = loc.x - selfLocation.x;
        const dy = loc.y - selfLocation.y;
        const dz = loc.z - selfLocation.z;

        const distanceSquared = dx * dx + dy * dy + dz * dz;

        // Пропускаем игроков за пределами лимита
        if (distanceSquared > limitDistanceSquared) continue;

        // Ищем минимальное расстояние
        if (distanceSquared < nearestDistanceSquared) {
            nearestDistanceSquared = distanceSquared;
            nearestPlayer = player;
        }
    }

    return nearestPlayer;
}