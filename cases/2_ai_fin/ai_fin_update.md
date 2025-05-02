
## 📊 Альтернативные формы DSL-структур

| Фрагмент DSL              | Текущая форма                        | Альтернатива 1                         | Альтернатива 2                          |
|:-------------------------:|:------------------------------------:|:--------------------------------------:|:---------------------------------------:|
| `context`                 | goal / actor / mode                 | mission / scope / role                | frame / intent / lens                   |
| `phase_1`                 | param / research / pattern / prod.  | stage / interview / extract           | probe / observe / distill               |
| `pattern`                 | candidates_for_automation           | recurring_action                      | automation_seed                         |
| `structure`               | sources / tools / input / output    | artifact: model / sources / tools     | structure block (reuse)                 |
| `decision + test_design` | if decision = true → run test       | gate: if/then                         | experiment: proto / simulate / eval     |




## 🧠 1. Общие замечания и зоны для усиления

| Область                 | Что можно усилить                                                                 |
|------------------------|-----------------------------------------------------------------------------------|
| Названия блоков        | Сделать единообразными и декларативными (`produce`, `research`, `pattern` и т.п.)|
| Формат структуры       | Разделить логически: `param`, `research`, `pattern`, `produce`, `decision`       |
| Типизация              | Добавить явные сущности: `actor`, `data`, `action`, `condition`, `storage`       |
| Формализм параметров   | Структурировать вложенные параметры (`goal`, `sources`, `tools`)                 |
| Логика связей          | Явно указывать зависимости между фазами, продуктами и анализами                  |

---

## 🧱 3. Что добавлено / улучшено

| Что                     | Зачем                                                                 |
|------------------------|----------------------------------------------------------------------|
| `context` блок         | Задает цель, роль и режим мышления проекта                           |
| `actor`, `tool`, `source` | Делит роли, инструменты и источники данных                           |
| `pattern`              | Выделяет повторяющиеся действия для автоматизации                    |
| `research/produce`     | Делает структуру когнитивного цикла чёткой и читаемой                |
| `storage_needs`        | Формализует долговременные данные и их горизонты хранения            |
| `decision_basis`       | Даёт логический каркас, на котором строится принятие решений         |

---

## 🛠 Рекомендации по улучшению DSL Mapping

- Добавь `context` блок для описания цели, роли и режима работы:
  context:
    goal: "Исследовать возможность использования AI в бухгалтерии"
    actor: "product_team"
    mode: "discovery"

- Сделай структуру фазы более модульной, разделив на `param`, `research`, `pattern`, `produce`:
  phase_1 -> custdev_accountants: {
    param: {
      actor: accountant
      sample_size: 3..5
      data_sources: [emails, receipts, 1c, tax_system, CRM]
      tools_used: [1C, Excel, cloud_drive, reports]
    }
    research: {
      work_patterns: "периодические действия и повторы"
      input_data_flows: "входящие информационные потоки"
      output_data_flows: "что выдает бухгалтер"
      actions: "что делает бухгалтер с данными"
      historical_context: "данные, сохраняемые и используемые позже"
    }
    pattern: {
      candidates_for_automation: [monthly_closure, reports_generation, reconciliation]
    }
    produce: {
      structure: {
        input_data: [raw_docs, transactions, client_requests]
        output_data: [reports, tax_forms, balance_sheets]
        storage_needs: { type: history, duration: yearly }
      }
      summary: "повторяющиеся паттерны, пригодные к автоматизации"
    }
  }

- Введи явные сущности для данных:
  - `input_data`: первичные документы, транзакции
  - `output_data`: отчеты, декларации
  - `storage_needs`: необходимость в долговременном контексте

- На этапе AI-исследования задай структуру так:
  phase_2 -> ai_tech_research: {
    research: {
      api: openai/chatgpt
      topics: [
        context_limitations,
        memory/embedding_store,
        token_cost_in_out,
        function_calling_capabilities
      ]
      constraints: [
        pricing_estimation_input,
        pricing_estimation_output,
        long_term_memory_architecture
      ]
    }
    produce: {
      estimation: {
        input_cost: $approx_input_tokens
        output_cost: $approx_output_tokens
        memory_cost: $storage_approach
      }
    }
  }

- Для бизнес-аналитики сделай блок сравнения:
  business_analytics: {
    compare: {
      human_accountant_monthly_cost: $x
      ai_accountant_estimated_cost: $y
    }
    decision_basis: [difference_in_cost, potential_automation_share]
  }

- И, наконец, уточни блок принятия решения:
  decision:
    start_test_hypothesis: true_or_false_based_on_profitability