open Graph
open Tools

type chain =  id list


let label_of_arc gr id1 id2 = 
  match (find_arc gr id1 id2) with
  | None -> 0
  | Some x -> x  
;; 


let rec smallest_value gr chaine petit =
  match chaine with 
  | [] -> petit
  | _::[] -> petit
  | x::y::rest -> if (label_of_arc gr x y)<petit then (smallest_value gr (y::rest) (label_of_arc gr x y)) else (smallest_value gr (y::rest) petit)
;;


let rec occurences x l = 
  match l with
  | [] -> 0
  | hd::rest -> if hd=x then 1+(occurences x rest) else (occurences x rest)
;;


let find_increased_chain gr id1 id2 = 
  let rec loop id liste_succ acu = 
    
    (* Tests if there is not a cycle *)
    if (occurences id acu)>1 then [] else

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


let add_flow_to_arc chaine value gr src tgt label = 
  if ((List.mem src chaine) && (List.mem tgt chaine)) then 
    if label>value then 
        match (find_arc gr tgt src ) with
        | None -> (new_arc (new_arc gr tgt src value) src tgt label)
        | Some a ->  let x = (label_of_arc gr tgt src) in 
                     if ((x+value) >= label) then (new_arc (delete_arc gr src tgt) tgt src label) 
                     else (new_arc gr tgt src (x+value))
    else 
      (new_arc (delete_arc gr src tgt) tgt src label)
  else (new_arc gr src tgt label)
;;


let increase_flot gr chaine value =
  e_fold gr (add_flow_to_arc chaine value) (gr)
;;


let get_graph gap_gr gr = 
  let gr_final = e_fold gap_gr (fun a b c d -> match (find_arc gr b c) with
  | None -> new_arc a b c d
  | Some x -> if x = d then match (find_arc a c b) with 
                            |None -> new_arc a b c 0
                            |Some x -> delete_arc a b c 
                       else new_arc a b c d) (gap_gr) in 
  e_fold gr_final (fun a b c d -> match (find_arc gr c b) with
              | None -> new_arc a b c d
              | Some x -> delete_arc (new_arc a c b d) b c ) (gr_final)
;;


let ford gr src tgt = 
  let rec aux gr src tgt =
    let chaine = find_increased_chain gr src tgt in
    if chaine=[] then gr else
      let small_val = smallest_value gr chaine (label_of_arc gr (List.hd chaine) (List.nth chaine 1)) in 
      aux (increase_flot gr chaine small_val) src tgt
  in
  get_graph (aux gr src tgt) gr
;;
