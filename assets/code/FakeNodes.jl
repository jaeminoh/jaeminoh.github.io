using RationalFunctionApproximation
using BarycentricInterpolation
using Plots, LaTeXStrings

u(x) = 1 / (1 + x^2)

xx = LinRange(-1.0, 1.0, 31)
values = u.(xx)
cheb = Chebyshev2{30}()

S(xx) = @. cos(π * (xx + 1.0) / 2)
nodes = S(xx)

f = Barycentric(nodes, values, weights)
c = Barycentric(cheb.nodes, u.(cheb.nodes), cheb.weights)

uu = u.(xx_test)
cc = c.(xx_test)
test_nodes = S(xx_test)
ff = f.(test_nodes)

plot(
    xx_test, uu, label="\$u = 1 / (1 + x^2)\$",
    line=:solid, xlabel=L"x", ylabel=L"y", linewidth=4, dpi=300
)
plot!(xx_test, cc, label="\$c\$: Chebyshev interpolant", line=:dash, linewidth=4)
plot!(xx_test, ff, label="\$f\$: fake nodes", line=:dashdotdot, linewidth=4)
savefig("figures/fake_nodes.png")
