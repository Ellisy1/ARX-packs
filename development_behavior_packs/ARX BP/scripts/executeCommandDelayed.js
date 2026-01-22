import { world, system } from "@minecraft/server";

/**
 * Выполняет команду от лица игрока с задержкой в 1 секунду.
 * @param {Player} player Объект игрока, от чьего лица будет выполнена команда.
 * @param {string} command Команда, которую нужно выполнить.
 */

export function executeCommandDelayed(player, command) {
  system.runTimeout(() => {
    try {
      player.runCommand(command);
    } catch (error) {
      console.error(`Ошибка при выполнении команды "${command}" от лица игрока "${player.name}": ${error}`);
    }
  }, 20); // 20 тиков = 1 секунда (при стандартном TPS Minecraft)
}