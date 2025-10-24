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

(define (read-number chars)
  (define (read-digits chars acc)
    (cond
      [(null? chars) (list acc '())]
      [(char-numeric? (car chars))
       (read-digits (cdr chars) (string-append acc (string (car chars))))]
      [else (list acc chars)]))
  
  (let* [(chars (skip-whitespace chars))
         (result (if (null? chars)
                     (list "" '())
                     (read-digits chars "")))]
    (if (string=? (car result) "")
        (cons #f chars)
        (cons (string->number (car result)) (cadr result)))))

(define (read-history-ref chars)
  (let [(chars (skip-whitespace chars))]
    (if (and (not (null? chars)) (char=? (car chars) #\$))
        (let [(num-result (read-number (cdr chars)))]
          (if (car num-result)
              num-result
              (cons #f chars)))
        (cons #f chars))))

(define (get-history-value id history)
  (let [(rev-history (reverse history))
        (index (- id 1))]
    (if (and (>= index 0) (< index (length history)))
        (list-ref rev-history index)
        #f)))
