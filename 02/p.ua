SplitBy = ⊜□≠, 
P ← *dip≍
PP = ++fork(P 1_0_0 "red" | P 0_1_0 "green" | P 0_0_1 "blue" )
Y = * fork(parse unbox pick 0|PP unbox pick 1) SplitBy @ unbox 
X = rows (reduce +) trans rows(Y) SplitBy @, unbox

Q ← under pick(parse unbox) 0 under pick(box rows(X) SplitBy @; unbox) 1 SplitBy @: ↘5
W = reduce* under pick( reduce* reduce* rows(reduce* <= 12_13_14 )unbox) 1 Q
&p reduce+ rows(W unbox) SplitBy @\n &fras "input02"

G = reduce+ reduce* reduce* rows(reduce maximum) trans unbox pick 1 Q
&p reduce+ rows(G unbox) SplitBy @\n &fras "input02"
