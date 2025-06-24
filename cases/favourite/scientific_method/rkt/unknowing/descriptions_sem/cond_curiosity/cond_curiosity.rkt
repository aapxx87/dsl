#lang racket 


; * 'Условие подлинной 'любознательности — когда осознано, а не вытеснено

;; Возможные модусы осознания сигнала
(define awareness-modes '(
    recognized-gap ; осознанный-пробел
    suppressed-gap ; вытеснение-пустоты
    preconscious-blur ; пред-сознательная-неясность
    confused-response)) ; когнитивная-путаница




;; Эвристическая функция определения режима осознания сигнала
(define (resolve-awareness-mode cognitive-signals)
  (cond
    [(member 'direct-recognition cognitive-signals) ; прямое-признание
     'recognized-gap] ; осознанный-пробел

    [(member 'emotional-avoidance cognitive-signals) ; эмоциональное-избегание
     'suppressed-gap] ; вытеснение-пустоты

    [(member 'vague-unease cognitive-signals) ; смутная-тревога
     'preconscious-blur] ; пред-сознательная-неясность

    [(member 'conflicting-reactions cognitive-signals) ; противоречивые-реакции
     'confused-response] ; когнитивная-путаниц

    [else
     'neutral]))






;; Главная функция — интерпретация эпистемического сигнала
(define (interpret-signal epistemic-signal input-signals)

  (let* ([mode (resolve-awareness-mode input-signals)])

    (cond
      [(and (eq? epistemic-signal 'epistemic-gap) ; эпистемический-пробел
            (eq? mode 'recognized-gap)) ; осознанный-пробел
       (transition-to 'curiosity)] ; любознательность

      [(and (eq? epistemic-signal 'epistemic-gap)
            (eq? mode 'suppressed-gap)) ; вытеснение-пустоты
       (transition-to 'cognitive-block)] ; блокировка-познания

      [(and (eq? epistemic-signal 'epistemic-gap)
            (eq? mode 'preconscious-blur)) ; пред-сознательная-неясность
       (transition-to 'standby-observation)] ; наблюдение-без-действия

      [else
       (transition-to 'neutral)])))




;; Функция перехода в новое состояние
(define (transition-to new-state)
  (cond

    [(eq? new-state 'curiosity)
     (begin 'epistemic-move)] ; Активирована подлинная любознательность

    [(eq? new-state 'cognitive-block)
     (begin 'halted)] ; Вытеснение. Движение блокировано

    [(eq? new-state 'standby-observation)
     (begin 'latent-processing)] ; Режим наблюдения. Ожидание фокусировки

    [else
     (begin 'no-shift)]))



; 📌 Примеры вызова

;; Признание незнания → запуск любознательности
(interpret-signal 'epistemic-gap '(direct-recognition))

;; Эмоциональное избегание → блок
(interpret-signal 'epistemic-gap '(emotional-avoidance))

;; Неясное беспокойство → ожидание прояснения
(interpret-signal 'epistemic-gap '(vague-unease))

;; Хаотичное восприятие → нейтральная реакция
(interpret-signal 'epistemic-gap '(conflicting-reactions))








;; Returns a declarative summary of the full epistemic processing chain
(define (epistemic-declaration epistemic-signal input-signals)

  (let* ([awareness-mode (resolve-awareness-mode input-signals)]
         [state (interpret-signal epistemic-signal input-signals)]
         [effect
         
          (cond
            [(eq? state 'epistemic-move) 'curiosity-activated]
            [(eq? state 'halted)         'movement-blocked]
            [(eq? state 'latent-processing) 'observation-awaits-clarity]
            [else 'no-cognitive-shift])])
   
    (list
      (cons 'signal epistemic-signal)
      (cons 'input-signals input-signals)
      (cons 'awareness-mode awareness-mode)
      (cons 'state-transition state)
      (cons 'cognitive-effect effect))))


; 🔍 Пример вызова:
(epistemic-declaration 'epistemic-gap '(direct-recognition))



; (define (эпистемическая-декларация сигнал входные-маркеры)
;   (let* ([режим (resolve-awareness-mode входные-маркеры)]
;          [состояние (интерпретировать-незнание сигнал входные-маркеры)])
;     (list
;       (cons 'signal сигнал)
;       (cons 'perceived-as режим)
;       (cons 'raw-markers входные-маркеры)
;       (cons 'resulting-state состояние)
;       (cons 'cognitive-effect
;             (case состояние
;               [(движение-познания) 'epistemic-move]
;               [(остановка) 'halted]
;               [(латентная-обработка) 'latent-waiting]
;               [else 'static])))))