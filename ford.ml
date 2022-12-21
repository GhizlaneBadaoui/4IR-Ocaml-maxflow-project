open Graph
open Tools

type chain =  id list

(* renvoie la valeur d'un arc, il renvoie jamais 0, puisque l'arc de id1 vers id2 existe---> DONE*)
let label_of_arc gr id1 id2 = 
  match (find_arc gr id1 id2) with
  | None -> 0
  | Some x -> x  
;; 

(* pour commencer : petit contient la première valeur de la chaine (on peut pas avoir une valeur inférieure à 0 )---> DONE*)
let rec smallest_value gr chaine petit =
  match chaine with 
  | [] -> petit
  | _::[] -> petit
  | x::y::rest -> if (label_of_arc gr x y)<petit then (smallest_value gr (y::rest) (label_of_arc gr x y)) else (smallest_value gr (y::rest) petit)
;;

(* renvoie toutes les chaines possibles d'un graphe ---> DONE*)
let find_increased_chain gr id1 id2 = 
  let rec aux id list_succ acu = 
    
    if (List.mem id acu) then [] else
      match  list_succ with
        | [] -> []
        | (x,b)::rest -> 
          if x = id2 then x::acu 
          else 
            let res = (aux x (out_arcs gr x) (x::acu)) in
            if res=[] then (aux id rest acu) else res
  in
  List.rev (aux id1 (out_arcs gr id1) [id1])    
;;

(*Pour ajouter le flot trouvé à l'arc s'il existe dans la chaine augmentante sinon il return le graohe initial*)
let add_flow_to_arcs chain valu gr s t a = 
  if ((List.mem s chain) && (List.mem t chain)) then (new_arc gr s t (a+valu)) else (new_arc gr s t a)
;;

let increase_flot gr chain valu = 
  e_fold (add_flow_to_arcs chain valu) empty_graph
;;