
.PHONY : all clean

MKDIR := mkdir
RM := del
CC := gcc

SRCS := $(wildcard *.c)
DEPS := $(SRCS:.c=.dep)

-include $(DEPS)

all :
	@echo "all"
	
%.dep : %.c
	@echo "Creating $@ ..."
	$(CC) -MM -E $^ | sed 's,\(.*\)\.o[ :]*,objs/\1.o : ,g' > $@
	
clean :
	$(RM) $(DEPS)
	