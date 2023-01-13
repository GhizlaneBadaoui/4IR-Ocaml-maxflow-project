open Graph

(* Is a list of ids *)
type chain =  id list


(* label_of_arc gr id1 id2 : returns the value of the arc between id1 and id2 *)
val label_of_arc : int graph -> id -> id -> int


(* smallest_value gr ch value : returns the smallest value between two nodes in ch 
 * value : is the value of the first arc of ch (useful for comparison) *)
val smallest_value : int graph -> chain -> int -> int


(* find_increased_chain gr id1 id2 : finds a chain that starts with id1 and ends with id2 in gr *)
val find_increased_chain :  int graph -> id -> id -> chain


(* occurences value list : counts the number of value occurrences in the list *)
val occurences : int -> int list -> int


(* add_flow_to_arc ch value gr id1 id2 lb: If the arc between id1 and id2 exists in the ch, it adds 
 * the flow (value) to the arc and creates a gap graph 
 * otherwise it returns the graph with the arc as it is in the initial graph gr *)
val add_flow_to_arc : chain -> int -> int graph -> id -> id -> int -> int graph


(* increase_flot gr ch value : adds the flow (value) for all the arcs of nodes in ch *)
val increase_flot : int graph -> chain -> int -> int graph


(* get_graph gr1 gr2 : compares gr1 (gap graph) and gr2 (initial graph) the get the result graph *)
val get_graph: int graph -> int graph -> int graph


(* ford gr id1 id2 : applicates Ford-Fulkerson algorithm to gr, source node is id1 and target node is id2 *)
val ford : int graph -> id -> id -> int graph