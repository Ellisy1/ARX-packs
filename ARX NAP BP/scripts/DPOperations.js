// Safely Set Dynamic Property
// Сохраняет DP с оптимизацией
// object - то, на что сохраняется DP
export function ssDP(object, DPName, value) {
    if (!object || !DPName) {
        console.warn(`Вызвана функция ssDP() без необходимых переменных`)
    }
    // Старое значение в этом DP
    const oldValue = object.getDynamicProperty(DPName)
    
    if (oldValue != value) {
        object.setDynamicProperty(DPName, value)
        counter++
        // Логирование всех действий с DP через DPOperations
        // console.warn(counter, DPName)
    }
}

// Increase Dyncamic Property
// Увеличивает DP
export function iDP(object, DPName, valueToIncrease = 1) {
    if (!object || !DPName) {
        console.warn(`Вызвана функция iDP() без необходимых переменных`)
    }

    const currentValue = object.getDynamicProperty(DPName)

    ssDP(object, DPName, currentValue + valueToIncrease)
}

let counter = 0