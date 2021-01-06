
CC := gcc
MKDIR := mkdir
RM := rmdir

DIRS := $(DIR_TARGET) $(DIR_OBJS)
DIR_OBJS := obj
DIR_TARGET := target


TARGET := $(DIR_TARGET)/hello.exe
SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)
OBJS := $(addprefix $(DIR_OBJS)/, $(OBJS))


$(TARGET) : $(DIR) $(OBJS)
	$(CC) -o $@ $(OBJS)

$(DIR) : 
	$(MKDIR) $@

#error
$(OBJS) : $(SRC)
    ifeq ($(DEBUG),true)
		$(CC) -o $@ -g -c $^ 
    else   
		$(CC) -o $@ -c $^
    endif


.PHONY : rebuild clean all

rebuild : clean all

all : $(TARGET)

clean :
	$(RM) $(DIRS)

