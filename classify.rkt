#lang rosette

(provide (all-defined-out))

; Takes as input a propositional formula and returns
; * 'TAUTOLOGY if every interpretation I satisfies F;
; * 'CONTRADICTION if no interpretation I satisfies F;
; * 'CONTINGENCY if there are two interpretations I and I′ such that I satisfies F and I' does not.


; attempt at creating a driver function to return proposition type
;(define (classify F)
;  (if (check-tautology F) ('TAUTOLOGY) (
;      (if (check-contradiction F) ('CONTRADICTION) ('CONTINGENCY)))))

(define-symbolic* p q r boolean?)

; (p → (q → r)) → (¬r → (¬q → ¬p))
(define f0 (=> (=> p (=> q r)) (=> (! r) (=> (! q) (! p)))))

; (p ∧ q) → (p → q)
(define f1 (=> (&& p q) (=> p q)))

; (p ↔ q) ∧ (q → r) ∧ ¬(¬r → ¬p)
(define f2 (&& (<=> p q) (=> q r) (! (=> (! r) (! q)))))

; attemp to use solve on f1, as f1 is a tautology
(define sol
  (solve
   (assert (equal? (f1) #t))))


;(define (correct f1)
;  ((assert (= p #t))
;   (assert (= q #t))
;   (assert (= r #t)))
;   (assert (f1 p q r)))

