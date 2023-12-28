M ← each parse ⊜∘ ≠, @\n &fras "input"

Z ← [..[... ↯ :0 △ M]]

U ← 0
R ← 1
D ← 2
L ← 3

Q = under(pick0|0;)

N = (
  pick 1 .
  ( [fork(+[1 0 neg1 0] |Q +[0 0 0 1] |Q +[0 0 0 neg1])]
  | [fork(+[1 0 0 1]    |Q +[0 0 1 0] |Q +[0 0 neg1 0])]
  | [fork(+[1 0 1 0]    |Q +[0 0 0 1] |Q +[0 0 0 neg1])]
  | [fork(+[1 0 0 neg1] |Q +[0 0 1 0] |Q +[0 0 neg1 0])]
  )
  rows(/*[fork(<3pick0|*fork(< first shape M|>=0)pick2|*fork(< first shape M|>=0)pick3)]) .
  keep
)

[]
Z
[join 0 join R] 0_0

# P' M V
do(

  select rise pick ,,

  dipdip((;|&p) =0 mod 1000 . length .)
  # dip(&p /max/max .)
  # dipdip(&p.)

  fork( memb box first dipgapid
      | first
      | gapid
      | drop1 id
      | dedupjoin box first dipgapid
  )

  (
    # P M P'
    fork( fork(id|rows(pick drop2 :M)) N
        | deshape fix pick dipunbox
        | gapid
        )
    dip(+)
    dipdipbox
    dip(fold(under(pick|(min|max)=0.) dip(unbox:))).
    fork(join dipgapid|gapid)
  |
    :;
  )

)(*dip(:dip(=0 pick -1_1 shape M /max/max .)) >0length)
gapdipgapid
&p -fork(pick 0_0|pick -1_1 shape M) &p. /max/max
