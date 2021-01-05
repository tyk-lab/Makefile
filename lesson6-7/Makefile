
CC := gcc
TARGET := hello-makefile.exe
OBJS := func.o main.o const.o a.c
#OBJS := func.o main.o const.o 
RM := del

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^

$(OBJS) : %.o : %.c
	$(CC) -o $@ -c $^

.PHONY : rebuild clean all

rebuild : clean all


all : $(TARGET)

clean :
	$(RM) *.o $(TARGET)

	
