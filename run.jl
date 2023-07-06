using Pkg; 
Pkg.activate("."); Pkg.instantiate()
using Revise
using FinEtoolsMultimaterialVibEP: solve_ep
using MAT
using PlotlyLight

parameterfile = "twoblocks.json"
solve_ep(parameterfile)

meshfilebase, ext = splitext(parameterfile)
file = matopen(meshfilebase * ".mat", "r")
Omega = read(file, "Omega")
close(file)

pl = PlotlyLight.Plot()
pl(x = collect(1:length(Omega)), y = sqrt.(abs.(Omega)) ./ (2*pi), mode="lines+markers")
pl.layout.title.text = "Natural frequencies"
pl.layout.xaxis.title = "Frequency SN [ND]"
pl.layout.yaxis.title = "Frequency [Hz]"

display(pl)

