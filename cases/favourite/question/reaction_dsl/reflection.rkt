#lang racket

(provide extract-core-question)

;; 💬 Финальный вопрос

(define (extract-core-question x)
  (match x
    ['is-it-pattern-or-just-case?                  
     '(Это исключение или структура?)]

    ['is-it-style-or-substance?                    
     '(Откуда уверенность — из формы или содержания?)]

    ['is-this-reason-or-reaction?                  
     '(Моя реакция на факт или на чувство?)]

    ['how-strong-is-my-trust-in-the-source?        
     '(Насколько-я-доверяю-рассказчику-и-почему?)]

    ['am-I-checking-structure-or-just-imagining?   
     '(Я-проверяю-структуру-или-просто-представляю-ситуацию?)]

    ['how-would-it-sound-without-loaded-language?  
     '(Как-бы-звучало-без-ярких-примеров-и-оценок?)]

    ['does-the-speaker-want-to-convince-or-reveal? 
     '(Есть-ли-мотивация-убеждать-вместо-раскрытия-правды?)]

    ['what-is-this-triggering-in-me?               
    '(Что-во-мне-задето?)]

    [_                                             
    '(О-чём-вообще-этот-вопрос?)]))


