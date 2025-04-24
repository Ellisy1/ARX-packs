// Возвращает true, если можно начать кд, иначе false

import { EntityComponentTypes, EquipmentSlot, ItemComponentTypes } from "@minecraft/server";


export function manageCD(player) {
    const equippable = player.getComponent(EntityComponentTypes.Equippable);
    if (!equippable) {
        console.warn("У игрока нет компонента Equippable.");
        return;
    }

    const item = equippable.getEquipment(EquipmentSlot.Mainhand);
    if (!item) {
        console.warn("В главной руке игрока нет предмета.");
        return;
    }

    const cooldownComponent = item.getComponent(ItemComponentTypes.Cooldown);
    if (!cooldownComponent) {
        console.warn("У предмета в руке нет компонента Cooldown.");
        return;
    }

    const cooldownCategory = cooldownComponent.cooldownCategory;
    const maxCD = cooldownComponent.cooldownTicks;
    const remainingCD = player.getItemCooldown(cooldownCategory)

    //console.warn(`Категория кулдауна: ${cooldownCategory}, Время кулдауна: ${maxCD}`);

    if (remainingCD === 0) {
        cooldownComponent.startCooldown(player) // Запускаем кулдаун. Важно делать это в конце, после получения данных
        return true
    } else {
        return false
    }
}