
; ------- v 1

mapping dsl_evolution_roadmap {


  practic: {
    author: `я
    note: "Эксперименты с Racket, структурой понятий и связей"
  }

  reading:
    thinking_and_meaning: [
      {
        author: "Людвиг Витгенштейн",
        title: "Философские исследования",
        note: "Смысл — это способ употребления, а не объект"
      }
      {
        author: "Джордж Лакоф, Марк Джонсон",
        title: "Метафоры, которыми мы живем",
        note: "Мышление как телесная и культурная проекция в метафорах"
      }
      {
        author: "Готлоб Фреге",
        title: "О смысле и значении",
        note: "Классическое различие Sinn и Bedeutung"
      }
    ]



  dsl_and_structuring: {
    {
      author: "Matthew Butterick",
      title: "Beautiful Racket",
      note: "Пошаговое освоение построения собственных языков (DSL) на Racket"
    }
  }

  cognition_through_programming: {
    {
      author: "Harold Abelson, Gerald Jay Sussman",
      title: "SICP (Structure and Interpretation of Computer Programs)",
      note: "Формализация мышления через построение интерпретаторов"
    }
  }

  additional:
    The_Art_of_Structuring:
      task: [`research, `dive_deeper]
      structuring_principles: [

        name: levels_of_abstraction
        description: "Разделение мышления на уровни: данные, структура, модель, смысл, мета-смысл"
        note: "Каждому уровню — свой язык и своя форма выражения"
        example: "DSL имеет уровень синтаксиса (формы), уровень смысловых узлов и уровень логики их связывания"

        name: modularity
        description: "Мышление как набор модулей: каждый отвечает за отдельную функцию или тип операций"
        note: "Изоляция + интерфейс → переиспользуемость"
        example: "Модуль 'context' задаёт контекст смыслов, модуль 'mapping' — преобразование"

        name: explicit_structure
        description: "Структура не должна быть имплицитной: обозначай связи, уровни, зависимости"
        note: "Переход от линейного мышления к графовой/сетевой экспликации"
        example: "Смысловая запись: 'idea(x) --> based_on(y)' вместо просто 'текстовой связности'"

        name: function_before_form
        description: "Сначала определи, что делает блок, потом — как он выглядит или формализуется"
        note: "Функциональное проектирование понятий"
        example: "Прежде чем делать синтаксис конструкции `cluster`, определи: она агрегирует? фильтрует? навигирует?"

        name: separation_of_concerns
        description: "Не смешивай слои: структура ≠ представление ≠ интерпретация"
        note: "Это позволяет изменять форму мышления без потери сути"
        example: "Модель связей можно представить в YAML, на графе или в UI — суть сохраняется"

        name: traceability
        description: "Любой элемент должен быть отслеживаем до своего основания"
        note: "Каждое утверждение или блок должны иметь источник, контекст, причину"
        example: "idea(id:23) ← derived_from(hypothesis:17)"

        name: adaptive_scaling
        description: "Структуры должны легко масштабироваться от микровысказываний до систем"
        note: "То, что работает на одном уровне, должно быть масштабируемо и на другом"
        example: "mapping: из понятия → в теорию → в доменную архитектуру"

        name: semantic_nodes
        description: "Работай не с 'предложениями', а с 'узлами смысла'"
        note: "Каждая мысль — атом, связанный с другими"
        example: "Вместо текста: semantic_node(id:21, content: 'Конфликт — источник развития')"

        name: reflexive_navigation
        description: "Добавляй узлы мышления о мышлении"
        note: "Рефлексивные уровни делают структуру обучаемой и перенастраиваемой"
        example: "node(id:meta-14, type: reflection, content: 'Это определение не точно, нужно переопределить')"

        name: structuring_as_action
        description: "Структурирование — это не описание, а способ действия"
        note: "Формулировка структуры уже преобразует мышление"
        example: "Создание схемы — это не отчёт, это инструмент мышления"
      ]
}
