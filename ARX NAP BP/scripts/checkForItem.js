import { system, world, EntityComponentTypes, EquipmentSlot } from "@minecraft/server"

export function checkForItem(player, strSlot, itemId, report = false) {
    // Преобразуем строку слота в EquipmentSlot
    let slot // Фактический слот с корректным типом данных
    switch (strSlot.toLowerCase()) { // Для регистронезависимости
        case "head":
            slot = EquipmentSlot.Head;
            break
        case "chest":
            slot = EquipmentSlot.Chest;
            break
        case "legs":
            slot = EquipmentSlot.Legs;
            break
        case "feet":
            slot = EquipmentSlot.Feet;
            break
        case "mainhand":
            slot = EquipmentSlot.Mainhand;
            break
        case "offhand":
            slot = EquipmentSlot.Offhand;
            break
        default:
            console.error(`Указан недопустимый слот в EquipmentSlot: ${strSlot}`)
    }

    // Определяем предмет в слоте
    const currentItem = player.getComponent(EntityComponentTypes.Equippable).getEquipment(slot)

    if (report) { console.warn(currentItem?.typeId, itemId) }

    // Определяем, совпадает предмет в слоте с запрошенным предметом
    if (currentItem?.typeId === itemId) {
        return true
    } else {
        return false
    }
}