import { ssDP } from "./DPOperations"
import { registeredSkills } from "./skillsOperations"

// Эта функция устанавливает игроку значения переменных в дефолтные
export function registerPlayerVars(player) {
    for (let skill in registeredSkills) {
        if (player.getDynamicProperty(`skill:${skill}_level`) === undefined) {
            ssDP(player, `skill:${skill}_level`, 0)
        }
        if (player.getDynamicProperty(`skill:${skill}_progress`) === undefined) {
            ssDP(player, `skill:${skill}_progress`, 0.0)
        }
    }

    // Каналы магии
    for (let i = 1; i < 11; i++) {
        if (player.getDynamicProperty(`channel_${i}_rune_sequence`) === undefined) {
            ssDP(player, `channel_${i}_rune_sequence`, '')
        }
    }

    // Бусты скорости
    for (let i = 0; i < 4; i++) {
        if (player.getDynamicProperty(`speedBoost:level${i}`) === undefined) {
            ssDP(player, `speedBoost:level${i}`, 0)
        }
    }

    if (player.getDynamicProperty("mp") === undefined) {
        ssDP(player, "mp", 1000)
    }
    if (player.getDynamicProperty("myRule:showAttackCDMode") === undefined) {
        ssDP(player, "myRule:showAttackCDMode", "seconds")
    }
    if (player.getDynamicProperty("myRule:manaDisplayMode") === undefined) {
        ssDP(player, "myRule:manaDisplayMode", "integers")
    }
    if (player.getDynamicProperty("myRule:canSeeServerSpeedInInfoBook") === undefined) {
        ssDP(player, "myRule:canSeeServerSpeedInInfoBook", false)
    }
    if (player.getDynamicProperty("myRule:chatPrefixes") === undefined) {
        ssDP(player, "myRule:chatPrefixes", 'fullEN')
    }
    if (player.getDynamicProperty("attackCD") === undefined) {
        ssDP(player, "attackCD", 0)
    }
    if (player.getDynamicProperty("overLoading") === undefined) {
        ssDP(player, "overLoading", 0)
    }
    if (player.getDynamicProperty("prohibit_damage") === undefined) {
        ssDP(player, "prohibit_damage", 0)
    }
    if (player.getDynamicProperty("MPPermanentBonus") === undefined) {
        ssDP(player, "MPPermanentBonus", 0)
    }
    if (player.getDynamicProperty("intoxication") === undefined) {
        ssDP(player, "intoxication", 0)
    }
    if (player.getDynamicProperty("FiolixNarcoticPower") === undefined) {
        ssDP(player, "FiolixNarcoticPower", 0)
    }
    if (player.getDynamicProperty("magicTarget") === undefined) {
        ssDP(player, "magicTarget", 1)
    }
    if (player.getDynamicProperty("freezing") === undefined) {
        ssDP(player, "freezing", 0)
    }
    if (player.getDynamicProperty("freezingBlockByPotion") === undefined) {
        ssDP(player, "freezingBlockByPotion", 0)
    }
    if (player.getDynamicProperty("heatingBlockByPotion") === undefined) {
        ssDP(player, "heatingBlockByPotion", 0)
    }
    if (player.getDynamicProperty("heatingBlockByScroll") === undefined) {
        ssDP(player, "heatingBlockByScroll", 0)
    }
    if (player.getDynamicProperty("scrollOfHealingCD") === undefined) {
        ssDP(player, "scrollOfHealingCD", 0)
    }
    if (player.getDynamicProperty("intoxicationLevel") === undefined) {
        ssDP(player, "intoxicationLevel", 0)
    }
    if (player.getDynamicProperty("hasRegisteredCharacter") === undefined) {
        ssDP(player, "hasRegisteredCharacter", false)
    }
    if (player.getDynamicProperty("autoHPRegenCD") === undefined) {
        ssDP(player, "autoHPRegenCD", 60)
    }
    if (player.getDynamicProperty("is_whispering") === undefined) {
        ssDP(player, "is_whispering", false)
    }
    if (player.getDynamicProperty("verify") === undefined) {
        ssDP(player, "verify", false)
    }
    if (player.getDynamicProperty("trueName") === undefined) {
        ssDP(player, "trueName", "Странник")
    }
    if (player.getDynamicProperty("statistics:distance") === undefined) {
        ssDP(player, "statistics:distance", 0)
    }
    if (player.getDynamicProperty("height") === undefined) {
        ssDP(player, "height", 180)
    }
    if (player.getDynamicProperty('ghostWithering') === undefined) {
        ssDP(player, 'ghostWithering', 0)
    }
    if (player.getDynamicProperty('ghostWitheringLevel') === undefined) {
        ssDP(player, 'ghostWitheringLevel', 0)
    }
    if (player.getDynamicProperty('ghostUltimateResistance') === undefined) {
        ssDP(player, 'ghostUltimateResistance', 0)
    }

    if (player.getDynamicProperty('reviveDelay') === undefined) {
        ssDP(player, 'reviveDelay', 0)
    }
    if (player.getDynamicProperty('respawnDelay') === undefined) {
        ssDP(player, 'respawnDelay', 0)
    }
    if (player.getDynamicProperty('camera:activeCamera') === undefined) {
        ssDP(player, 'camera:activeCamera', false)
    }
    if (player.getDynamicProperty('camera:tickCountdownToNextTimecode') === undefined) {
        ssDP(player, 'camera:tickCountdownToNextTimecode', 0)
    }
    if (player.getDynamicProperty('camera:numOfProcessedTimecodes') === undefined) {
        ssDP(player, 'camera:numOfProcessedTimecodes', 0)
    }
    if (player.getDynamicProperty('speedBoostAfterKnockout') === undefined) {
        ssDP(player, 'speedBoostAfterKnockout', 0)
    }

    if (player.getDynamicProperty('stress') === undefined) {
        ssDP(player, 'stress', 0)
    }
    if (player.getDynamicProperty('stressLevel') === undefined) {
        ssDP(player, 'stressLevel', 0)
    }
    if (player.getDynamicProperty('stressDynamic') === undefined) {
        ssDP(player, 'stressDynamic', 0)
    }
    if (player.getDynamicProperty('characterLifeSec') === undefined) {
        ssDP(player, 'characterLifeSec', 0)
    }
    if (player.getDynamicProperty('MPSmoothAccrue') === undefined) {
        ssDP(player, 'MPSmoothAccrue', 0)
    }
    if (player.getDynamicProperty('eatenLeFisheCounter') === undefined) {
        ssDP(player, 'eatenLeFisheCounter', 0)
    }
}