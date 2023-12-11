Sp ← ⊜□≠,
Sk ← ⊕□⍜▽¯:\+.=,

I ← Sk @\n &fras "input"

Seeds ← ≡(parse ⊔) Sp @ ↘7 ⊔ ⊢ I

P ← □ ∵(parse ⊔) ≡(Sp @ ⊔) ↘1

U ← ⊃(⊢|⊢↘1|⊢↘2)

M ← ⊜(P) ≡(≠0 ⧻ ⊔). ↘2 I

Rare ← ⊏⊢⍏⍘⊚⊛:⊝.

M ← ≡(□⊂⊚3⊔) M

Map ← (⋅⋅∘|+-:)×⊃(≥⋅⊙⋅∘|⋅(<+)|⊙⊙⋅∘) U
H ← ∧(Rare ⊂⊂ ⊃(/↧|/↥) ≡(Map) ⊔ ⊙.) M
&p /↧ ≡(H) Seeds
&p "----"

X = 500
N = 50
dipgapid repeat(join rows(+ floor * rand first drop1 :first .),) X [] reshape rev [2 %2] first shape . Seeds

F = (
  .
  reshape rev [2 %2] first shape . Seeds
  keep /+ cross(*fork(>=first|<+first rev:first.))
  (;|&p) < 10000000000 . /↧ ≡(H) .
)

fork(repeat(-1 F) N| repeat(+1 F) N)
