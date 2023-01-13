all:
	@echo "\n ************************ COMPILING ************************ \n"
	ocamlbuild ftest.byte
	ocamlbuild biproblem.byte

ford:
	@echo "\n *********** EXECUTING : Ford-Fulkerson algorithm *********** \n"

	@echo "\n --------- Graph 01 : from 0 to 5 --------- \n"
	./ftest.byte txtFiles/graph1.txt 0 5 dotFiles/grResult1.dot
	dot -Tsvg dotFiles/grResult1.dot > graphs/graph1.svg

	@echo "\n --------- Graph 02 : from 0 to 5 --------- \n"
	./ftest.byte txtFiles/graph2.txt 0 5 dotFiles/grResult2.dot
	dot -Tsvg dotFiles/grResult2.dot > graphs/graph2.svg
	
bipartite:
	@echo "\n ************** EXECUTING : Bipartite matching ************** \n"
	
	@echo "\n -------------------- Bipartite matching 01 : -------------------- \n"
	./biproblem.byte txtFiles/bipartite1.txt 0 9 dotFiles/bipartite1.dot
	dot -Tsvg dotFiles/bipartite1.dot > graphs/bipartite1.svg

	@echo "\n -------------------- Bipartite matching 02 : -------------------- \n"
	./biproblem.byte txtFiles/bipartite2.txt 0 7 dotFiles/bipartite2.dot
	dot -Tsvg dotFiles/bipartite2.dot > graphs/bipartite2.svg

	@echo "\n -------------------- Bipartite matching 03 : -------------------- \n"
	./biproblem.byte txtFiles/bipartite3.txt 0 8 dotFiles/bipartite3.dot
	dot -Tsvg dotFiles/bipartite3.dot > graphs/bipartite3.svg

mrproper:
	-rm -rf _build/
	-rm ftest.byte
	-rm biproblem.byte