// Подключаем встроенный модуль fs (file system)
const fs = require('fs');

// Читаем твой sem-файл целиком, результат — строка
const semText = fs.readFileSync('question_model.sem', 'utf-8');

// Выведем, что получилось, чтобы убедиться:
// console.log('Содержимое файла:');
// console.log(semText);


// Пример: хотим найти блок "session: { ... }" целиком
const rootMatch = /(\w+):\s*\{([\s\S]*)\}$/.exec(semText);

if (!rootMatch) {
  throw new Error('Не найден корневой узел!');
}

const rootKey = rootMatch[1];   // например, "session"
const rootBody = rootMatch[2];  // всё внутри фигурных скобок


// console.log(rootMatch);



// console.log('Ключ корневого узла:', rootKey);
console.log('Тело узла (строка):\n', rootBody.slice(0, 200), '...'); // обрезаем для примера
