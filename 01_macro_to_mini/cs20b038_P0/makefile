.SILENT: run
run:
	bison -t A1.y
	flex -d A1.l
	gcc A1.tab.c -lfl -o A1
	./A1 <BinarySearch.java > debig.java
	
