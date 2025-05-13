import { registeredSkills } from "./skillsOperations"

// Эта функция устанавливает игроку значения переменных в дефолтные
export function registerPlayerVars(player) {
    for (let skill in registeredSkills) {
        if (player.getDynamicProperty(`skill:${skill}_level`) === undefined) {
            player.setDynamicProperty(`skill:${skill}_level`, 0)
        }
        if (player.getDynamicProperty(`skill:${skill}_progress`) === undefined) {
            player.setDynamicProperty(`skill:${skill}_progress`, 0.0)
        }
    }

    if (player.getDynamicProperty("mp") === undefined) {
        player.setDynamicProperty("mp", 1000)
    }
    if (player.getDynamicProperty("myRule:showAttackCDMode") === undefined) {
        player.setDynamicProperty("myRule:showAttackCDMode", "seconds")
    }
    if (player.getDynamicProperty("myRule:manaDisplayMode") === undefined) {
        player.setDynamicProperty("myRule:manaDisplayMode", "integers")
    }
    if (player.getDynamicProperty("myRule:canSeeServerSpeedInInfoBook") === undefined) {
        player.setDynamicProperty("myRule:canSeeServerSpeedInInfoBook", false)
    }
    if (player.getDynamicProperty("myRule:chatPrefixes") === undefined) {
        player.setDynamicProperty("myRule:chatPrefixes", 'fullEN')
    }
    if (player.getDynamicProperty("attackCD") === undefined) {
        player.setDynamicProperty("attackCD", 0)
    }
    if (player.getDynamicProperty("overLoading") === undefined) {
        player.setDynamicProperty("overLoading", 0)
    }
    if (player.getDynamicProperty("prohibit_damage") === undefined) {
        player.setDynamicProperty("prohibit_damage", 0)
    }
    if (player.getDynamicProperty("MPPermanentBonus") === undefined) {
        player.setDynamicProperty("MPPermanentBonus", 0)
    }
    if (player.getDynamicProperty("intoxication") === undefined) {
        player.setDynamicProperty("intoxication", 0)
    }
    if (player.getDynamicProperty("FiolixNarcoticPower") === undefined) {
        player.setDynamicProperty("FiolixNarcoticPower", 0)
    }
    if (player.getDynamicProperty("magicTarget") === undefined) {
        player.setDynamicProperty("magicTarget", 1)
    }
    if (player.getDynamicProperty("channel_1_rune_sequence") === undefined) {
        player.setDynamicProperty("channel_1_rune_sequence", '')
    }
    if (player.getDynamicProperty("channel_2_rune_sequence") === undefined) {
        player.setDynamicProperty("channel_2_rune_sequence", '')
    }
    if (player.getDynamicProperty("channel_3_rune_sequence") === undefined) {
        player.setDynamicProperty("channel_3_rune_sequence", '')
    }
    if (player.getDynamicProperty("channel_4_rune_sequence") === undefined) {
        player.setDynamicProperty("channel_4_rune_sequence", '')
    }
    if (player.getDynamicProperty("channel_5_rune_sequence") === undefined) {
        player.setDynamicProperty("channel_5_rune_sequence", '')
    }
    if (player.getDynamicProperty("channel_6_rune_sequence") === undefined) {
        player.setDynamicProperty("channel_6_rune_sequence", '')
    }
    if (player.getDynamicProperty("freezing") === undefined) {
        player.setDynamicProperty("freezing", 0)
    }
    if (player.getDynamicProperty("freezingBlockByPotion") === undefined) {
        player.setDynamicProperty("freezingBlockByPotion", 0)
    }
    if (player.getDynamicProperty("heatingBlockByPotion") === undefined) {
        player.setDynamicProperty("heatingBlockByPotion", 0)
    }
    if (player.getDynamicProperty("heatingBlockByScroll") === undefined) {
        player.setDynamicProperty("heatingBlockByScroll", 0)
    }
    if (player.getDynamicProperty("scrollOfHealingCD") === undefined) {
        player.setDynamicProperty("scrollOfHealingCD", 0)
    }
    if (player.getDynamicProperty("intoxicationLevel") === undefined) {
        player.setDynamicProperty("intoxicationLevel", 0)
    }
    if (player.getDynamicProperty("hasRegisteredCharacter") === undefined) {
        player.setDynamicProperty("hasRegisteredCharacter", false)
    }
    if (player.getDynamicProperty("autoHPRegenCD") === undefined) {
        player.setDynamicProperty("autoHPRegenCD", 60)
    }
    if (player.getDynamicProperty("is_whispering") === undefined) {
        player.setDynamicProperty("is_whispering", false)
    }
    if (player.getDynamicProperty("verify") === undefined) {
        player.setDynamicProperty("verify", false)
    }
    if (player.getDynamicProperty("trueName") === undefined) {
        player.setDynamicProperty("trueName", "Странник")
    }
    if (player.getDynamicProperty("statistics:distance") === undefined) {
        player.setDynamicProperty("statistics:distance", 0)
    }
    if (player.getDynamicProperty("height") === undefined) {
        player.setDynamicProperty("height", 180)
    }
    if (player.getDynamicProperty('ghostWithering') === undefined) {
        player.setDynamicProperty('ghostWithering', 0)
    }
    if (player.getDynamicProperty('ghostWitheringLevel') === undefined) {
        player.setDynamicProperty('ghostWitheringLevel', 0)
    }
    if (player.getDynamicProperty('ghostUltimateResistance') === undefined) {
        player.setDynamicProperty('ghostUltimateResistance', 0)
    }

    if (player.getDynamicProperty('reviveDelay') === undefined) {
        player.setDynamicProperty('reviveDelay', 0)
    }
    if (player.getDynamicProperty('respawnDelay') === undefined) {
        player.setDynamicProperty('respawnDelay', 0)
    }
    if (player.getDynamicProperty('camera:activeCamera') === undefined) {
        player.setDynamicProperty('camera:activeCamera', false)
    }
    if (player.getDynamicProperty('camera:tickCountdownToNextTimecode') === undefined) {
        player.setDynamicProperty('camera:tickCountdownToNextTimecode', 0)
    }
    if (player.getDynamicProperty('camera:numOfProcessedTimecodes') === undefined) {
        player.setDynamicProperty('camera:numOfProcessedTimecodes', 0)
    }
    if (player.getDynamicProperty('speedBoostAfterKnockout') === undefined) {
        player.setDynamicProperty('speedBoostAfterKnockout', 0)
    }
}