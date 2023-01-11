open Graph
open Gfile
open Ford
open Tools


let bipartiteMatching_result gr src tgt = 
  let gr_result = (ford gr src tgt) in
  let rec aux = function
  | [] -> 0
  | (a,l)::rest -> if l = 1 then 1+(aux rest) else (aux rest)
in
aux (out_arcs gr_result src)
;;

let bipartiteMatching_graph gr src tgt outfile = 
  let gr_result = gmap (ford gr src tgt) (fun a -> string_of_int(a)) in 
  let () = export outfile gr_result in
  ()
;;
  