import random
with open("input") as i:
    [[[_, *seeds]], *rest] = [[y.split() for y in x.split("\n")] for x in i.read().split("\n\n")]

def convert(p, ss):
    for x in ss:
        if len(x) == 3 and x[1] <= p and p < x[1] + x[2]:
            return p - x[1] + x[0]
    return p

def solve(s):
    for q in rest:
        s = convert(s, [tuple([int(z) for z in y]) for y in q[1:]])
    return s

seeds = list(map(int, seeds))
def p1():
    out = []
    for seed in seeds:
        out.append(solve(seed))
    print(min(out))

p1()

def add(x, s):
    (xo, xi, xr) = x
    (so, si, sr) = s
    t = (xo - xi) + (so - si)
    lo = xi < si < xi + xr
    hi = xi < si + sr < xi + xr
    en = si < xi < xi + xr < si + sr
    match (lo, hi, en):
        case (0, 0, 0):
            return [s], x
        case (0, 0, 1):
            return [(so, si + 
        case (0, 1, 0):
            pass
        case (0, 1, 1):
            pass
        case (1, 0, 0):
            pass
        case (1, 0, 1):
            pass
        case (1, 1, 0):
            pass
        case (1, 1, 1):
            assert(False)


def simplify(n):
    (lo, r) = n
    pois = [(lo, lo + r)]
    for q in rest:
        rs = [tuple([int(z) for z in y]) for y in q[1:]]
        pp = []
        for (_, lo, r) in rs:
            for p in pois:
                if p[0] <= lo < p[1] or p[0] <= lo + r < p[1]:
                    pp.append((max(p[0], lo), min(p[1], lo + r - 1)))
        pois = pp + pois
        pois = [(a, b) for (a, b) in pois if a != 0 and b != 0]
        pois = [(convert(p[0], rs), convert(p[1], rs)) for p in pois]
    return pois

# 952477129 too high
# 50184598 too low
# 31255627 too low
x = [simplify((a, r)) for (a, r) in zip(seeds[::2], seeds[1:2])]
print(len(x))
print(min([min([*z]) for y in x for z in y]))

