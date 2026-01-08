// Imports
import { ruLocalization } from './ru'
import { enLocalization } from './en'

// Vars
const defaultLanguage = 'en'
const langMap = {
    'ru': ruLocalization,
    'en': enLocalization
}

// Fetch Localization
// This functions takes a player and textId as input and returns requested text as output 
export function fl(player, textId) {

    // Wrong usage
    if (!player) {
        console.warn('Called fl() without player object')
        return
    }
    if (!textId) {
        console.warn(`Called fl() without textId object for player ${player.name}`)
        return
    }

    const langId = getPlayerLanguage(player)
    let returnText = ''

    returnText = langMap[langId][textId]
    // If we haven't found text and we don't use the default lang, try to use default lang.
    if (langId != defaultLanguage && !returnText) returnText = langMap[defaultLanguage][textId]

    if (!returnText) returnText = `§cNo localization for ${textId} in ${langId}§f`

    // Return
    return returnText 
}

// Send localization
// This function is a convenient way to shortly use fl() and permanently send the text to the player as a message.
export function sl(player, textId) {
    player.sendMessage(fl(player, textId))
}

// Returns player's language as 'en' or 'ru' etc.
function getPlayerLanguage(player) {
    const language = player.getDynamicProperty('language')
    return language in langMap ? language : defaultLanguage
}