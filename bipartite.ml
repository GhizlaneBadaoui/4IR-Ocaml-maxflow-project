open Graph
open Gfile
open Ford
open Tools


let bipartiteMatching_result gr src tgt = 

  (* Applicates Ford-Fulkerson algorithm to gr *)
  let gr_result = (ford gr src tgt) in

  (* Counts jobs assigned to candidates *)
  let rec aux = function
  | [] -> 0
  | (a,l)::rest -> if l = 1 then 1+(aux rest) else (aux rest)
in
aux (out_arcs gr_result src)
;;


let bipartiteMatching_graph gr src tgt outfile = 
  (* Applicates Ford-Fulkerson algorithm to gr and transformes the graph to strong graph *)
  let gr_result = gmap (ford gr src tgt) (fun a -> string_of_int(a)) in 
  let () = export outfile gr_result in
  ()
;;
  