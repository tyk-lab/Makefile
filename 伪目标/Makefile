
hello.exe : func.o main.o
	gcc -o hello.exe func.o main.o
	
func.o : func.c
	gcc -o func.o -c func.c
	
main.o : main.c
	gcc -o main.o -c main.c


.PHONY : rebuild clean all
all : hello.exe
rebuild : clean all
clean :
	del *.o hello.exe


	