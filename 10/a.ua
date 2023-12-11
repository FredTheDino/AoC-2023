Sp ← ⊜∘≠,
I ← Sp @\n &fras "input"
Empty ← ↯ △ I 0

R ← [0 1]
L ← [0 ¯ 1]
D ← [1 0]
U ← [¯ 1 0]

S ← =@S I

X ← +× ⊙(=)
Q ← ⊝[⊃(X U@||X D@|
       |X L@-|X R@-
       |X U@L|X R@L
       |X U@J|X L@J
       |X D@7|X L@7
       |X R@F|X D@F
       |X R@S|X L@S
       )]

RemoveFrom ← keep:dip(fill0 pick) .:

StripNeg = keep not rows(+fork(<0 first take1|<0 first drop1)) .

StepAll ← °□ ⊝/(⊂ °□:°□) ≡(□ Q fill@. ⊡ :I .)
ExpandMap ← (
  ⊙(+1)
  ⊙⊙(StepAll)
  ⊙(×,:⊙(°⊚ . RemoveFrom):=0).
  ⬚0↥
)

Color = [fork(>0|>0|>0) >0]

⍢(ExpandMap)(=⊙(:⊙.) /↥♭) S 1 ⊚ S

take pick 1 shape I rows(take pick 0 shape I)
dip(-2)

# table(**fork(>0|<=20|div 20) -+20) range ,
# &p /max /max .

# &fwa "out.gif" &gife 60.0
# &fwa "out.png" &ime "png" each(Color)
dip(&p)
;

# 7110 - Too low
# 7111 - Too low
# 7112 - Too low
