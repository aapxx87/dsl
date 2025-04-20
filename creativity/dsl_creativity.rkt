#lang br

; =========================================
; 0. ENTRY POINT: запуск фреймворка с mapping
; =========================================

entry_point = {
  context: context,
  state: derive_state_from_context(context),
  experience_bank: experience_bank_from_sources(experience_sources),
  evaluate: mapping insight
}


; =========================================
; 1. RULE: инсайт как центральная цель модели
; =========================================

mapping insight {
  requires: {
    environment: {
      physical_context: ["nature", "urban_park"],
      spatial_quality: ["calm", "safe", "quiet"],
      activity: ["walk", "sitting", "wandering"]
    },
    internal_state: state,
    experience_bank: experience_bank_richness(experience_bank)
  }
  produces: ["insight"]
}


; =========================================
; 2. LOGIC: derived entities and evaluations
; =========================================

function experience_bank_richness(bank) {
  return bank.domain_count >= 5
      && bank.overlapping == "low"
      && bank.associative_bridges == "present"
}

function derive_state_from_context(context) {
  let pressure = "low"
  if context.active includes "stress" or "hangover"
    → pressure = "medium"
  if context.active includes both "stress" and "sleep_deprivation"
    → pressure = "high"

  return {
    focus_mode: "diffuse",           ; фиксировано для текущей модели
    thinking_pattern: "non_linear",
    mental_pressure: pressure
  }
}

probability_of_insight = f(environment, state, experience_bank)


; =========================================
; 3. INPUT: источники опыта и контекст среды
; =========================================

experience_sources = {
  literature:        ["sci-fi", "classics", "nonfiction"],
  personal_projects: ["creative_writing", "tool_design"],
  social_circle:     ["scientists", "artists"],
  hobbies:           ["birdwatching", "urban_exploration"]
}

context = {
  active: ["rest", "walk", "stress"]
}


; =========================================
; 4. BASE DEFINITIONS: параметры и модификаторы
; =========================================

param focus_mode         { options: ["diffuse", "narrow", "unfocused"] }
param thinking_pattern   { options: ["non_linear", "structured", "wandering"] }
param mental_pressure    { options: ["low", "medium", "high"] }

modifiers = {
  affects_environment:      ["solitude_walk", "natural_light"],
  reduces_mental_pressure:  ["open_monitoring_meditation", "free_schedule"],
  improves_emotion_state:   ["rest", "recovery"],
  disrupts_state:           ["stress", "sleep_deprivation", "hangover", "social_pressure"]
}






; =========================================
; ## LONG_DOCS — Расширённые пояснения
; =========================================

long_docs = {

  about_framework: """
  То, что описано в этом файле — это не просто набор параметров, а зачаток семантического фреймворка, который:

  • структурирует знания о творчестве и когнитивных состояниях;
  • задаёт онтологию (какие сущности есть и как они взаимодействуют);
  • описывает механику переходов и зависимостей;
  • задаёт правила вычислений и оценки вероятностей;
  • содержит словарь интерпретаций и прикладной инструментарий.

  ✅ Что делает его именно фреймворком

  1. Уровень абстракции:
     Здесь не моделируются конкретные события, а задаются категории, которые объясняют:
     • откуда взялся инсайт,
     • какие условия критичны,
     • как можно на это повлиять.

  Такой фреймворк — это не просто модель, а система мышления, которую можно адаптировать под разные задачи.
  """,


  mental_pressure: """
  Ментальное давление — это многослойное явление, объединяющее:
  - субъективную загруженность (много мыслей в голове)
  - эмоциональное напряжение (тревога, вина, спешка)
  - соматическое состояние (усталость, недосып, истощение)

  Даже при внешне "лёгком" расписании человек может ощущать high pressure — если на него давят внутренние установки или неразрешённые конфликты.

  В модели креативности:
  - High pressure → переключение на целевое, суженное внимание
  - Low pressure → активация default mode network → инсайты

  Используется в internal_state, может быть вычислена из context через derive_state_from_context().
  """,


  focus_mode: """
  Режим внимания:
  - diffuse — рассеянное восприятие, позволяет улавливать слабые сигналы и неявные связи.
  - narrow — сосредоточенность на конкретной задаче, хорошо для линейных решений.
  - unfocused — хаотичное внимание без вектора, снижает продуктивность.

  Важно различать diffuse и unfocused — первое продуктивно, второе — нет.
  """,


  thinking_pattern: """
  Форма текущего мышления:
  - non_linear — ассоциативное, метафорическое, не по шагам.
  - structured — логичное, последовательное, используется в аналитике.
  - wandering — случайное, без структуры, может быть источником озарений, но редко управляемо.
  """,


  experience_bank: """
  Это абстракция, описывающая внутренний «резерв» разнообразных впечатлений, знаний, и ассоциаций.

  Формируется из experience_sources.
  Богатый experience_bank должен:
  - покрывать несколько семантически разных доменов
  - содержать мосты между этими доменами
  - быть достаточно свежим и насыщенным

  Используется в качестве материала, из которого может быть построен инсайт.
  """,


  mapping insight: """
  Mapping инсайта задаёт условия, при которых когнитивная система способна сгенерировать новое понимание.

  Требует:
  - среды с низким шумом и возможностью блуждания
  - внутреннего состояния, допускающего ассоциативное мышление
  - достаточно разнообразного опыта

  Результат: появление "insight" — точки пересборки смысла или озарения.
  """
}