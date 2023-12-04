SplitBy ← ⊜□≠,

P = rows(rows(box rows(parse unbox) SplitBy @ unbox) SplitBy @| drop 9 unbox) SplitBy @\n 

X = /+/+ table find unbox pick 0: unbox pick 1 .

I = P &fras "input"

&p /+ power : 2 -1 keep != 0 . rows(X) I

Sep = drop 1 : take 1 .

Snull = fill0 + [1] *0 reshape shape :range length . rows(X) I

fold (+ trace) : Snull couple reshape shape :range length . . rows(X) I

