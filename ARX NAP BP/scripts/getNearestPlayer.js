import { world, Player } from "@minecraft/server";

/**
 * Возвращает ближайшего игрока к заданному игроку.
 * @param {Player} self Игрок, относительно которого ищется ближайший.
 * @returns {Player | undefined} Ближайший игрок, или undefined, если игроков нет.
 */
export function getNearestPlayer(self) {
  if (!(self instanceof Player)) {
    console.warn("getNearestPlayer: self должен быть объектом Player!");
    return undefined; // Или выбросить ошибку, если это более уместно
  }

  const allPlayers = Array.from(world.getPlayers()); // Преобразуем итератор в массив
  if (allPlayers.length === 0) {
    return undefined; // Нет игроков на сервере
  }

  let nearestPlayer = undefined;
  let nearestDistanceSquared = Infinity; // Инициализируем бесконечностью

  const selfLocation = self.location;

  for (const player of allPlayers) {
    if (player === self) {
      continue; // Не сравниваем игрока с самим собой
    }

    const playerLocation = player.location;
    const dx = playerLocation.x - selfLocation.x;
    const dy = playerLocation.y - selfLocation.y;
    const dz = playerLocation.z - selfLocation.z;

    const distanceSquared = dx * dx + dy * dy + dz * dz; // Квадрат расстояния (оптимизация)

    if (distanceSquared < nearestDistanceSquared) {
      nearestDistanceSquared = distanceSquared;
      nearestPlayer = player;
    }
  }

  return nearestPlayer;
}