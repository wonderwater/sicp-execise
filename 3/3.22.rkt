#lang planet neil/sicp
(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (insert! item)
      (let ((new-pair (cons item '())))
        (if (empty?)
            (begin (set! front-ptr new-pair)
                   (set! rear-ptr new-pair))
            (begin (set-cdr! rear-ptr new-pair)
                   (set! rear-ptr new-pair)))))
    (define (empty?) (null? front-ptr))
    (define (delete!)
      (if (empty?)
          (error "empty queue")
          (set! front-ptr (cdr front-ptr))))
    (define (front)
      (if (empty?)
          (error "empty queue")
          (car front-ptr)))
    (define (dispatch m)
      (cond ((eq? 'insert! m) insert!)
            ((eq? 'empty? m) (empty?))
            ((eq? 'delete! m) (delete!))
            ((eq? 'front m) (front))
            (else (error "error"))))
    dispatch))


(define q1 (make-queue))
((q1 'insert!) 'a)
(q1 'front)
(q1 'delete!)
((q1 'insert!) 'b)
(q1 'front)
(q1 'delete!)
(q1 'empty?)