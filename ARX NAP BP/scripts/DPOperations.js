// Safely Set Dynamic Property
// Сохраняет DP с оптимизацией
// object - то, на что сохраняется DP
export function ssDP(object, DPName, value) {
    if (!object || !DPName) {
        console.warn(`Вызвана функция ssDP() без необходимых переменных`)
        return
    }
    // Старое значение в этом DP
    const oldValue = object.getDynamicProperty(DPName)
    
    if (oldValue !== value) {
        object.setDynamicProperty(DPName, value)
    }
}

// Increase Dyncamic Property
// Увеличивает DP
export function iDP(object, DPName, valueToIncrease = 1) {
    if (!object || !DPName) {
        console.warn(`Вызвана функция iDP() без необходимых переменных`)
        return
    }

    // Если DP undefined, то будет установлено значение 0
    const currentValue = object.getDynamicProperty(DPName) ?? (typeof valueToIncrease === 'number' ? 0 : '')

    if (!(typeof currentValue === typeof valueToIncrease)) {
        console.warn(`Вызвано iDP с несовместимыми типами переменных ${DPName} (DP) и ${valueToIncrease} (увеличение)`)
        return
    }
    

    ssDP(object, DPName, currentValue + valueToIncrease)
}