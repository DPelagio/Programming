;(let* ( [a 2] [b 5] [c (+ a b)]) (* a b c))

#|
(define (quadratic a b c)
	(let
		([d (- (* b b) (* 4 a c))])
		(list
			(/ (+ (- b) (sqrt d)) (* 2 a))
			(/ (- (- b) (sqrt d)) (* 2 a))
		)
	)
)
|#

;Recursive multiplication
(define (multiply a b)
	(if (= b 1) a 
		(+ a (multiply a (- b 1)))

	)
)

;recursive tail
(define (multiply_2 a b)
	(multiply_tail a b 0)
)

(define (multiply_tail a b result)
	(if (<= b 0) result (multiply_tail a (- b 1) (+ result a)))
)

(define (sum_list lista)
	(if (empty? lista) 0
		(+ (car lista) (sum_list (cdr lista)))
	)
)

(define (inverse_list lista)
	()
)