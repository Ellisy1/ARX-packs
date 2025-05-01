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
        // Комната регистрации
        // music_location += player.reg ? 100 : 0
        // Кровавая луна
        music_location += player.hasTag("scarlet_night") ? 1000 : 0

        // ИИ музыка
        //music_location += player.hasTag("AI_music") ? 222 : 0

        // Запускаем музыку
        if (music_location != player.getDynamicProperty("music_location_previous")) {

            // Запускаем музыку (выше в списке = приоритетнее)
            // Ад
            if (player.hasTag("in_nether")) {
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