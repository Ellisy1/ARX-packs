import { system, world } from "@minecraft/server"

// Этот код отвечает за проведение тестов стабильности Аркса
import { getMoscowTime } from './date'


// Интервал между тестами в секундах
const testIntervalSec = 5

// Время МСК при последнем тесте стабильности. При инициализации системы устанавливается время при инициал. системы
let moscowTimeLastTest = getMoscowTime()

let stabilityTestResult = undefined

// Получаем данные с последнего теста стабильности в виде str XXX.XX%
export function getStabilityTestResult() {
    if (stabilityTestResult) {
        let textColor
        if (stabilityTestResult > 0.90) {
            textColor = '§a'
        } else if (stabilityTestResult > 0.75) {
            textColor = '§e'
        } else if (stabilityTestResult > 0.50) {
            textColor = '§6'
        } else {
            textColor = '§c'
        }

        return `${textColor}${(stabilityTestResult * 100).toFixed(2)}§fŨ`
    } else {
        return undefined
    }
}

// Выполняем тест стабильности
function performStabilityTest() {
    const moscowTimeCurrent = getMoscowTime() // Получаем московское время
    const moscowTimeDeltaMilliseconds = moscowTimeCurrent.getTime() - moscowTimeLastTest.getTime() // Получаем разницу во времени между тестом стабильности, который сейчас в процессе завершения, и предыдущим в миллисекундах

    // Получаем стабильность в виде float, где идеальная стабильность 1.0
    stabilityTestResult = testIntervalSec * 1000 / moscowTimeDeltaMilliseconds // Значения в миллисек.

    // Выставляем moscowTimeLastTest
    moscowTimeLastTest = moscowTimeCurrent
}

// Интервальный запуск тестов стабильности
system.runInterval(() => {

    performStabilityTest()

}, testIntervalSec * 20);