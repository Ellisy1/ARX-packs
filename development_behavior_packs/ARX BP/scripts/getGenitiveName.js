// export - для использования вне этого файла, если необходимо.
export function getGenitiveName(name, gender) {
    try {
        if (typeof name !== 'string' || name.trim() === '') {
            throw new Error('Имя должно быть непустой строкой');
        }

        if (gender !== 1 && gender !== 2) {
            throw new Error('Некорректное значение пола персонажа');
        }

        return name.split(/[\s-]+/) // Учитываем пробелы и дефисы в составных именах
            .map(part => declineNamePart(part, gender))
            .join(' ');

    } catch (error) {
        console.error('Ошибка в getGenitiveName:', error.message);
        return name; // Возвращаем исходное имя при ошибке
    }
}

function declineNamePart(part, gender) {
    const lowerPart = part.toLowerCase();

    // 1. Быстрый поиск в словаре исключений (Кэшируем, чтобы не создавать каждый раз)
    const exceptionResult = exceptionMap.get(lowerPart);
    if (exceptionResult) {
        return applyOriginalCase(exceptionResult, part);
    }

    // 2. Общие правила склонения
    return gender === 1 ? declineMale(part) : declineFemale(part);
}

// Словарь исключений и его кэширование (чтобы не создавать каждый раз)
const exceptionMap = new Map(Object.entries({
    лев: 'льва',
    павел: 'павла',
    пётр: 'петра',
    николай: 'николая',
    любовь: 'любви',
    савва: 'саввы',
    илья: 'ильи', // Дополнительные исключения
    фома: 'фомы',
    ян: 'яна', // Польское имя
    натан: 'натана',
    герман: 'германа',
    руслан: 'руслана',
    кирилл: 'кирилла',
    артур: 'артура',
    мария: 'марии',
    софия: 'софии',
    анастасия: 'анастасии',
    дарья: 'дарьи',
    александра: 'александры',
    ева: 'евы',
    анна: 'анны',
    вера: 'веры',
    галина: 'галины',
    евгения: 'евгении',
    екатерина: 'екатерины',
    елена: 'елены',
    ирина: 'ирины',
    ольга: 'ольги',
    татьяна: 'татьяны',
    юлия: 'юлии'

    // Можно добавить еще исключения
}));

function declineMale(part) {
    const lastChar = part.slice(-1);
    const lastTwoChars = part.slice(-2).toLowerCase();

    // Особые случаи (более точные)
    if (part.length > 2 && (lastTwoChars === 'ек' || lastTwoChars === "ок")) { // Борек/Витек -> Борька/Витька (более распространено)
        return part.slice(0, -2) + 'ька';
    }

    if (part.length > 2 && lastTwoChars === 'ец') { // Янец -> Янца
        return part.slice(0, -1) + 'а';
    }

    switch (lastChar.toLowerCase()) {
        case 'й':
            return part.slice(0, -1) + 'я';
        case 'ь':
            return part.slice(0, -1) + 'я';
        case 'а':
            return part.slice(0, -1) + 'ы';
        case 'я':
            return part.slice(0, -1) + 'и';
        case 'о': // Игорь → Игоря (о - частая ошибка)
          return part + 'а'; //Обрабатываем и о
        case 'ы':
            return part; // Оставляем без изменений (редкий случай)
        default:
            return part + 'а'; // Добавляем "а" для большинства мужских имен
    }
}

function declineFemale(part) {
    const lastChar = part.slice(-1);
    const lastTwoChars = part.slice(-2).toLowerCase();

    // Особые случаи
    if (lastTwoChars === 'ия') {
        return part.slice(0, -1) + 'и'; // Мария -> Марии
    }

    switch (lastChar.toLowerCase()) {
        case 'а':
            return part.slice(0, -1) + (isSoftEnding(part) ? 'и' : 'ы'); // Анна -> Анны, Ольга -> Ольги
        case 'я':
            return part.slice(0, -1) + 'и'; // Дарья -> Дарьи
        case 'ь':
            return part.slice(0, -1) + 'и'; // Любовь -> Любови
        case 'и':
            return part; // Имена на -и не склоняются (редко встречаются)
        case 'й': //Сюда попасть почти нереально (женских имен на й почти нет)
            return part.slice(0, -1) + 'я';
        default:
            return part; // Оставляем как есть для остальных случаев (несклоняемые)
    }
}

function isSoftEnding(word) {
    const softConsonants = ['л', 'н', 'т', 'д', 'с', 'з', 'р', 'щ', 'ш', 'ч', 'ц', 'ж', 'й']; // Более полный список мягких согласных
    return softConsonants.includes(word.slice(-2, -1).toLowerCase());
}

function applyOriginalCase(pattern, original) {
  if (original === original.toUpperCase()) { // Все заглавные
    return pattern.toUpperCase();
  } else if (original[0] === original[0].toUpperCase()) { // Первая заглавная
    return pattern[0].toUpperCase() + pattern.slice(1);
  } else {
    return pattern; // Все строчные
  }
}