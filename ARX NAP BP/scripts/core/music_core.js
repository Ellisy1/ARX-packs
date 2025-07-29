// Движок музыки Аркса

// Импортируем
import { system, world } from "@minecraft/server"
import { getScore } from "../scoresOperations"

const musicOptions = { fade: 2, loop: true }

// Запускаем каждую 1 сек. 
system.runInterval(() => {
    for (let player of world.getPlayers()) { // Цикл для каждого игрока

        // Анализируем, где мы находимся
        let music_location = 0

        // Кастомные локации. Ставят отрицательное значение
        // Порочные сады
        if (isEntityInCube(player, [-2274, 13, 1773], [-2205, 45, 1839])) {
            music_location = -1
        }
        // Порочные сады - тишина
        if (isEntityInCube(player, [-2225, 24, 1839], [-2255, 30, 1868])) {
            music_location = -2
        }
        // Бой с порочным демоном
        if (world.getDynamicProperty('vicious_demon:is_fight_right_now') && isEntityInCube(player, [-2252, 32, 1843], [-2227, 22, 1866])) {
            music_location = -1000
        }

        // Мы не в кастомной локации
        if (music_location === 0) {

            // Биомы
            if (player.location.y >= 55 || (player.hasTag("scarlet_night") && !isDay(player))) { // Надо ли нам проверять, в каком мы биоме?
                music_location += player.hasTag("in_snow_biome") ? 1 : 0
                music_location += player.hasTag("BIOME_birch") ? 2 : 0
                music_location += player.hasTag("BIOME_desert") ? 3 : 0
                music_location += player.hasTag("BIOME_forest") ? 4 : 0
                music_location += player.hasTag("BIOME_jungle") ? 5 : 0
                music_location += player.hasTag("BIOME_mangrove_swamp") ? 6 : 0
                music_location += player.hasTag("BIOME_mesa") ? 7 : 0
                music_location += player.hasTag("BIOME_ocean") ? 8 : 0
                music_location += player.hasTag("BIOME_plains") ? 9 : 0
                music_location += player.hasTag("BIOME_roofed") ? 10 : 0
                music_location += player.hasTag("BIOME_savanna") ? 11 : 0
                music_location += player.hasTag("BIOME_swamp") ? 12 : 0
                music_location += player.hasTag("BIOME_taiga") ? 13 : 0
                music_location += player.hasTag("BIOME_beach") ? 14 : 0
                music_location += isDay(player) ? 777 : 0
            }
            // Измерения
            music_location += player.hasTag("in_nether") ? 50 : 0
            // Шахты
            music_location += player.location.y < 0 ? 60 : 0
            music_location += player.location.y < 55 ? 70 : 0
            // Кровавая луна
            music_location += player.hasTag("scarlet_night") ? 1000 : 0
        }


        // Запускаем музыку
        if (music_location != player.getDynamicProperty("music_location_previous")) {
            // Запускаем музыку (выше в списке = приоритетнее)

            // Порочные сады
            if (music_location === -1) {
                player.playMusic(`Music_for_Manatees`, musicOptions)
            }
            // Порочные сады - тишина (полное отсутствие музыки)
            else if (music_location === -2) {
                player.playMusic(`Silence`, musicOptions)
            }
            else if (music_location === -1000) {
                player.playMusic(`Darkling`, musicOptions)
            }

            // Ад
            else if (player.hasTag("in_nether")) {
                player.playMusic(`Wretched_Destroyer`, musicOptions)
            }
            // Шахты - низ
            else if (player.location.y < 0) {
                player.playMusic(`Ossuary_2_Turn`, musicOptions)
            }
            // Шахты - верх
            else if (player.location.y < 55) {
                player.playMusic(`Ossuary_6_Air`, musicOptions)
            }
            // Алая ночь
            else if (player.hasTag("scarlet_night") && !isDay(player)) {
                player.playMusic(`Hiding_Your_Reality`, musicOptions)
            }
            // Снег
            else if (player.hasTag("in_snow_biome")) {
                if (isDay(player)) { player.playMusic(`The_Snow_Queen`, musicOptions) }
                else { player.playMusic(`Hidden_Past`, musicOptions) }
            }
            // Береза
            else if (player.hasTag("BIOME_birch")) {
                if (isDay(player)) { player.playMusic(`Morning`, musicOptions) }
                else { player.playMusic(`Silent_Night`, musicOptions) }
            }
            // Пляж
            else if (player.hasTag("BIOME_beach")) {
                if (isDay(player)) { player.playMusic(`Kalimba_Relaxation_Music`, musicOptions) }
                else { player.playMusic(`Silver_Flame`, musicOptions) }
            }
            // Пустыня
            else if (player.hasTag("BIOME_desert")) {
                if (isDay(player)) { player.playMusic(`Adding_the_Sun`, musicOptions) }
                else { player.playMusic(`Comfortable_Mystery`, musicOptions) }
            }
            // Тайга
            else if (player.hasTag("BIOME_taiga")) {
                if (isDay(player)) { player.playMusic(`Ossuary_5_Rest`, musicOptions) }
                else { player.playMusic(`Ossuary_1_A_Beginning`, musicOptions) }
            }
            // Обычный лес
            else if (player.hasTag("BIOME_forest")) {
                if (isDay(player)) { player.playMusic(`Magic_Forest`, musicOptions) }
                else { player.playMusic(`Temple_of_the_Manes`, musicOptions) }
            }
            // Джунгли
            else if (player.hasTag("BIOME_jungle")) {
                if (isDay(player)) { player.playMusic(`Energizing`, musicOptions) }
                else { player.playMusic(`Ancient_Rite`, musicOptions) }
            }
            // Мангровые болота
            else if (player.hasTag("BIOME_mangrove_swamp")) {
                player.playMusic(`An_Upsetting_Theme`, musicOptions)
            }
            // Меза
            else if (player.hasTag("BIOME_mesa")) {
                if (isDay(player)) { player.playMusic(`Ether_Vox`, musicOptions) }
                else { player.playMusic(`Immersed`, musicOptions) }
            }
            // Океан (ещё срабатывает на реки)
            else if (player.hasTag("BIOME_ocean")) {
                if (isDay(player)) { player.playMusic(`Skye_Cuillin`, musicOptions) }
                else { player.playMusic(`Almost_New`, musicOptions) }
            }
            // Равнины
            else if (player.hasTag("BIOME_plains")) {
                if (isDay(player)) { player.playMusic(`Evening`, musicOptions) }
                else { player.playMusic(`Canon_in_D_Major`, musicOptions) }
            }
            // Тёмный лес
            else if (player.hasTag("BIOME_roofed")) {
                if (isDay(player)) { player.playMusic(`Man_Down`, musicOptions) }
                else { player.playMusic(`Moorland`, musicOptions) }
            }
            // Саванна
            else if (player.hasTag("BIOME_savanna")) {
                if (isDay(player)) { player.playMusic(`Ascending_the_Vale`, musicOptions) }
                else { player.playMusic(`With_the_Sea`, musicOptions) }
            }
            // Болото
            else if (player.hasTag("BIOME_swamp")) {
                player.playMusic(`Myst_on_the_Moor`, musicOptions)
            }

            // Если ни одно условие выше не сработало
            else {
                if (isDay(player)) { player.playMusic(`Angel_Share`, musicOptions) }
                else { player.playMusic(`Morgana_Rides`, musicOptions) }
            }
        }

        player.setDynamicProperty("music_location_previous", music_location)
    }
}, 20)



