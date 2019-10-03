#|
Program that computes the next day in the calendar.
Daniel Pelagio A01227873
10/09/2019
|#
;function to calculate if a month has 31, 30 or 28 days
(define (mes a)
	(case a
		[(1 3 5 7 8 10 12) 3]
		[(4 6 9 11) 2]
		[(2) 1]
	)
)

;function to calculate if a year is leap or not
(define (l_year anio)
	(if (= (modulo anio 400) 0)
		(* 1 1)(if (and (= (modulo anio 4) 0) (> (modulo anio 100) 0))
				(* 1 1)(+ 0 0)
			) 
	)
)

;function to calculate the next date of a given date
(define (next_day lista)
	(case (car lista)
		[(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27) (list (+ (car lista) 1) (car (cdr lista)) (car (cdr (cdr lista))))]
		[(30) (if (= (mes (car (cdr lista))) 3) 
							(list (+ (car lista) 1) (car (cdr lista)) (car (cdr (cdr lista)))) 
							(list 1 (+ (car (cdr lista)) 1) (car (cdr (cdr lista))))
						)
		]
		[(31) (if (= (car (cdr lista)) 12) (list 1 1 (+ (car (cdr (cdr lista))) 1)) (list 1 (+ (car (cdr lista)) 1) (car (cdr (cdr lista)))))]
		[(29) (if (= (mes (car (cdr lista))) 1) (list 1 3 (+ (car (cdr (cdr lista))) 1)) (list (+ (car lista) 1) (car (cdr lista)) (car (cdr (cdr lista)))))]
		[(28) (if (> (mes (car (cdr lista))) 1) (list (+ (car lista) 1) (car (cdr lista)) (car (cdr (cdr lista)))) (if (= (l_year (car (cdr (cdr lista)))) 1) (list (+ (car lista) 1) 2 (car (cdr (cdr lista)))) (list 1 (+ (car (cdr lista)) 1) (car (cdr (cdr lista))))))]
	)
)