import { system, world, EntityComponentTypes, EquipmentSlot } from "@minecraft/server"

export function checkForItem(player, strSlot, itemId, report = false) {
    const lowerSlot = strSlot.toLowerCase();

    // Отдельная обработка инвентаря
    if (lowerSlot === "inventory") {
        const inventory = player.getComponent(EntityComponentTypes.Inventory);
        if (!inventory?.container) {
            report && console.warn("Inventory component missing");
            return false;
        }

        // Проверяем все слоты инвентаря
        for (let i = 0; i < inventory.container.size; i++) {
            const item = inventory.container.getItem(i);
            if (item?.typeId === itemId) {
                report && console.warn(`Found in slot ${i}`);
                return true;
            }
        }
        return false;
    }

    // Обработка экипировочных слотов
    let slot;
    switch (lowerSlot) {
        case "head":
            slot = EquipmentSlot.Head;
            break;
        case "chest":
            slot = EquipmentSlot.Chest;
            break;
        case "legs":
            slot = EquipmentSlot.Legs;
            break;
        case "feet":
            slot = EquipmentSlot.Feet;
            break;
        case "mainhand":
            slot = EquipmentSlot.Mainhand;
            break;
        case "offhand":
            slot = EquipmentSlot.Offhand;
            break;
        default:
            console.error(`Недопустимый слот: ${strSlot}`);
            return false;
    }

    // Проверяем экипированный предмет
    const equippable = player.getComponent(EntityComponentTypes.Equippable);
    if (!equippable) {
        report && console.warn("Equippable component missing");
        return false;
    }

    const currentItem = equippable.getEquipment(slot);
    report && console.warn("Current item:", currentItem?.typeId);
    
    return currentItem?.typeId === itemId;
}