export function getMoscowTime() { // Функция возвращает московское время
    // Получаем время
    let currentTime = new Date()

    // Реализуем часовой пояс
    currentTime.setHours(currentTime.getHours() + 3)

    return currentTime
}