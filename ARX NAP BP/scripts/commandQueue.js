// commandQueueOperations.js

const commandQueue = []; // Очередь команд

/**
 * Добавляет команду в очередь для выполнения.
 * @param {import("@minecraft/server").Player} player Объект игрока, для которого выполняется команда.
 * @param {string} command Команда, которую нужно выполнить.
 */
export function queueCommand(player, command) {
  let allowCommand = !String.raw`${command}`.includes(String.raw`\ `)
  if (allowCommand) {
    commandQueue.push({ player: player, command: command })
  }
  else {
    queueCommand(player, `tellraw @s { "rawtext": [ { "text": "§cИспользование обратного слеша в данном контексте недопустимо." } ] }`)
  }
}

function processCommandQueue() {
  while (commandQueue.length > 0) {
    const commandData = commandQueue.shift();
    try {
      commandData.player.runCommand(commandData.command);
    } catch (error) {
      console.error(`Ошибка при выполнении команды "${commandData.command}":`, error);
    }
  }
}

import { system } from "@minecraft/server";
system.runInterval(processCommandQueue, 1); // Обрабатываем очередь каждую 1 тик