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

(define (parse-expr chars history)
  (let [(chars (skip-whitespace chars))]
    (cond
      [(null? chars) (cons #f chars)]
      
      [(char-numeric? (car chars))
       (read-number chars)]
      
      [(char=? (car chars) #\$)
       (let [(hist-result (read-history-ref chars))]
         (if (car hist-result)
             (let [(val (get-history-value (car hist-result) history))]
               (if val
                   (cons val (cdr hist-result))
                   (cons #f chars)))
             (cons #f chars)))]
      
      [(char=? (car chars) #\+)
       (let* [(expr1 (parse-expr (cdr chars) history))]
         (if (not (car expr1))
             (cons #f chars)
             (let [(expr2 (parse-expr (cdr expr1) history))]
               (if (not (car expr2))
                   (cons #f chars)
                   (cons (+ (car expr1) (car expr2)) (cdr expr2))))))]
      
      [(char=? (car chars) #\*)
       (let* [(expr1 (parse-expr (cdr chars) history))]
         (if (not (car expr1))
             (cons #f chars)
             (let [(expr2 (parse-expr (cdr expr1) history))]
               (if (not (car expr2))
                   (cons #f chars)
                   (cons (* (car expr1) (car expr2)) (cdr expr2))))))]
      
      [(char=? (car chars) #\/)
       (let* [(expr1 (parse-expr (cdr chars) history))]
         (if (not (car expr1))
             (cons #f chars)
             (let [(expr2 (parse-expr (cdr expr1) history))]
               (if (not (car expr2))
                   (cons #f chars)
                   (if (= (car expr2) 0)
                       (cons #f chars)
                       (cons (quotient (car expr1) (car expr2)) (cdr expr2)))))))]
      
      [(char=? (car chars) #\-)
       (let [(expr (parse-expr (cdr chars) history))]
         (if (not (car expr))
             (cons #f chars)
             (cons (- (car expr)) (cdr expr))))]
      
      [else (cons #f chars)])))

(define (eval-expression expr-str history)
  (let* [(chars (string->list expr-str))
         (result (parse-expr chars history))]
    (if (not (car result))
        #f
       
        (let [(remaining (skip-whitespace (cdr result)))]
          (if (null? remaining)
              (car result)
              #f)))))
