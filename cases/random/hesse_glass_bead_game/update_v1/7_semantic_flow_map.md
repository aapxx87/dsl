Это удобно визуально и быстро. Но если ты хочешь:
	•	комментарии
	•	модель причинности
	•	указание на тип связи (например: побуждает, заменяет, блокирует)

Тогда лучше более развернутый формат:


```yaml
  semantic_flows: [
    {
      from: "fear_presence",
      to: "fear_sources",
      type: "background → cause",
      comment: "Постоянное состояние страха подкрепляется множественными источниками неопределённости"
    },
    {
      from: "fear_sources",
      to: "escape_needs",
      type: "cause → motivation",
      comment: "Масштаб и неконтролируемость угроз вызывают желание сбежать"
    },
    {
      from: "escape_needs",
      to: "fictive_shift",
      type: "motivation → strategy",
      comment: "Человек ищет ментуальную зону безопасности как ответ на тревогу"
    },
    {
      from: "fictive_shift",
      to: "avoidance_behavior",
      type: "strategy → behavior",
      comment: "Поведенческий паттерн — поиск активностей, маскирующих страх"
    },
    {
      from: "avoidance_behavior",
      to: "resource_drain",
      type: "behavior → consequence",
      comment: "Внимание и энергия тратятся на поддержание бегства, а не на решение проблем"
    }
  ]

```