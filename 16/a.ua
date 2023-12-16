M = parti id !=, @\n &fras "input"

Z = [... reshape :0 shape M]

U = 0
R = 1
D = 2
L = 3

X = indexof :".|-/\\"
W = *fork(>0/*< first shape M |>0/*>=0 |id) +join 0 ([neg1 0]|[0 1]|[1 0]|[0 neg1]) first . unbox

[]
row(box join 0) range first shape M
fold(join [fork(box join R rev|box join D)] unbox)
row(box join -1 first shape M) range first shape M
fold(join [fork(box join L rev|box join U)] unbox)

row(
under(pick|2;) unbox:Z
do(
fork(
      pick U
      X pick :M .where =2
      rows(box( [join U] #.
              | [join U] #|
              | [fork(join L|join R)] #-
              | [join R] #/
              | [join L] #\
              ))
    |
      pick R
      X pick :M .where =2
      rows(box( [join R] #.
              | [fork(join D|join U)] #|
              | [join R] #-
              | [join U] #/
              | [join D] #\
              ))
    |
      pick D
      X pick :M .where =2
      rows(box( [join D] #.
              | [join D] #|
              | [fork(join L|join R)] #-
              | [join L] #/
              | [join R] #\
              ))
    |
      pick L
      X pick :M .where =2
      rows(box( [join L] #.
              | [fork(join D|join U)] #|
              | [join L] #-
              | [join D] #/
              | [join U] #\
              ))
    |id
    )
joinjoinjoin
fold(join rows(box) unbox) :[]
dip(box>0)
unbox fold(box (;|under(pick|(2|1|2))) W dipunbox)

)(>0/+=2deshape)
/+/+>0 /+
)
/max
