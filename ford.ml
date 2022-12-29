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
  let rec loop id liste_succ acu = 
    
    (*if (List.mem id acu) then [] else*)
      match  liste_succ with
        | [] -> []
        | (x,b)::rest -> 
          if x = id2 then x::acu 
          else 
            let res = (loop x (out_arcs gr x) (x::acu)) in
              if res=[] then (loop id rest acu) else res
  in
  List.rev (loop id1 (out_arcs gr id1) [id1])    
;;

(*Pour ajouter le flot trouvé à l'arc s'il existe dans la chaine augmentante sinon il return le graphe initial*)
let add_flow_to_arcs chaine value gr src tgt label = 
  if ((List.mem src chaine) && (List.mem tgt chaine)) then 
    if label>value then 
        match (find_arc gr tgt src ) with
        | None -> (new_arc gr tgt src value)
        | Some a ->  let x = (label_of_arc gr tgt src) in 
                     if ((x+value) >= label) then (new_arc (delete_arc gr src tgt) tgt src label) 
                     else (new_arc gr tgt src (x+value))
    else 
      (delete_arc gr src tgt)
  else (new_arc gr src tgt label)
;;

let increase_flot gr chaine value = 
  e_fold gr (add_flow_to_arcs chaine value) (clone_nodes gr)
;;

