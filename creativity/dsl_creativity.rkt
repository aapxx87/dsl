;; === INSIGHT TYPES — типология инсайтов по сферам применения ===

insight_types = {
  practical_life: [
    "оптимизация быта и хранения", 
    "изобретение или ремонт с подручными средствами", 
    "перепроектирование повседневных процессов"
  ],
  creative_expression: [
    "новый ракурс в хобби или искусстве", 
    "переосмысление и развитие личного проекта", 
    "оригинальная форма самовыражения"
  ],
  personal_growth: [
    "внутренний пересмотр ценностей и приоритетов", 
    "поиск устойчивости и самоопоры", 
    "освобождение от навязанных социальных ролей"
  ],
  cognitive_breakthrough: [
    "интуитивное понимание сложной концепции", 
    "структуризация ранее хаотичных знаний", 
    "инсайт в фундаментальную взаимосвязь"
  ],
  family_and_social: [
    "новые сценарии взаимодействия с детьми", 
    "креативные формы совместного досуга", 
    "нестандартный способ решения семейного вопроса"
  ],
  entrepreneurial: [
    "нестандартная бизнес-модель или ниша", 
    "новый способ монетизации навыка или идеи", 
    "обнаружение потребности или пробела на рынке"
  ]
}



;; === NEURO_MODE — архитектура когнитивных режимов (PFC vs DMN) ===
;; Задаёт два режима мышления: целевое и ассоциативное, с их чертами и условиями активации.

neuro_mode = {

  modes: {
    pfc_mode: {
      label: "focused_thinking",
      features: [
        "rule_following",
        "task_execution",
        "logical_analysis",
        "planning",
        "goal_tracking"
      ],
      insight_likelihood: "low"
    },

    dmn_mode: {
      label: "associative_thinking",
      features: [
        "non_linear_connections",
        "spontaneous_retrieval",
        "imaginative_combination",
        "emotional_autobiography"
      ],
      dual_potential: ["ruminative_loop", "generative_insight"],
      insight_likelihood: "high"
    }
  },

  access_conditions: {
    enable_dmn: [
      context.spatial_quality includes ["calm", "quiet", "safe"],
      internal_state.mental_pressure == "low",
      activity_type in ["walk", "wandering", "open_monitoring_meditation"]
    ],
    suppress_pfc: [
      no_explicit_goals == true,
      sensory_load <= "medium"
    ]
  }
}



;; === ENTRY POINT — точка запуска модели ===
;; Формирует: контекст → состояния → банк опыта → ассоциативное богатство → передаёт в mapping

entry_point = {

  ;; Формируем контекст на основе активных модификаторов
  context: context_from_modifiers(modifiers),

  ;; Выводим состояния на основе контекста
  state: {
    mental_pressure: derive_state_from_context(mental_pressure, context),
    physical_state:  derive_state_from_context(physical_state, context),
    emotional_state: derive_state_from_context(emotional_state, context)
  },

  ;; Агрегируем показатели из источников опыта
  experience_bank: experience_bank(experience_sources),

  ;; Оцениваем насыщенность ассоциативного ландшафта
  associative_landscape_richness: associative_richness_from(
    experience_bank(experience_sources)
  ),

  ;; Подаём всё в центральное правило оценки инсайта
  evaluate: mapping insight
}


;; === MAPPING: INSIGHT — логика активации продуктивного DMN ===
;; Если условия соответствуют, активируется режим dmn_mode и возможен инсайт.

mapping insight {
  ;; Абстрактно задаём условия, необходимые для включения ассоциативного режима мышления (DMN)
  enabling "dmn_mode" requires: {

    environment: {
      physical_context: ["nature", "urban_park"],
      spatial_quality: ["calm", "safe", "quiet"],
      activity:
       indoor: ["open_monitoring_meditation"]
       outdoor: ["walk", "sitting", "wandering"]
    },

    internal_state: {
      
      mental_pressure: derive_state_from_context(mental_pressure, context)
      physical_state: derive_state_from_context(physical_state, context),
      emotional_state: derive_state_from_context(emotional_state, context),

      cognitive_state:
        focus_mode: "diffuse",           ; фиксировано для текущей модели
        thinking_pattern: "non_linear",  ; фиксировано для текущей модели
    },
  }

  probability_of_insight: f(
    dmn_mode == "enabled",
    associative_landscape_richness: f(associative_richness_from(experience_bank))
  )

  produces: ["insight"]
}


;; === ASSOCIATIVE RICHNESS — оценка ассоциативного ландшафта ===
;; Вычисляется на основе разнообразия, несхожести и наличия мостов между источниками.

function associative_richness_from(experience_bank) {

  let richness = calculate(
   let has_sufficient_domains  = experience_bank.domain_count >= 5
   let has_low_overlap = experience_bank.overlapping == "low"
   let has_bridges = experience_bank.associative_bridges == "present"
  )

  return richness
}



;; === EXPERIENCE BANK — агрегирует ключевые метрики из источников опыта ===
function experience_bank(experience_sources) {

  return {
    domain_count: experience_sources.domain_count,
    overlapping: experience_sources.overlapping,
    associative_bridges: experience_sources.associative_bridges
  }
}



