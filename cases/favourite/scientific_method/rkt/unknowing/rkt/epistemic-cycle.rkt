#lang racket 


; * Механика:
; - Незнание  → не проблема или провал → а стимул.
; - Конвертируется в энергию постановки вопросов.
; - пока есть незнание → есть движение.


(define (perceives? input)
('output))

(define (ignored? input)
('output))

(define (present? input)
('output))



(define (frame-unknown-as unknown)
  ;; определяем, как воспринимается незнание
  (cond
    [(perceives? unknown 'threatening)      'threat]        ; страшно → угроза
    [(perceives? unknown 'unworthy)         'incompetence]  ; стыдно → некомпетентность
    [(perceives? unknown 'solvable)         'problem]       ; решаемо → задача
    [(perceives? unknown 'inspiring)        'challenge]     ; зовёт → вызов
    [(perceives? unknown 'mystical)         'mystery]       ; непостижимо → тайна
    [(ignored? unknown)                     'irrelevant]    ; игнорируется → неважно
    [else                                   'default-blocked])) ; без фрейма → блок




(define (framing-to-role framed)
  ;; трансформируем фрейм в функциональное состояние системы
  (cond
    [(eq? framed 'challenge)     'energy-source]       ; вызов → энергия
    [(eq? framed 'problem)       'short-circuit]       ; задача → быстрое решение
    [(eq? framed 'threat)        'avoidance-mode]      ; угроза → избегание
    [(eq? framed 'mystery)       'pause-and-observe]   ; тайна → наблюдение
    [(eq? framed 'incompetence)  'shutdown]            ; некомпетентность → отключение
    [(eq? framed 'irrelevant)    'noop]                ; неважно → ничего
    [else                        'blocked]))           ; блок → стоп






(define (epistemic-cycle unknown)
  (let* (
         ;; шаг 1: как мы фреймим незнание
         (framed (frame-unknown-as unknown))

         ;; шаг 2: какая роль у этого фрейма
         (role (framing-to-role framed))

         ;; шаг 3: стимул только если есть энергия
         (stimulus
          (if (eq? role 'energy-source)
              'stimulus
              'inert))

         ;; шаг 4: напряжение вопроса
         (question-potential
          (if (eq? stimulus 'stimulus)
              'activated-question
              'no-question))

         ;; шаг 5: гипотеза
         (result
          (if (eq? question-potential 'activated-question)
              'hypothesis-flow
              'dormant))

         ;; шаг 6: движение продолжатеся если незнание сохраняется
         (movement
          (if (present? unknown)
              'ongoing-inquiry
              'halted))
        )

    ;; возвращаем всю динамику
    (list
      (cons 'framing framed)
      (cons 'operational-role role)
      (cons 'stimulus-response stimulus)
      (cons 'question question-potential)
      (cons 'hypothesis result)
      (cons 'system-movement movement))))