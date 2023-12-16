# Input
I ← ⊜∘ ≠ , @\n &fras "input"
W ← =@# I
B ← =@O I

North ← (
  1
  ⍢(
    ;
    ⊚ =@O . .
    ∧(
      (=0 ⊗:".O#" ⊡|0;;) <0⊡0. ⍜(⊡0|-1) ,,
      (;|⍜(⊡|@O;) ⍜(⊡0|-1) ⊙(⍜(⊡|@.;)).)
    )
    :⊙(¬ ≍).
  )(∘)
  ;
)
Load ← /++1 ≡(⊡ 0) ⊚ =@O ⇌ ⍉ ⇌ ⍉
North I
&p Load
&p "-------"

Cycle ← ⍥(⍉ ⇌ North) 4
I
⍥(&p Load . Cycle) 120

# mod Loop - Offset 1000000000