;; === EXPERIENCE SOURCES — базовые источники жизненного и когнитивного опыта ===
experience_sources = {

  literature: [
    "sci-fi", "classics", "nonfiction", "philosophy", "poetry",
    "technical_manuals", "memoirs", "design_books"
  ],

  personal_projects: [
    "creative_writing", "tool_design", "visual_experiments",
    "conceptual_maps", "game_prototypes", "story_worlds"
  ],

  social_circle: [
    "scientists", "artists", "educators", "engineers",
    "activists", "philosophers", "startup_founders"
  ],

  hobbies: [
    "birdwatching", "urban_exploration", "tinkering",
    "analog_sketching", "photography", "language_learning",
    "puzzle_solving", "experimental_cooking"
  ],

  physical_experience: [
    "manual_labor", "dance", "sports", "body_awareness_practices",
    "martial_arts", "gardening", "climbing", "somatic_exploration"
  ],

  emotional_landscape: [
    "loss", "love", "conflict_resolution", "therapy_journey",
    "parenting", "mentorship", "solitude", "failure_and_recovery"
  ],

  sensory_experience: [
    "soundscapes", "material_textures", "scents", "taste_experiments",
    "multi-sensory_environments", "minimalist_living", "ambient_design"
  ],

  technological_contexts: [
    "coding", "ai_experiments", "data_visualization",
    "simulation_design", "hardware_tinkering", "interface_prototyping"
  ],

  cultural_exposure: [
    "travel", "languages", "rituals", "architecture",
    "folk_art", "cuisine", "film_and_theater", "mythologies"
  ],

  meta_reflection: [
    "journaling", "meta-cognition", "philosophical_dialogue",
    "framework_design", "learning_strategies", "identity_exploration"
  ]
}




;; === DERIVE STATE — оценка состояния на основе контекста ===
;; Вычисляет уровень давления, физического и эмоционального состояния через модификаторы.

function derive_state_from_context(state_type, context) {

  let score = 0

  for factor in context.active {

    if modifiers.positive includes_any [category where category includes factor]
      → score += 1

    if modifiers.negative includes_any [category where category includes factor]
      → score -= 1
  }

  let level = map_score_to_level(score)

  return {
    state: level
  }
}




;; === MAP SCORE TO LEVEL — перевод числового score в дискретные уровни состояния ===
function map_score_to_level(score, state_type) {

  let level = "low"

  thresholds = {
    mental_pressure: [
      { min: 0, level: "low" },
      { min: 2, level: "medium" },
      { min: 4, level: "high" }
    ],
    physical_state: [
      { min: 0, level: "stable" },
      { min: 3, level: "fatigued" },
      { min: 5, level: "exhausted" }
    ],
    emotional_state: [
     { min: 0, level: "balanced" },
     { min: 2, level: "irritated" },
     { min: 4, level: "distressed" }
  ]
  }

  for step in thresholds.state_type {
    if score >= step.min → level = step.level
  }

  return level
}



;; === CONTEXT — динамически активные влияющие модификаторы среды и состояния ===
context = {
  active: {

    modifiers.positive: {
      affects_environment:        ["solitude_walk", "natural_light"],
      reduces_mental_pressure:    ["open_monitoring_meditation", "slow_walking"],
      improves_physical_state:    ["rest", "hydration"],
      improves_emotional_state:   ["creative_expression", "gratitude_reflection"]
    },

    modifiers.negative: {
      affects_environment:        ["overcrowding", "harsh_lighting"],
      disrupts_mental_pressure:   ["stress", "sleep_deprivation"],
      worsens_physical_state:     ["dehydration", "overexertion"],
      worsens_emotional_state:    ["social_pressure", "self_criticism"]
    }

  }
}


;; === MODIFIERS — описание факторов, влияющих на контекст и состояния ===
modifiers = {

  positive: [

    reduces_mental_pressure: [
      "open_monitoring_meditation", "free_schedule",
      "slow_walking", "birdwatching",
      "solo_time_in_nature"
    ],

    improves_physical_state: [
      "light_movement", "rest",
      "hydration", "breathing_exercises",
      "stretching"
    ],

    improves_emotional_state: [
      "empathic_conversation", "creative_expression",
      "recovery", "presence", "gratitude_reflection"
    ],

    affects_environment: [
      "solitude_walk", "natural_light",
      "calm_music", "green_space",
      "safe_urban_corner"
    ]
  ],

  negative: [

    disrupts_mental_pressure: [
      "stress", "sleep_deprivation",
      "hangover", "overcommitment",
      "deadline_pressure"
    ],

    worsens_physical_state: [
      "dehydration", "poor_sleep",
      "overexertion", "sedentary_day"
    ],

    worsens_emotional_state: [
      "conflict", "social_pressure",
      "emotional_exhaustion", "self_criticism",
      "noise_pollution"
    ],

    affects_environment: [
      "overcrowding", "chaotic_surroundings",
      "harsh_lighting", "lack_of_privacy",
      "constant_noise"
    ]
  ]
}


;; === PARAMETERS — возможные значения режимов и состояний ===
param focus_mode         { options: ["diffuse", "narrow", "unfocused"] }
param thinking_pattern   { options: ["non_linear", "structured", "wandering"] }
param mental_pressure    { options: ["low", "medium", "high"] }
