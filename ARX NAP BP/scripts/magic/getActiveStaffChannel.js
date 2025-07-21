export function getActiveStaffChannel(player, channels) {
    const yRotation = player.getViewDirection().y;

    // Нормализуем диапазон с [-1..1] до [0..1]
    const yRotationNormalized = yRotation * 0.5 + 0.5

    // Определяем шаг между двумя точками
    const step = 1 / channels

    let currentStep = 0
    // Считаем канал, поднимаясь с низких каналов наверх
    for (let i = channels; i > 0; i--) {
        currentStep += step
        if (currentStep > yRotationNormalized) {
            return i
        }
    }
}