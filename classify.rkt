#lang rosette

(provide (all-defined-out))

; Takes as input a propositional formula and returns
; * 'TAUTOLOGY if every interpretation I satisfies F;
; * 'CONTRADICTION if no interpretation I satisfies F;
; * 'CONTINGENCY if there are two interpretations I and I′ such that I satisfies F and I' does not.


(define (sol F)
  (solve
   (assert F)))

(define (classify F)
  (match (sol F)
    [(? unsat?) 'CONTRADICTION] ; unsat means F never satisfied by any interpretation
    [(model m) ; we could get a model for tautology or contingency
     (cond
       [(unsat? (verify (assert F))) `TAUTOLOGY] ; check if we can violate assertion? if not, then tautology
       [else `CONTINGENCY])])) ; else we have a contingency b/c it doesn't meet the other two cases


(define-symbolic* p q r boolean?)

; (p → (q → r)) → (¬r → (¬q → ¬p)) contingency
(define f0 (=> (=> p (=> q r)) (=> (! r) (=> (! q) (! p)))))

; (p ∧ q) → (p → q) tautology
(define f1 (=> (&& p q) (=> p q)))

; (p ↔ q) ∧ (q → r) ∧ ¬(¬r → ¬p) contradiction
(define f2 (&& (<=> p q) (=> q r) (! (=> (! r) (! q)))))

; (r ∧ ¬r) contradiction
(define f3 (&& r (! r)))

; (p ∨ ¬p) tautology
(define f4 (|| p (! p)))


(classify f0) ; contingency
(classify f1) ; tautology
(classify f2) ; contradiction
(classify f3) ; contradiction
(classify f4) ; tautology
