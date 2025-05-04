// commandQueueOperations.js

const commandQueue = []; // Очередь команд

/**
 * Добавляет команду в очередь для выполнения.
 * @param {import("@minecraft/server").Player} player Объект игрока, для которого выполняется команда.
 * @param {string} command Команда, которую нужно выполнить.
 */
export function queueCommand(player, command) {
  commandQueue.push({ player: player, command: command })
}

function processCommandQueue() {
  while (commandQueue.length > 0) {
    const commandData = commandQueue.shift();
    try {
      commandData.player.runCommand(commandData.command);
    } catch (error) {
      commandData.player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cИз-за технических особенностей невозможно отправить сообщение, содержащее двойную кавычку или обратный слеш." } ] }`);
    }
  }
}

import { system } from "@minecraft/server";
system.runInterval(processCommandQueue, 1); // Обрабатываем очередь каждую 1 тик