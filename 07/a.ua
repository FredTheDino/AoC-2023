Sp ← ⊜□≠,


S = rev [ @A @K @Q @J @T @9 @8 @7 @6 @5 @4 @3 @2 ]
X = rev [ @A @K @Q @T @9 @8 @7 @6 @5 @4 @3 @2 ]
Xx = rev [ @A @K @Q @T @9 @8 @7 @6 @5 @4 @3 @2 @J ]

Count = rows(/+) table(=) trans .

Type = (
  ⊏ rise +fork(*100 Count|rows(indexof : S)) .
  class 
  length dedup . 
  (0;|7;|(5|6) pick 1 |(0|3|4) pick 2 |2;|1;)
)
Nf = fold (*100+ indexof : S) : *100 Type . 
Nff = fold (*100+ indexof : S) : *100 Type . keep !=@J .
Wins = >Nf:Nf

&p /+ *+1 range length . first rev trans select rise . rows([fork(Nf take 5| parse drop 6)] unbox) Sp @\n &fras "input"

Best = (
  repeat(
    where =@J . 
    first join:100
    =100 .
    (
      table(join :unbox:unbox) table(box join unbox:unbox) X fork(box take|box drop +1)
      first ⊏ fall rows(Nf) .
    | ;
    )
  ) 5
)

# 254914036 Too high :/
All = (
  keep !=@J .
  ⊏ fall +fork(*100 Count|rows(indexof : S)) .
  repeat(join fill@A take 1 .) -:5 length .
)

&p /+ *+1 range length . first rev trans select rise . rows([fork(Nff Best take 5| parse drop 6)] unbox) Sp @\n &fras "input"

---
⍤⊃⋅∘≍ [ 1 1 1 1 ] rows(Wins first rev : first .) windows 2  [ "32T3K" "KTJJT" "KK677" "T55J5" "QQQJA" ]

⍤⊃⋅∘≍ 7 Type "AAAAA"
⍤⊃⋅∘≍ 6 Type "AA8AA"
⍤⊃⋅∘≍ 5 Type "23332"
⍤⊃⋅∘≍ 4 Type "TTT98"
⍤⊃⋅∘≍ 3 Type "23432"
⍤⊃⋅∘≍ 2 Type "A23A4"
⍤⊃⋅∘≍ 1 Type "23456"

⍤⊃⋅∘≍ 1 Type "12345"
⍤⊃⋅∘≍ 2 Type "32T3K"
⍤⊃⋅∘≍ 3 Type "KTJJT"
⍤⊃⋅∘≍ 3 Type "KK677"
⍤⊃⋅∘≍ 4 Type "T55J5"
⍤⊃⋅∘≍ 4 Type "QQQJA"
---

