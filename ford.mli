open Graph

type chain =  id list

val label_of_arc : int graph -> id -> id -> int

val smallest_value : int graph -> chain -> int -> int

val find_increased_chain :  int graph -> id -> id -> chain

(*val gap_graph : int graph -> int graph //pas besoin*)

(*val increase_flot : int graph -> chain -> int -> int graph*)