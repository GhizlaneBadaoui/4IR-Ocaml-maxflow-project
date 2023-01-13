open Gfile
open Tools
open Ford
open Bipartite
    
let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf
        "\n ✻  Usage: %s infile source sink outfile\n\n%s%!" Sys.argv.(0)
        ("    🟄  infile  : input file containing a graph\n" ^
         "    🟄  source  : identifier of the source vertex (used by the ford-fulkerson algorithm)\n" ^
         "    🟄  sink    : identifier of the sink vertex (ditto)\n" ^
         "    🟄  outfile : output file in which the result should be written.\n\n") ;
      exit 0
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)
  
  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)
  
  (* These command-line arguments are not used for the moment. *)
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in

  (* Open file *)
  let graph0 = from_file infile in
  let graph1 = gmap graph0 (fun a -> int_of_string(a)) in

  (* Afficher la solution *)
  Printf.printf " >>>>>>>> Nombre de jobs affectés est : %d  \n\n\n " (bipartiteMatching_result graph1 _source _sink) ;

  (* Generer le graphe resultat *)
  bipartiteMatching_graph graph1 _source _sink outfile
;;

