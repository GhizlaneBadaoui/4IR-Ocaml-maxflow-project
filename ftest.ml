open Gfile
open Tools
    
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

  (*let graph = clone_nodes graph0 in*)
  (*let graph = gmap graph0 (fun a -> string_of_int(int_of_string(a)+2)) in*)
  (*let graph = gmap (add_arc (gmap graph0 (fun a -> int_of_string(a))) 2 5 10) (fun a -> string_of_int(a)) in*)
  let graph = gap_graph (gmap graph0 (fun a -> int_of_string(a))) in

  (* Rewrite the graph that has been read. *)
  (*let () = write_file outfile graph in*)
  let () = export outfile graph in

  ()

