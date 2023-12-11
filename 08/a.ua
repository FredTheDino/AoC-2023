SplitAt ← ⊃(↙|↘ +1) ⊗ ⊙.

∵(= @R) SplitAt @\n &fras "input"
Inst ←
⊜∘ ≠ , @\n ↘ 1
≡(⊜□ 1_1_1_0_0_0_0_2_2_2_0_0_3_3_3_0)
.⊏⍏.
Named ←
⍜(♭|⊛)
FullMap ←

Map ← ≡(↘1) ⊏ ⍏ . FullMap

Start ← ⊢ ⊡ :FullMap ⊗ □ "AAA" ≡(⊢) Named
Goal ← ⊢ ⊡ :FullMap ⊗ □ "ZZZ" ≡(⊢) Named

OneStep ← ⊓(∘|+1) ⊡:⊡ :Map : ⊡:Inst◿⧻Inst ,

;&p : ⍢(OneStep)(≠ Goal.) Start 0

Starts ← ≡(⊢ ⊡ :FullMap) ⊚ ≡(= @A ⊢ ⇌ ⊔ ⊢) Named
Ends ← ≡(⊢ ⊡ :FullMap) ⊚ ≡(= @Z ⊢ ⇌ ⊔ ⊢) Named

≡(⍢(OneStep)((1|0) ∊:Ends) OneStep :0) Ends Ends
&p ↯ [3 ⧻ Starts] ⊂⊂
