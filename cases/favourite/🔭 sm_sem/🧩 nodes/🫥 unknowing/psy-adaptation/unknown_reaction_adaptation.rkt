#lang racket

(define (adaptation-strategy unknown-response)
  (cond
    [(eq? unknown-response 'avoidance) 'defensive-strategy]
    [(eq? unknown-response 'exploration) 'growth-strategy]
    [(eq? unknown-response 'freeze) 'stalling]))