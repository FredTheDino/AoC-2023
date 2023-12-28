# Advent of Code 2023
https://adventofcode.com/2023
Solutions (mostly) use Uiua (https://github.com/uiua-lang/uiua)
```
$ uiua --version
uiua 0.7.0
```

At least `version 0.7.0` is required.

## Why?
I haven't really messed a lot with Array languages - and it was fun to twiddle with something that was new. The change to array programming limited usage of recursion and loops - this limitation made some solutions infeasible or really hard to write. In my end I feel I succeeded in learning something new - which is described bellow.

I've in recent years started dabbling in programming languages, which has made me extra interested in new ideas. But new ideas are rare, but I am starting to believe this is a fundamentally new idea.

# What I Learned
I feel I've in some sense unlocked a new way of thinking - which was exactly what I was after. I think my horizons have been widened and that I've gotten new insights into programming languages as a whole. Here's a short list of my main points for those who care little for details or nuance:
1. Terseness itself is a feature, more ideas with less ink is good
2. Modern mathematics is a lot more efficient than stack-languages at expressing math
3. Having composition, application and map look identical is a really strong abstraction
4. Loops are hard in Uiua
5. 

## Briefly on Uiua
Uiua has a huge focus on tacit programming (I have heard it described more as point-free). In general people consider tacit programming to be write-only code - it is also something people often consider APL or similar languages to be. After some time with a language like this I can safely say that that is a huge oversimplification.

Readability in Uiua (and I suspect APL) comes from not hiding details. We can consider some short programs in different languages.
This language checks if an array is a palindrome and is taken from Uiuas documentation:
```
≍⇌.
```
The program consists of 3 operations: `.` - duplicate: copies the top value on the stack, `⇌` - reverse: reverses the direction of the top stack value, `≍` - match: check if the two top values on the stack are equal it returns a 1 otherwise a 0. (If you think languages should have "real booleans" I hope you aren't using Python - since `Bool` is an instance of `Int`.)

Uiua does not have boolean operators - but that is hardly a problem. `and` can easily be expressed with multiplication and `or` maps to addition. 

Compare this with the very similar Python program:
```
x[::-1] == x
```
or if that is too scary you might consider this more verbose solution:
```
all(x[i] == x[-i-1] for i in range(len(x)//2))
```

Or compare it to some ML-language (Haskell/PureScript) (if you're using Arrow you can stop reading):
```
\x -> (reverse x) == x
```

Before people claim that there are different performance characteristics between these programs - a sufficiently advanced compiler could easily optimize any of these programs. If you're striving for a 2x speed up you're probably digging in the wrong places, most systems I've worked could easily solve all this problem with a cache and that way get way more than a 2x speedup. (Uiua and Python have memoization built in while ML-languages usually lean heavily on their referential transparency to unlock insane optimizations.)

No matter what solution you consider more legible they all more or less convey the same idea. They all share some components: `equivelence` and `reversing` - or some kind of order. All solutions but Uiua are required to have syntax to name and refer to variables (unless you want to get freaky with your Haskell).

Now, some people do not care for the feature that entire programs can fit on your screen - when I was solving Advent of Code I could almost always fit the entire solution on a quarter of my screen. In some sense this was really liberating since I could have the problem description easily available and readable.

## Tacit programming, a blessing and a boon
Uiua programs do not have variables. This is usually fine - except 2 circumstances which I've identified.
 1. Mathematical notation does not translate well to a stackbased language.
 2. Handling a lot of state on your stack - I can only handle 3 things before I cease to function

For both points, I refer to the [documentation of Uiua itself](https://www.uiua.org/docs/advancedstack#planet-notation):
```
f(a,b,c,x) = (a+x)(bx-c)
```
Which is equivalent to the following Uiua code:
```
×⊃(+⊙⋅⋅∘|-⊃⋅⋅∘(×⋅⊙⋅∘))
```
This kind of function is not easy to write in Uiua and it shows. Mathematics is just brutally efficient at communicating this kind of idea. This is also the case when handling multiple variables on your stack - and you are simply required to break these things apart where possible. Sometimes this results in cleaner code that is easier to work with.

I vividly remember the day that was a variant on the `finding the shortest path`-problem, day 17. I never managed to solve the problem - maybe because my code had sever bugs - or maybe because I couldn't muster up enough mental energy to reason about my program in full. I suspect that my implementation is wrong and I'll get it right if I look at it again, but I have already spent too much time on that day. This is a problem with Uiua - more complex algorithms can be insanely hard to implement.

## Fearfull Loops and Development Experience
Uiua is very limited in the kinds of loops that are available - it has your reduces, folds and while-loops. But that is about it. The condition for the while-loops (called `do` in Uiua) is evaluated before entering the loop and does some automatic stack shenanigans - this makes it hard to iterate on the code in the loop if you're doing some exploratory coding. Exploratory coding happens more than one thinks when you are unused to the language itself.

Except for the loops and the folds, Uiua has a very nice iterative development flow - where you write some code and see what happens. I found this immensely liberating after using heavy-duty type-checkers for my daily work.

In the beginning you'll need to reference the very helpful documentation quite often but you'll soon learn the names of the 10 or so operations you're using regularly and know where to look for the other operations you need.

### I Dislike Uiua Boxes
Uiua also has a concept called `Boxes` - since all arrays have to have the same length of sub-arrays boxes are the only way to e.g. have strings of different lengths in the same array. Arrays are also sometimes looped over together when folding which can cause trouble, and the way out of that is boxing the array you don't want to iterate over.

I might be inexperienced with array languages, but I see little value in having the `box` and `un box` operation spread out in my code. So don't take my word for it - but it is one other thing that can easily nip you when working with loops.

## Composition, application
Since Uiua is a stack-array language you get some quite unique syntactic properties. My absolute favorite of these is that function application and function composition look the same. It is not often the case that some pieces of this code is mistaken for each other, the context of the code usually tell them apart and I'm rarely concerned with the details of how operations apply - I am more interested in the operations that actually do the operations.

Consider this piece of Uiua code:
```
IsPal = ≍⇌.
Sum = /+

Sum ≡IsPal
```
The `IsPal` function is from earlier. But the `Sum` function is new and lo and behold sums up an array, by using `/` (reduce) and `+` (addition). This piece of code counts how many elements of an array are palindromes. We've written two functions, than we then combined. But since it is written pointfree composition and application look identical. Calling this code keeps the illusion and abstraction going:
```
Sum ≡IsPal { "ABC" "AAA" "Q" }
```
We didn't have to change anything about our code, and we can easily pipeline something else before or after the palindrome counting. This flexibility is insane when you compare it with a C-style language. Let's jump back to Python and compare this:
```
# Assuming we have a readable `isPal` function
def isPal(x):
    ...

def countPalindromes(xs):
    return sum(isPal(x) for x in xs)
```
I am personally a huge fan of Python, and it has been one of my go to languages when I need anything more complex than a regex matching engine. This kind of flexibility is what people usually rave on about with ML-languages, but it is intrinsically tied to the syntax of the language. Uiua circumvents the problems of passing arguments by using a stack - since the stack is required for execution composition and application look and behave identically since they are in fact identical. This makes naming arguments unnecessary which removes more of the burden of syntax. The only other languages I know that do this are Haskell and PureScript - where they have an operator for function composition. 

## Closing Thoughts
When I've been defining languages I've always thought of syntax as an after thought and that terse-ness and tacit programming was something people did to golf solutions. Recently I've changed my mind (something more people should do more often and be more open about) - programming languages have a huge unexplored design space with these kinds of operations and semantics - which are embedded in the syntax of the language.

The kind of flexibility the language gets from the concept of function composition should not be understated. Since it is the only kind of operation I've seen which makes it easier to cobble together other pieces of code.

I feel like I'm just scratching the tip of the ice-berg here. :)
