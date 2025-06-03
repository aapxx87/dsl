#lang racket

(require 
         "trigger_detection.rkt")

(provide route-correction-mechanism)

;; Маршрутизация механизмов очистки

(define (route-correction-mechanism type x)
  (match type
    ['case-vs-pattern            (clarify-if-pattern-or-exception x)]
    ['confidence-vs-style        (isolate-style-from-substance x)]
    ['emotion-vs-argument        (separate-emotion-from-logic x)]
    ['trust-vs-intent            (reflect-on-narrator-trust x)]
    ['imagination-vs-structure   (check-imagery-vs-logic x)]
    ['rhetoric-vs-neutrality     (neutralize-language x)]
    ['persuasion-vs-truth        (detect-motive x)]
    ['unknown                    (default-reflection x)]))


;; Механизмы когнитивной очистки

;; 1. Проверка: частный случай или структура?

(define (clarify-if-pattern-or-exception narrative)
  (let* (
         ;; 🧩 Шаг 1. Воспринимаем нарратив — зафиксирован как потенциально искажённый
         (heard narrative)

         ;; 🧠 Шаг 2. Задаём себе уточняющие вопросы
         (step-1 "Сколько на самом деле я слышу случаев?")
         (step-2 "Повторяется ли эта история в разных контекстах?")
         (step-3 "Есть ли в нарративе признаки вариативности?")
         (step-4 "Допускается ли противоположное наблюдение?")
         (step-5 "На чём построено обобщение — на количестве или на силе впечатления?")

         ;; 🪛 Шаг 3. Сравниваем ответы
         (example? (contains-case-pattern? heard))
         (generalization? 
          (or (string-contains? heard "всегда")
              (string-contains? heard "чаще всего")
              (string-contains? heard "все такие")))

         (no-variation? (not (or (string-contains? heard "иногда")
                                 (string-contains? heard "бывает по-разному"))))

         ;; 🎯 Шаг 4. Если пример единичный, вывод — обобщение, и нет допуска вариативности → вмешиваемся
         (verdict (if (and example? generalization? no-variation?)
                      'is-it-pattern-or-just-case?
                      'default-reflection)))
verdict))



;; 2. Удаление влияния стиля
(define (isolate-style-from-substance narrative)
  (let* (
         ;; 🧩 1. Входной нарратив
         (heard narrative)

         ;; 🧠 2. Внутренние когнитивные шаги уточнения:
         (step-1 "Что именно меня убедило — содержание или подача?")
         (step-2 "Если бы тот же аргумент озвучили неуверенно — я бы тоже поверил?")
         (step-3 "Какие факты подтверждают это утверждение?")
         (step-4 "Можно ли отделить голос, тон, формулировки — и оставить только смысл?")
         (step-5 "Остался бы аргумент убедительным, если его просто напечатать чёрным шрифтом на белом фоне?")

         ;; 🔍 3. Эвристики (упрощённо, могут быть расширены)
         (style-markers?
          (or (string-contains? heard "уверенно")
              (string-contains? heard "харизма")
              (string-contains? heard "убедительно сказано")
              (string-contains? heard "внушает доверие")
              (string-contains? heard "голос эксперта")
              (string-contains? heard "прямо чувствуется уверенность")))

         ;; 🎯 4. Если стиль яркий, а аргументация не очевидна — активируем уточнение
         (verdict (if style-markers?
                      'is-it-style-or-substance?
                      'default-reflection)))
  verdict))


;; 3. Фильтрация эмоций из логики
(define (separate-emotion-from-logic x)
  ;; заглушка
  x)


;; 4. Проверка доверия к рассказчику
(define (reflect-on-narrator-trust x)
  ;; заглушка
  x)


;; 5. Образы или структура?
(define (check-imagery-vs-logic x)
  ;; заглушка
  x)


;; 6. Удаление эмоциональной лексики
(define (neutralize-language x)
  ;; заглушка
  x)


;; 7. Убеждение или поиск истины?
(define (detect-motive x)
  ;; заглушка
  x)


;; 8. Базовая рефлексия
(define (default-reflection x)
  ;; заглушка
  x)


