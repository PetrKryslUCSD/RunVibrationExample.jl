using Pkg; 
Pkg.activate("."); Pkg.instantiate()
using Revise
using FinEtoolsMultimaterialVibEP: solve_ep
using MAT
using Gnuplot

parameterfile = "twoblocks.json"
solve_ep(parameterfile)

meshfilebase, ext = splitext(parameterfile)
file = matopen(meshfilebase * ".mat", "r")
Omega = read(file, "Omega")
close(file)

@gp sqrt.(abs.(Omega)) ./ (2*pi) "lw 3 title '$(parameterfile)'" :-
@gp  :- "set grid"  :-
@gp  :- "set xlabel 'Frequency SN [ND]'" :-
@gp  :- "set ylabel 'Frequency [Hz]'"