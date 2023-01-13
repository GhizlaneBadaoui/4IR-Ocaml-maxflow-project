# OCaml project 
By walid EL-ASSIMY & Ghizlane BADAOUI 

The code is organized into 5 modules (Graph, Gfile, Tools, Ford, Bipartite), two main files (ftest.ml and biproblem.ml) and a Makefile:
 - Graph: contains all functions related to graphs.
 - Gfile: to read, write and generate files.
 - Tools: contains functions for the manipulation of graphs.
 - Ford: implements all functions related to the Ford-Fulkerson algorithm.
 - Bipartite:  implements all functions related to the Bipartite Matching problem.


## Compilation and execution:
A makefile provides some useful commands:
 - `make` to compile. This creates a ftest.byte and biproblem.byte executable
 - `make ford` to run the `ftest` program with some arguments (2 examples of graphs)
 - `make bipartite` to run the `biproblem` program with some arguments (3 examples of problems)
 - `make mrproper` to remove build artifacts
