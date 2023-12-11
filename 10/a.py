with open("input") as f:
    m = f.read().split()

mm = {}
for x in range(len(m)):
    for y in range(len(m)):
        mm[(x, y)] = m[y][x]
        if m[y][x] == "S":
            s = (x, y)

def add(a, b):
    return (a[0] + b[0], a[1] + b[1])

u = (0, -1)
d = (0, 1)
l = (-1, 0)
r = (1, 0)

ds = {}
ps = [s]
steps = -1
while ps:
    steps = steps + 1
    comming = []
    for p in ps:
        if p in ds: continue
        ds[p] = steps
        if p in mm:
            c = mm[p]
        else:
            c = '.'
        match c:
            case '-':
                dd = [l, r]
            case '|':
                dd = [u, d]
            case 'J':
                dd = [l, u]
            case 'L':
                dd = [r, u]
            case '7':
                dd = [l, d]
            case 'F':
                dd = [r, d]
            case 'S':
                dd = [l, r]
            case _:
                dd = []
        for x in dd:
            comming.append(add(x, p))
    ps = comming


# largest = 0
# for y in range(len(m)):
#     for x in range(len(m)):
#         if (ds.get((x, y)) or 0) == steps - 1:
#             largest = (x, y)
# 
# for y in range(-5, 5):
#     for x in range(-5, 5):
#         d = ds.get((x + largest[0], y + largest[1])) or 0
#         d = abs(d - 7110) if d > 7100 else '.'
#         print(d, end="")
#     print()
# 
# for y in range(-5, 5):
#     for x in range(-5, 5):
#         d = ds.get((x + largest[0], y + largest[1])) or 0
#         d = mm[(x + largest[0], y + largest[1])] if d > 7100 else '.'
#         print(d, end="")
#     print()

print(steps - 1)
