SplitBy ← ⊜□≠,

I ← ≡⊔ SplitBy @\n &fras "input03"
Dmap ← ∵(×≤@9:≥@0 .) I
Smap ← - Dmap ⊞≠ @. I
Sq ← =. ↯ 3_3 ⇡ 9

GrowUp ← ⇌ ⬚0⊂ [0] ⇌ ↘ 1
GrowDown ← ⬚0⊂ [0] ⇌ ↘ 1 ⇌
GrowSq ← ⍜(⍉)(+GrowDown . + GrowUp .) +GrowDown . + GrowUp .
GrowDi ← ≠0 +++⊃(⍜(⍉)(GrowDown)|⍜(⍉)(GrowUp)|GrowDown|GrowUp)
GrowDig ← ≠0 + GrowDi .

&p /+ ≡(parse ⊔) SplitBy @. ♭ ≡(⊂ ".") ∵(@.;|∘) :I ⍥(× Dmap GrowDig) 20 × Dmap ≠0 GrowSq Smap

KrowUp ← ⇌ ⬚0⊂ [0] ⇌ ↘ 1
KrowDown ← ⬚0⊂ [0] ⇌ ↘ 1 ⇌
KrowSq ← ⍜(⍉)(↥ KrowDown . ↥ KrowUp .) ↥ KrowDown . ↥ KrowUp .
KrowDi ← ↥ ↥ ↥ ⊃(⍜(⍉)(KrowDown)|⍜(⍉)(KrowUp)|KrowDown|KrowUp)
KrowDig ← ↥ KrowDi .

Gmap ← ⊞= @* I
Gnmap ← × Gmap ↯ : + 1 ⇡ /× . △ Gmap
Nmap ← ⍥(× Dmap KrowDig) 20 × Dmap KrowSq Gnmap

Cogs ← ▽ ≠0.× ♭ ⊙(=2 ≡(/+) ⊠(/+ ⌕)) . ⊝ . ∵(⊔ ⊝) ⊜□. ♭ Nmap

&p /+ ≡(/× ≡(parse ⊔) SplitBy @. ♭ ≡(⊂ ".") ∵(@.;|∘) :I) ⊠= Cogs Nmap
