#lang racket

(define interactive?
  (let [(args (current-command-line-arguments))]
    (cond
      [(= (vector-length args) 0) #t]
      [(string=? (vector-ref args 0) "-b") #f]
      [(string=? (vector-ref args 0) "--batch") #f]
      [else #t])))

(define (skip-whitespace chars)
  (cond
    [(null? chars) '()]
    [(char-whitespace? (car chars)) (skip-whitespace (cdr chars))]
    [else chars]))
