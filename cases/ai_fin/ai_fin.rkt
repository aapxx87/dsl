.
; ------- v_3


mapping ai_accountant_discovery {

  context:
    goal: "Исследовать возможность замены бухгалтеров на AI-модель на базе ChatGPT"
    scope: `early_discovery
    mode: `discovery
    actor: `product_team


  discovery: {

    phase_1 -> custdev_accountants: {

      param:
        actor: accountant
        sample_size: 3..5
        ; ||
        probe sample: 3..5 accountants
      
      ; observe
      research:
        work_patterns: "периодические действия и повторы"
        input_data_flows: "входящие информационные потоки"
        output_data_flows: "что выдает бухгалтер"
        actions: "что делает бухгалтер с данными"
        historical_context: "данные, сохраняемые и используемые позже"
      ; ||
      extract_patterns: {
        actions
        input_data
        output_data
        context_dependencies
      }
      ; Делает структуру ближе к action-based описанию.
      ; Позволяет добавить к extract_patterns повторно используемую логику.
      ; ||
      distill:
       automation_candidates: [...]
      }

      produce:

        structure:
          data_sources: [emails, receipts, 1c, tax_system, CRM ...]
          tools_used: [1C, Excel, cloud_drive, reports ...]
          input_data: [raw_docs, transactions, client_requests ...]
          output_data: [reports, tax_forms, balance_sheets ...]
          storage_needs: { type: history, duration: yearly }
        ; ||
        artifact:
         data_model:
          input: [...]
          output: [...]
        storage_policy: { type: history, duration: yearly }
        source_map: [emails, receipts, 1c, CRM ...]
        toolset: [1C, Excel, cloud_drive ...]
        ; ||
        structure ai_accounting_process {
         input_data: [...]
         output_data: [...]
         tools: [...]
         storage: {...}
        }
        ; Повышает модульность — можно использовать в нескольких фазах/проектах.
        ; Отделяет спецификацию артефакта от этапа.

        summary: "повторяющиеся паттерны, пригодные к автоматизации"
    }

    phase_2 -> ai_tech_research: {

      research:
        api: openai/chatgpt
        topics: [
          `context_limitations,
          `memory/embedding_store,
          `token_cost_in_out,
          `function_calling_capabilities
        ]
        constraints: [
          pricing_estimation_input,
          pricing_estimation_output,
          long_term_memory_architecture
        ]
      
      produce:
        estimation: {
          input_cost: $approx_input_tokens,
          output_cost: $approx_output_tokens,
          memory_cost: $storage_approach
        }
    }
  }  
  
  business_analytics: {
    compare:
      human_accountant_monthly_cost: $x
      ai_accountant_estimated_cost: $y
    decision_basis: difference_in_cost, potential_automation_share
  }

  produce: {
    decision: if decision = true -> design_hypothesis_test:
    ; ||
    gate:
     if: business_analytics.difference_in_cost > threshold
     then: run hypothesis_test

    design_hypothesis_test: {
      create_assets:
        - fake product presentation
        - fake product offer
      distribution:
        - send to potential customers
      research:
        - collect_feedback
      analytics:
        - analyze_feedback
    }
    ; ||
    experiment hypothesis_test {
     prototype_assets:
       fake `product_presentation
       fake `offer
     simulate_distribution:
       send_to: `potential_customers
     observe:
       `feedback_collection
     evaluate:
       `insights
       `blockers
    }

    ; Подчеркивает, что это не разработка, а эксперимент.
    ; Делает структуру похожей на протокол исследования.
}



; ------- v_3


mapping ai_accountant_discovery {

  context:
    goal: "Исследовать возможность замены бухгалтеров на AI-модель на базе ChatGPT"
    mode: `discovery
    actor: `product_team


  discovery: {

    phase_1 -> custdev_accountants: {

      param:
        actor: accountant
        sample_size: 3..5
      
      research:
        work_patterns: "периодические действия и повторы"
        input_data_flows: "входящие информационные потоки"
        output_data_flows: "что выдает бухгалтер"
        actions: "что делает бухгалтер с данными"
        historical_context: "данные, сохраняемые и используемые позже"

      pattern:
        candidates_for_automation: [monthly_closure, reports_generation, reconciliation]

      produce:
        structure:
          data_sources: [emails, receipts, 1c, tax_system, CRM ...]
          tools_used: [1C, Excel, cloud_drive, reports ...]
          input_data: [raw_docs, transactions, client_requests ...]
          output_data: [reports, tax_forms, balance_sheets ...]
          storage_needs: { type: history, duration: yearly }
        summary: "повторяющиеся паттерны, пригодные к автоматизации"
    }

    phase_2 -> ai_tech_research: {

      research:
        api: openai/chatgpt
        topics: [
          `context_limitations,
          `memory/embedding_store,
          `token_cost_in_out,
          `function_calling_capabilities
        ]
        constraints: [
          pricing_estimation_input,
          pricing_estimation_output,
          long_term_memory_architecture
        ]
      
      produce:
        estimation: {
          input_cost: $approx_input_tokens,
          output_cost: $approx_output_tokens,
          memory_cost: $storage_approach
        }
    }
  }  
  
  business_analytics: {
    compare:
      human_accountant_monthly_cost: $x
      ai_accountant_estimated_cost: $y
    decision_basis: difference_in_cost, potential_automation_share
  }

  produce: {
    decision: if decision = true -> design_hypothesis_test:

    design_hypothesis_test: {
      create_assets:
        - fake product presentation
        - fake product offer
      distribution:
        - send to potential customers
      research:
        - collect_feedback
      analytics:
        - analyze_feedback
    }
}




; ------- v_2

mapping ai_accountant_discovery {

  context:
    goal: "Исследовать возможность замены бухгалтеров на AI-модель на базе ChatGPT"
    actor: "product_team"
    mode: "discovery"
  
  phase_1 -> custdev_accountants: {

    param:
      actor: accountant
      sample_size: 3..5
    
    research:
      work_patterns: "периодические действия и повторы"
      input_data_flows: "входящие информационные потоки"
      output_data_flows: "что выдает бухгалтер"
      actions: "что делает бухгалтер с данными"
      historical_context: "данные, сохраняемые и используемые позже"

    pattern:
      candidates_for_automation: [monthly_closure, reports_generation, reconciliation]

    produce:
      structure:
        data_sources: [emails, receipts, 1c, tax_system, CRM ...]
        tools_used: [1C, Excel, cloud_drive, reports ...]
        input_data: raw_docs, transactions, client_requests
        output_data: reports, tax_forms, balance_sheets
        storage_needs: { type: history, duration: yearly }
      summary: "повторяющиеся паттерны, пригодные к автоматизации"
  }

  phase_2 -> ai_tech_research: {

    research:
      api: openai/chatgpt
      topics: [
        `context_limitations,
        `memory/embedding_store,
        `token_cost_in_out,
        `function_calling_capabilities
      ]
      constraints: [
        pricing_estimation_input,
        pricing_estimation_output,
        long_term_memory_architecture
      ]
    
    produce:
      estimation: {
        input_cost: $approx_input_tokens,
        output_cost: $approx_output_tokens,
        memory_cost: $storage_approach
      }
  }

  phase_3 -> business_analytics: {
    compare:
      human_accountant_monthly_cost: $x
      ai_accountant_estimated_cost: $y
    decision_basis: difference_in_cost, potential_automation_share
  }

  decision:
    start_test_hypothesis: true / false based on profitability
}


; ------- v_1

mapping ai_idea_discovery {

  discovery: {

    phase_1 -> custdev: {

      param: {
        role: accountant
        amount: 3 - 5
        goal: [
          `work_flow
          `regular_patterns
          `sources_of_inputs_data
          `actual_actions
          `output
          `inharitans_historical_data
        ]
       },

      produce: {
       spacification and amount:
        [
          `input_data
          `output_data
          `legacy
        ],
        summary: `regular_patterns to automatate
      }
    }

    phase_2 -> tech_ai_api_research: {
     
     research: {
      `api_documentation
      `principial_realisation_understanding
      `approx_output_data_pricing
      `approx_input_data_pricing
      `potencial_store_historical_data: [`architecture `pricing `etc]
     }

     produce: {
      summary: `approx_$_expenses_$_on_api
     }
    }
  }

  bussines_analytics: {
    calculate:  
     approx difference in cost
      ai_accountant vs human_accountant  
  }

 produce: {
  decision: start_test_hypotise {true, false}
 }
}