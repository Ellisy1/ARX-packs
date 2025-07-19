// Возвращает true, если можно начать кд, иначе false

import { EntityComponentTypes, EquipmentSlot, ItemComponentTypes } from "@minecraft/server";


export function manageCD(player) {
    const equippable = player.getComponent(EntityComponentTypes.Equippable);
    if (!equippable) {
        console.warn(`Вызвана функция ManageCD, но у игрока нет компонента Equippable. Игрок ${player.name}, предмет ${item?.typeId}`);
        return;
    }

    const item = equippable.getEquipment(EquipmentSlot.Mainhand);
    if (!item) {
        console.warn(`Вызвана функция ManageCD, но в главной руке игрока нет предмета. Игрок ${player.name}, предмет ${item?.typeId}`);
        return;
    }

    const cooldownComponent = item.getComponent(ItemComponentTypes.Cooldown);
    if (!cooldownComponent) {
        console.warn(`Вызвана функция ManageCD, но у предмета в руке нет компонента Cooldown. Игрок ${player.name}, предмет ${item?.typeId}`);
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