# rosette-123-pmji
Jiwon Lee
<br />
Parker Mitchell

Both this paper and assignment were a little baffling for us. At a (very) high-level, the paper and concepts it discussed made sense, but when reading on and when discussing in class, we got bogged-down by the details.

For this assignment, we spent our whole time attempting to get HW 1.1 done. We broke off a bit trying to get two different sides of it working, as we thought this would be most efficient. However, as we had both never used Racket before, this turned into much of a "Headfirst: Racket" session while trying to accomplish our goals, which took a great deal of time. The work we each conducted will be explained below:

__Parker:__
I focused on implementing the basic structure of the 'classify' function. For us, we planned to have separate helper functions to check if something was a tautology or if something was a contradiction, else we would classify it as a contingency. So I quickly made a classify body that I thought would do just that, making this:

```
(define (classify F)
  (if (check-tautology F) ('TAUTOLOGY) (
      (if (check-contradiction F) ('CONTRADICTION) ('CONTINGENCY)))))
```

Jiwon focused on the approach that we would use in those helper functions.

After this, I focused on trying to get 'solve' working so we could use solver-aided queries. For me, this is where I spent much of my time (alongside learning Racket) and got really stuck. I referred to the docs and tried several different approaches to solve f1, which was a tautology. These approaches (not in our final code) included:

```
(define sol
  (solve
   (begin
     (assume (p #t))
     (assume (q #t))
     (assume (r #t))
     (assert (equal? (f1) (#t))))))
```
```
(define sol
  (solve
   (begin
     (assert (equal? (f1) (#t))))))
```
```
(define sol
  (solve
   (begin
     ((p #t))
     ((q #t))
     ((r #t))
     (assert (= (f1 p q r) (#t))))))
```

but they all resulted in 'unsat'. At this point, we felt quite stuck and had gone past our time so we called it.

__Jiwon:__
My initial understanding was that I need to loop through all possible p, q, and r boolean combinations for the functions to decide to return TAUTOLOGY, CONTRADICTION, or CONTINGENCY. So I tried to write a function where it has nested loops for list of True and False value and call functions. Then we realized that f0, f1, and f2 are not taking p, q, or r as arguments. What we discovered so far is that we probably have been approaching the probem in incorrect way. The work is in classifyWork.rkt file.


### UPDATE
After talking with Dr. Clements, we were able to figure out how to use solve, assert, verify, etc to aid in our classify function/procedure. We created a helper function, `sol` that takes in an argument and solves to give us unsat or a model. Using this, we matched with the output of `sol` on the given formula. If we got unsat, then we knew it was a 'contradiction' so immediately returned that. Else, we got a model, so it could be a tautology or contingency. We then used cond and verify to see if we could find a violation of the assertion of F. Based on our understanding, if this was not possible (unsat) then we returned 'tautology'. Else, we returned 'contingency'.
