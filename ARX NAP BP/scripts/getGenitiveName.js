export function getGenitiveName(name, gender) {
  try {
    if (typeof name !== 'string' || name.trim() === '') {
      throw new Error('Имя должно быть непустой строкой');
    }

    if (gender !== 1 && gender !== 2) {
      throw new Error('Некорректное значение пола персонажа');
    }

    return name.split(/[\s-]+/) // Учитываем дефисы в составных именах
      .map(part => declineNamePart(part, gender))
      .join(' ');

  } catch (error) {
    console.error('Ошибка в getGenitiveName:', error.message);
    return name;
  }
}

function declineNamePart(part, gender) {
  // Словарь исключений (можно расширить)
  const exceptions = {
    'лев': 'льва',
    'павел': 'павла',
    'пётр': 'петра',
    'николай': 'николая',
    'любовь': 'любви'
  };

  const lowerPart = part.toLowerCase();
  if (exceptions[lowerPart]) {
    return applyOriginalCase(exceptions[lowerPart], part);
  }

  return gender === 1 ? declineMale(part) : declineFemale(part);
}

function declineMale(part) {
  const lastChar = part.slice(-1);
  const lastTwoChars = part.slice(-2).toLowerCase();

  // Особые случаи
  if (lastTwoChars === 'ек' && part.length > 2) { // Борек → Борька
    return part.slice(0, -2) + 'ька';
  }
  if (lastTwoChars === 'ец') { // Янец → Янца
    return part.slice(0, -1) + 'а';
  }

  // Основные правила
  switch (lastChar.toLowerCase()) {
    case 'й': return part.slice(0, -1) + 'я';
    case 'ь': return part.slice(0, -1) + 'я';
    case 'а': return part.slice(0, -1) + 'ы';
    case 'я': return part.slice(0, -1) + 'и';
    case 'о': return part; // Для иностранных имен
    case 'ы': return part;
    default:  return part + 'а';
  }
}

function declineFemale(part) {
  const lastChar = part.slice(-1);
  const lastTwoChars = part.slice(-2).toLowerCase();

  // Особые случаи
  if (lastTwoChars === 'ия') { // Лия → Лии
    return part.slice(0, -1) + 'и';
  }

  // Основные правила
  switch (lastChar.toLowerCase()) {
    case 'а': return part.slice(0, -1) + (isSoftEnding(part) ? 'и' : 'ы');
    case 'я': return part.slice(0, -1) + 'и';
    case 'ь': return part.slice(0, -1) + 'и';
    case 'и': return part;
    case 'й': return part.slice(0, -1) + 'я';
    default:  return part;
  }
}

// Вспомогательные функции
function isSoftEnding(word) {
  // Проверяем мягкое окончание (перед 'а' согласная, вызывающая смягчение)
  const softConsonants = ['л', 'н', 'т', 'д', 'с', 'з', 'р'];
  return softConsonants.includes(word.slice(-2, -1).toLowerCase());
}

function applyOriginalCase(pattern, original) {
  // Сохраняем исходный регистр
  if (original === original.toUpperCase()) {
    return pattern.toUpperCase();
  }
  if (original[0] === original[0].toUpperCase()) {
    return pattern[0].toUpperCase() + pattern.slice(1);
  }
  return pattern;
}