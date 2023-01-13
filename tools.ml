open Graph


let clone_nodes (gr:'a graph) =
  n_fold gr new_node empty_graph;;


let gmap gr f = e_fold gr (fun a b c d -> new_arc a b c (f d)) (clone_nodes gr) ;;


let add_arc g id1 id2 n = 
  try
    match (find_arc g id1 id2) with
    | None -> new_arc g id1 id2 n
    | Some a -> new_arc g id1 id2 (a+n)
  with
    e -> g
;;




