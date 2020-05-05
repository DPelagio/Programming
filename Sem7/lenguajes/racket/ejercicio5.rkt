#|
Daniel Pelagio
26/09/2019

program to read array of numbers from a file, sort them and write them in a new file
|#

;; meterle una lista y hacerla recursica para guardar todo el archivo en 
(define (read-numbers file)
    (let 
        (
        	[line (read-line file)]
        )
        ; Check if the line could be read
        (if (eof-object? line)
            (display "Finished Reading\n")
            (begin
                (display (string-append line "\n"))
                (read-numbers file))
        )
    )

)

(call-with-input-file "data.txt"
                       read-numbers)
