import { timeline } from './launchCameraUI'

// Подсвечиваем все таймкоды, которые у нас есть
export function indicateTimecodes(player) {
    // Определяем таймлайн игрока
    let playerTimeLine = timeline[player.name];

    let timecodeCounter = 0 // Считаем, какой таймкод мы сейчас обрабатываем
    for (const timecode of playerTimeLine) {
        player.runCommand(`particle arx:camera_indicate_timecode ${timecode.position.x} ${timecode.position.y} ${timecode.position.z}`)
        timecodeCounter++
    }
}