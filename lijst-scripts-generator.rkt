#lang at-exp racket
(require racket/runtime-path)

(define-runtime-path HERE ".")
(define-values (subp stdout stdin stderr)
  (subprocess #f #f #f "/bin/grep" "-roHE" "[0-9][0-9][0-9][0-9]\\\\_\\\\_[^[:space:]]*\\.sql" "--exclude" "*scripts.md"))
(close-output-port stdin)
(close-input-port stderr)

(define grepresults/backslashes
  (sort
   (map
    (λ (s) (string-split s ":"))
    (string-split
     (port->string stdout)
     "\n"))
   (λ (pair-1 pair-2) (string<? (second pair-1) (second pair-2)))))


(define pages (map first grepresults/backslashes))
(define filenames (map second grepresults/backslashes))
(define maxlen (apply max (map string-length filenames)))
(define padding (max (- maxlen (string-length "Bestandsnaam")) 0))
(define (pad-with s n c)
  (string-append
   s
   (build-string
    n
    (λ (_) c))))

; TODO: moet zorgen dat kolom bestandsnaam minstens zo breed is als breedste filename (zonder backslashes)

(define markdown @string-append{
 # Overzicht van alle scripts
 Hieronder vind je alle scripts terug die in de cursus geschreven moeten worden. Als een script meermaals vermeld wordt, wordt het op meerdere plaatsen besproken, dus check beide. Hou je verzameling scripts up-to-date!

 | @(pad-with "Bestandsnaam" padding #\ ) | Vermeld op pagina |
 |-@(pad-with "------------" padding #\-)-|-------------------|
 @(string-join
   (map
    (λ (a b)
      (string-append
       "| "
       a
       " | "
       (format "[pagina](https://apwt.gitbook.io/cursus-databanken/~a)" (substring b 0 (- (string-length b) 3)))
       " |"))
    filenames
    pages)
   "\n")
 })

(display markdown)

(call-with-output-file
    (build-path HERE "semester-1-intro/scripts.md")
  (λ (out) (display markdown out))
  #:exists 'replace)