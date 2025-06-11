#lang racket

(require racket/random)

;; 🎯 Цели, к которым стремится агент (упорядочены по доступности)
(define goal-pool '(rest eat create achieve_understanding attain_peace))

;; 💡 Стартовая цель
(define current-goal (box 'rest))

;; 📊 Карта "удовлетворения": сколько ходов длится эффект
(define satisfaction-map
  '((rest . 2)
    (eat . 1)
    (create . 3)
    (achieve_understanding . 4)
    (attain_peace . 1))) ; быстро распадается

;; 📦 История состояний
(define state-log (box '()))

;; 🧠 Агент выбирает и действует
(define (perform-action)
  (define goal (unbox current-goal))
  (define effect-duration (assoc goal satisfaction-map))
  (define ticks (if effect-duration (cdr effect-duration) 1))

  ;; записываем действие
  (set-box! state-log (cons (list 'pursued goal 'for ticks 'steps) (unbox state-log)))

  ;; симулируем эффект "удовлетворения"
  (sleep 0.1) ; символическая пауза

  ;; после "удовлетворения" — переход к следующей, более сложной цели
  (define next-goal
    (let* ([i (index-of goal-pool goal)]
           [next (if (< i (- (length goal-pool) 1))
                     (list-ref goal-pool (+ i 1))
                     (random-ref goal-pool))]) ; сбой: скачок или возврат
      next))

  (set-box! current-goal next-goal))

;; 🚀 Запустить цикл агента
(define (run-agent cycles)
  (for ([i (in-range cycles)])
    (perform-action))
  (displayln "История:")
  (for-each displayln (reverse (unbox state-log))))

;; ▶️ Запуск
(run-agent 10)