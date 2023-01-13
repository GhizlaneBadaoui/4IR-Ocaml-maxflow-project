open Graph
open Gfile

(* bipartiteMatching_result gr src tgt : returns the number of jobs assigned to candidates
 * related to the graph gh, starting from the node src and ending by the node tgt *)
val bipartiteMatching_result : int graph -> id -> id -> int


(* bipartiteMatching_graph gr src tgt pth : applicates Ford-Fulkerson algorithm to gr 
 * + generates dot format in pth
 * + displays the number of jobs assigned to candidates related to the graph gh, starting 
 * from the node src and ending by the node tgt *)
val bipartiteMatching_graph : int graph -> id -> id -> path -> unit





