
CC := gcc
TARGET := hello.exe

$(TARGET) : func.o main.o
	$(CC) -o $@ $^
	
func.o : func.c
	$(CC) -o $@ -c $^
	
main.o : main.c
	$(CC) -o $@ -c $^


.PHONY : rebuild clean all

all : $(TARGET) 
rebuild : clean all
clean : 
	del *.o $(TARGET) 
	


	