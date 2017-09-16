︠6a32176b-4e9e-4379-a030-445f0fa6d6a4s︠
%var x1, x2, x3, x4
%var c1, c2, c3

N = vector([x1, x2, x3, x4])
V1 = vector([-x2, x1, -x4, x3])
V2 = vector([-x3, x4, x1, -x2])
V3 = vector([-x4, -x3, x2, x1])

A = matrix([N, V1, V2, V3])
D = A.det()

show(A)
show(D)
# show(A.inverse()) # What a mess!
︡d15c69b3-0659-4f9f-9b52-09fd52747f44︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rrrr}\nx_{1} &amp; x_{2} &amp; x_{3} &amp; x_{4} \\\\\n-x_{2} &amp; x_{1} &amp; -x_{4} &amp; x_{3} \\\\\n-x_{3} &amp; x_{4} &amp; x_{1} &amp; -x_{2} \\\\\n-x_{4} &amp; -x_{3} &amp; x_{2} &amp; x_{1}\n\\end{array}\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle x_{1}^{4} + 2 \\, x_{1}^{2} x_{2}^{2} + x_{2}^{4} + 2 \\, x_{1}^{2} x_{3}^{2} + 2 \\, x_{2}^{2} x_{3}^{2} + x_{3}^{4} + 2 \\, x_{1}^{2} x_{4}^{2} + 2 \\, x_{2}^{2} x_{4}^{2} + 2 \\, x_{3}^{2} x_{4}^{2} + x_{4}^{4}$</div>"}︡{"done":true}︡
︠7d535554-93a2-4b12-ae0b-887c144019cds︠
P1 = vector([1, 0, 0, 0])
P2 = vector([0, 1, 0, 0])
P3 = vector([0, 0, 1, 0])
P4 = vector([0, 0, 0, 1])

D(*P1)
D(*P2)
D(*P3)
D(*P4)
︡7ce13e4e-cb5b-4790-a2b2-c3610bd1bba4︡{"stdout":"1\n"}︡{"stdout":"1\n"}︡{"stdout":"1\n"}︡{"stdout":"1\n"}︡{"done":true}︡
︠890cb2da-5836-45ef-87d3-d622e2cfd0ces︠
C = (x1^2 + x2^2 + x3^2 + x4^2)^2
show(C.expand())
show(D)
︡5a9665ab-d14c-4bec-aeb5-3b9f9aa0b032︡{"html":"<div align='center'>$\\displaystyle x_{1}^{4} + 2 \\, x_{1}^{2} x_{2}^{2} + x_{2}^{4} + 2 \\, x_{1}^{2} x_{3}^{2} + 2 \\, x_{2}^{2} x_{3}^{2} + x_{3}^{4} + 2 \\, x_{1}^{2} x_{4}^{2} + 2 \\, x_{2}^{2} x_{4}^{2} + 2 \\, x_{3}^{2} x_{4}^{2} + x_{4}^{4}$</div>"}︡{"html":"<div align='center'>$\\displaystyle x_{1}^{4} + 2 \\, x_{1}^{2} x_{2}^{2} + x_{2}^{4} + 2 \\, x_{1}^{2} x_{3}^{2} + 2 \\, x_{2}^{2} x_{3}^{2} + x_{3}^{4} + 2 \\, x_{1}^{2} x_{4}^{2} + 2 \\, x_{2}^{2} x_{4}^{2} + 2 \\, x_{3}^{2} x_{4}^{2} + x_{4}^{4}$</div>"}︡{"done":true}︡
︠c0d6a3d0-b7b2-4efe-aa27-16a67818ecf9s︠
I = matrix(4, 4, x1)
S = A - I

show(A)
show(I)
show(S)
︡839efc09-cb20-4f88-b54b-f1995a89ef57︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rrrr}\nx_{1} &amp; x_{2} &amp; x_{3} &amp; x_{4} \\\\\n-x_{2} &amp; x_{1} &amp; -x_{4} &amp; x_{3} \\\\\n-x_{3} &amp; x_{4} &amp; x_{1} &amp; -x_{2} \\\\\n-x_{4} &amp; -x_{3} &amp; x_{2} &amp; x_{1}\n\\end{array}\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rrrr}\nx_{1} &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; x_{1} &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; x_{1} &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; x_{1}\n\\end{array}\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rrrr}\n0 &amp; x_{2} &amp; x_{3} &amp; x_{4} \\\\\n-x_{2} &amp; 0 &amp; -x_{4} &amp; x_{3} \\\\\n-x_{3} &amp; x_{4} &amp; 0 &amp; -x_{2} \\\\\n-x_{4} &amp; -x_{3} &amp; x_{2} &amp; 0\n\\end{array}\\right)$</div>"}︡{"done":true}︡
︠ca19793b-bb63-4f1e-9567-54e6f44fabb2︠
n = 4

X = list(var('x_%d' % i) for i in range(1,2*n+1))

# Not needed when computing determinants, but I was thinking of using this to show the linear system A C = 0 has only the trivial solution
C = list(var('c_%d' % i) for i in range(2*n))

N = vector(X)

# Create our frame
V = [N]
for i in range(1, 2*n):
    V += [vector(sum([[-X[2*i+1], X[2*i]] for i in range(n)], []))] # using sum like this is inefficient for large n - use itertools instead!


A = matrix([V[i] for i in range(2*n)])

show(A)
A.det()
︡dbf25858-5b4d-4764-ada7-5b65acf1d0d2︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rrrrrrrr}\nx_{1} &amp; x_{2} &amp; x_{3} &amp; x_{4} &amp; x_{5} &amp; x_{6} &amp; x_{7} &amp; x_{8} \\\\\n-x_{2} &amp; x_{1} &amp; -x_{4} &amp; x_{3} &amp; -x_{6} &amp; x_{5} &amp; -x_{8} &amp; x_{7} \\\\\n-x_{2} &amp; x_{1} &amp; -x_{4} &amp; x_{3} &amp; -x_{6} &amp; x_{5} &amp; -x_{8} &amp; x_{7} \\\\\n-x_{2} &amp; x_{1} &amp; -x_{4} &amp; x_{3} &amp; -x_{6} &amp; x_{5} &amp; -x_{8} &amp; x_{7} \\\\\n-x_{2} &amp; x_{1} &amp; -x_{4} &amp; x_{3} &amp; -x_{6} &amp; x_{5} &amp; -x_{8} &amp; x_{7} \\\\\n-x_{2} &amp; x_{1} &amp; -x_{4} &amp; x_{3} &amp; -x_{6} &amp; x_{5} &amp; -x_{8} &amp; x_{7} \\\\\n-x_{2} &amp; x_{1} &amp; -x_{4} &amp; x_{3} &amp; -x_{6} &amp; x_{5} &amp; -x_{8} &amp; x_{7} \\\\\n-x_{2} &amp; x_{1} &amp; -x_{4} &amp; x_{3} &amp; -x_{6} &amp; x_{5} &amp; -x_{8} &amp; x_{7}\n\\end{array}\\right)$</div>"}︡{"stdout":"0"}︡{"stdout":"\n"}︡{"done":true}︡









