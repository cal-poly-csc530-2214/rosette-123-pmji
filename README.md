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

