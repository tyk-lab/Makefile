
CC := gcc
TARGET := hello.exe

$(TARGET) : func.o main.o
	$(CC) -o $(TARGET) func.o main.o
	
func.o : func.c
	$(CC) -o func.o -c func.c
	
main.o : main.c
	$(CC) -o main.o -c main.c

.PHONY : rebuild clean all

all : $(TARGET)
rebuild : clean all
clean : 
	del *.o $(TARGET)
	
FORCE :

	