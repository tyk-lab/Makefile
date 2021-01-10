#
# Makefile for misc library.
#
ROOT=..
PLATFORM=linux
include $(ROOT)/Make.define.$(PLATFORM)

LIBMISC	= libapue.a
OBJS   = t_error.o t_stdio.o 
		
	

all:	$(LIBMISC) 

$(LIBMISC):	$(OBJS)
	$(AR) rv $(LIBMISC) $?
	$(RANLIB) $(LIBMISC)


clean:
	rm -f *.o a.out core temp.* $(LIBMISC)

include $(ROOT)/Make.libapue.inc

