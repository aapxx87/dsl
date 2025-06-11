#lang racket

;; 💡 attention-listener — модель флоу внимания как цепочка стадий

(define (attention-listener input filter response)

  (let* (
         ;; Мониторинг потока
         (monitored-stream input)

         ;; Выделение объекта внимания
         (detected-trigger (filter monitored-stream))

         ;; Реакция — вызов реакции
         (final-response (response detected-trigger))
         )

    final-response
    )
  )