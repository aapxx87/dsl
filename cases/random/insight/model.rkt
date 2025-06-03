#lang racket

(let* (
  ;; 1. Исходное состояние — насыщение смыслом
  (semantic_loading        "накоплен опыт, образы, связи — в явном и неявном виде")

  ;; 2. Формируется фоновый когнитивный запрос
  (latent_question         "внутренний нерешённый вопрос, не всегда осознанный")

  ;; 3. Активный поиск временно не даёт результата
  (mental_effort           "умственные попытки решить через волевое усилие")
  (executive_control       "жесткое удержание внимания и задачи, мешает гибкости")
  (frustration_threshold?  "наступает предел пользы от усилий — перегрев или усталость")

  ;; 4. Переключение режима: отпускание, сброс контроля
  (release                 "сознательное или спонтанное прекращение давления")
  (reduction_of_noise      "уменьшение внутреннего вербального и ассоциативного шума")
  (open_attention          "открытое, нецепляющее восприятие — пассивный режим")

  ;; 5. Появляется возможность для спонтанной перекомбинации
  (associative_field       "фоновое поле ассоциаций начинает перекомбинироваться")
  (emergent_structure?     "внезапно проявляется новая конфигурация")

  ;; 6. Инсайт — вторичный эффект
  (insight                 "неожиданная реорганизация паттерна, решение или понимание")
)
  insight)


(define (insight-mechanism input-experience)
  (let* (
    ;; 1. Подготовка: насыщение смыслом и связями
    (semantic_loading        (process-experience input-experience))
    (latent_question         (emerge-question semantic_loading))

    ;; 2. Активный волевой поиск (классическая попытка решения)
    (mental_effort           (apply-strategy latent_question))
    (mental_control          (focus-and-hold mental_effort))
    (interference            (detect-cognitive-friction mental_control))
    (frustration?            (overload? interference))

    ;; 3. Переключение: отпускание и снижение шума
    (release                 (if frustration? (let-go latent_question) 'none))
    (reduced_noise           (quiet-inner-voice release))
    (open_attention          (activate-open-mode reduced_noise))

    ;; 4. Перекомбинация: задействование латентных связей
    (associative_field       (activate-association semantic_loading open_attention))
    (emergent_pattern        (detect-pattern associative_field))

    ;; 5. Инсайт как результат самосборки
    (insight                 (if emergent_pattern (formulate-insight emergent_pattern) 'none))
  )
    insight))