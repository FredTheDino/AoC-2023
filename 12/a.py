import functools

def parse(line):
    [l, r] = line.split(" ")
    return (l, list(map(int, r.split(","))))

@functools.cache
def req(l, r):
    if not r: return 0
    for _ in range(r[0]):
        if (not l) or l[0] == ".": return 0
        l = l[1:]
    if l and l[0] == "#": return 0
    return chomp(l[1:], r[1:])

@functools.cache
def chomp(l, r):
    if not r and not l: return 1
    if not l: return 0
    return (chomp(l[1:], r) if l[0] != "#" else 0) \
         + (req(l, r) if l[0] != "." else 0)

def solve1(args):
    return chomp(args[0], tuple(args[1]))

def solve2(args):
    return chomp(((args[0] + "?") * 5)[:-1], tuple(args[1] * 5))

with open("input") as f:
    lines = f.readlines()

print(sum([solve1(parse(line)) for line in lines]))
print(sum([solve2(parse(line)) for line in lines]))
