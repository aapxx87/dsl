#lang racket

(provide detect-trigger-type)
(provide contains-case-pattern?)


;; 🎯 Распознавание триггеров

(define (detect-trigger-type x)
  (cond
    [(contains-case-pattern? x)              'case-vs-pattern]
    [(contains-style-confidence? x)          'confidence-vs-style]
    [(contains-emotional-ping? x)            'emotion-vs-argument]
    [(contains-trust-bias? x)                'trust-vs-intent]
    [(contains-imagery-vs-structure? x)      'imagination-vs-structure]
    [(contains-style-vocabulary-bias? x)     'rhetoric-vs-neutrality]
    [(contains-manipulation-signal? x)       'persuasion-vs-truth]
    [else                                    'unknown]))


;; 🔍 Расширенные эвристики определения типа когнитивного триггера

(define (contains-case-pattern? x)
  (or
   ;; Явные слова "пример", "случай"
   (string-contains? x "пример")
   (string-contains? x "в конкретном случае")
   (string-contains? x "единичный случай")

   ;; Неявные указатели на частные наблюдения
   (string-contains? x "у меня был знакомый")
   (string-contains? x "у меня был случай")
   (string-contains? x "однажды я слышал")
   (string-contains? x "вот недавно")
   (string-contains? x "как-то раз")
   (string-contains? x "в моей практике")
   (string-contains? x "личный опыт")
   (string-contains? x "знаю одного человека")
   (string-contains? x "у нас на работе было")

   ;; 📌 Неявное приведение примера (implicit-exemplification)
   (string-contains? x "у нас на работе")
   (string-contains? x "один человек сказал")
   (string-contains? x "это напомнило")
   (string-contains? x "вот в таких случаях")
   (string-contains? x "так бывает нередко")

   ;; Переход от примера к обобщению
   (string-contains? x "это как раз показывает")
   (string-contains? x "все такие")
   (string-contains? x "обычно так и бывает")
   (string-contains? x "и это значит")
   (string-contains? x "поэтому всегда")
   (string-contains? x "так бывает"))
  )


(define (contains-style-confidence? x)
  (or
   ;; 📌 Явные слова, указывающие на стиль подачи
   (string-contains? x "уверенно")
   (string-contains? x "харизма")
   (string-contains? x "убедительно сказано")
   (string-contains? x "внушает доверие")

   ;; 📌 Подсознательное восприятие силы подачи
   (string-contains? x "произвело впечатление")
   (string-contains? x "не мог не поверить")
   (string-contains? x "очень убедительно звучит")
   (string-contains? x "звучит авторитетно")
   (string-contains? x "гипнотизирует")
   (string-contains? x "захватывает внимание")
   (string-contains? x "звучит как правда")

   ;; 📌 Лингвистические сигналы риторической силы
   (string-contains? x "без тени сомнения")
   (string-contains? x "абсолютно точно")
   (string-contains? x "прямо чувствуется уверенность")
   (string-contains? x "уверенный тон")
   (string-contains? x "голос эксперта")

   ;; 📌 Визуальная или сценическая харизма
   (string-contains? x "в глазах была решимость")
   (string-contains? x "сразу видно, что он знает")
   (string-contains? x "сильная энергетика")))



(define (contains-emotional-ping? x)
  ;; Эмоциональный отклик
  (or (string-contains? x "волнение")
      (string-contains? x "эмоция")
      (string-contains? x "меня задело")
      (string-contains? x "это бесит")
      (string-contains? x "переживаю")))



(define (contains-trust-bias? x)
  ;; Оперирование доверием к рассказчику
  (or (string-contains? x "доверяешь")
      (string-contains? x "источник вызывает доверие")
      (string-contains? x "авторитетный")))

(define (contains-imagery-vs-structure? x)
  ;; Яркая картинка вместо структуры
  (or (string-contains? x "представляешь")
      (string-contains? x "вообрази")
      (string-contains? x "живописный")
      (string-contains? x "в уме нарисовалась картина")))

(define (contains-style-vocabulary-bias? x)
  ;; Эмоционально окрашенная или манипулятивная лексика
  (or (string-contains? x "яркий пример")
      (string-contains? x "оценочная лексика")
      (string-contains? x "перекрученный образ")
      (string-contains? x "нагрузка в словах")))

(define (contains-manipulation-signal? x)
  ;; Намёк на желание убедить, а не раскрыть истину
  (or (string-contains? x "мотивация убедить")
      (string-contains? x "пытается повлиять")
      (string-contains? x "манипулирует")
      (string-contains? x "подталкивает к выводу")))


;; 🧩 Восприятие нарратива (заглушка)
(define (perceive x) x)