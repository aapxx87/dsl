#lang br

;; === ENTRY POINT — точка запуска модели ===

entry_point = {
  context: context_from_modifiers(modifiers),
  state: derive_state_from_context(context),
  experience_bank: experience_bank_from_sources(experience_sources),
  evaluate: mapping insight
}


;; === MAPPING: INSIGHT — центральное правило ===

mapping insight {
  requires: {

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

    experience_bank_richness: f(experience_bank_richnes(experience_sources))
  }

  probability_of_insight: f(
    environment, 
    internal_state, 
    experience_bank_richness
  )

  produces: ["insight"]
}


;; === LOGIC FUNCTIONS ===

function experience_bank_richnes(experience_sources) {

  return 
    experience_sources.domain_count >= 5
    && experience_sources.overlapping == "low"
    && experience_sources.associative_bridges == "present"

}


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



;; === INPUT MODEL: источники и контекст ===

experience_sources = {
  literature:        ["sci-fi", "classics", "nonfiction"],
  personal_projects: ["creative_writing", "tool_design"],
  social_circle:     ["scientists", "artists"],
  hobbies:           ["birdwatching", "urban_exploration"]
}


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


;; === DEFINITIONS: параметры и модификаторы ===

param focus_mode         { options: ["diffuse", "narrow", "unfocused"] }
param thinking_pattern   { options: ["non_linear", "structured", "wandering"] }
param mental_pressure    { options: ["low", "medium", "high"] }

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