// Функция для определения дня/ночи
function isDay(player) {
    // return world.getTimeOfDay() >= 360 && world.getTimeOfDay() < 12360;
    return getScore(player, "is_day") == 0 ? false : true
}



// Находится ли игрок в указанном кубе (координаты передаются как массивы [x, y, z])
export function isEntityInCube(entity, cornerA, cornerB) {
    const entityPos = entity?.location;

    // Находим минимальные и максимальные координаты куба
    // Теперь обращаемся к элементам массива по индексам
    const minX = Math.min(cornerA[0], cornerB[0]);
    const maxX = Math.max(cornerA[0], cornerB[0]);
    const minY = Math.min(cornerA[1], cornerB[1]);
    const maxY = Math.max(cornerA[1], cornerB[1]);
    const minZ = Math.min(cornerA[2], cornerB[2]);
    const maxZ = Math.max(cornerA[2], cornerB[2]);

    // Проверяем, находится ли игрок внутри куба
    if (entityPos) {
        return (
            entityPos.x >= minX && entityPos.x <= maxX &&
            entityPos.y >= minY && entityPos.y <= maxY &&
            entityPos.z >= minZ && entityPos.z <= maxZ
        );
    }
}

// Возвращает массив сущностей, находящихся внутри указанного куба
export function getEntitiesInCube(cornerA, cornerB, dimensionName = "overworld") {
    // Находим минимальные и максимальные координаты куба
    const minX = Math.min(cornerA[0], cornerB[0]);
    const maxX = Math.max(cornerA[0], cornerB[0]);
    const minY = Math.min(cornerA[1], cornerB[1]);
    const maxY = Math.max(cornerA[1], cornerB[1]);
    const minZ = Math.min(cornerA[2], cornerB[2]);
    const maxZ = Math.max(cornerA[2], cornerB[2]);

    // Получаем измерение
    const dimension = world.getDimension(dimensionName);

    // Получаем все сущности в измерении
    // Примечание: getEntities() без фильтра может быть ресурсоемким в больших мирах.
    // Для оптимизации можно добавить фильтр по типу, если заранее известен нужный тип.
    const allEntities = dimension.getEntities();

    // Фильтруем сущности, оставляя только те, что внутри куба
    const entitiesInCube = allEntities.filter(entity => {
        const pos = entity?.location;
        if (pos) {
            return (
                pos.x >= minX && pos.x <= maxX &&
                pos.y >= minY && pos.y <= maxY &&
                pos.z >= minZ && pos.z <= maxZ
            );
        }
    });

    return entitiesInCube;
}