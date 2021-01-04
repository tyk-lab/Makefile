
hello.exe : func.o main.o
	gcc -o hello.exe func.o main.o
	
func.o : func.c
	gcc -o func.o -c func.c
	
main.o : main.c
	gcc -o main.o -c main.c



all : FORCE hello.exe 
rebuild : FORCE clean all
clean : FORCE
	del *.o hello.exe
	
FORCE :

	