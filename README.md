# README

Summary: Find the solution of the free vibration problem for multimaterial domains created in Comsol.


*Please run with Julia 1.9.0 and above.*

## Run the simulation

Make sure your working directory is the folder  `RunVibrationExample` as set up  by the cloning of this repository.
Run the script  `run.jl` in Julia as follows
```
include("run.jl") 
```
It is possible that the first time this script is run  it will take longer: an update of the Julia  registry needs to be performed so that all the packages needed for the simulation are installed.
When the script finishes, it prints the computed natural frequencies, and it writes out the output into files.
A plot of the frequencies is also produced.

## Results

Assuming as above that the parameter file was called  `"twoblocks.json"`, the output is written in the Matlab format into `twoblocks.mat`.  The following quantities are included:

- Eigenvalues. 
- Eigenvectors. 
- The surface panels. The connectivity `conn` (connectivity of the surface panels), and the coordinates `X` (coordinates of all the nodes in the mesh).  
- Areas of the surface panels in the order in which the connectivity is given.
- Sparse matrix of the acoustic coupling. 


