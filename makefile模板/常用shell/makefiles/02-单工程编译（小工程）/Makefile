#CC     := gcc 
CC     := g++  #编译c++
CFLAGS  := -Wall -O -g
#CFLAGS  += -lstad++ 
INCLUDEFLAGS := -Iinc 
LDFLAGS :=  
TARGETS := test_seq 

#生成的可执行文件路径,not use
BINDIR:= ./bin
#生成的目标文件路径
DIR	:= ./debug

SRC := ./src
INC := ./inc

vpath %.c $(SRC)
vpath %.cpp $(SRC)
vpath %.h $(INC)

ifeq ($(CC),gcc) 
OS := $(patsubst %.c,%.o,$(wildcard $(addprefix $(SRC)/,*.c)))
MAKE_FILE := $(wildcard $(addprefix $(SRC)/,*.c))
else
OS := $(patsubst %.cpp,%.o,$(wildcard $(addprefix $(SRC)/,*.cpp)))
MAKE_FILE := $(wildcard $(addprefix $(SRC)/,*.cpp))
endif

DEOBJS := $(addprefix $(DIR)/,$(notdir $(OS)))

.PHONY:all 
all : $(TARGETS)
#all : $(BINDIR)/$(TARGETS)

#产生最终目标
$(TARGETS): MKDIR $(DEOBJS)
	$(CC) -o $@ $(DEOBJS) $(LDFLAGS)
	

.PHONY:MKDIR 
MKDIR:
	@-mkdir -p  $(DIR) $(BINDIR) 

#产生依赖文件
$(DIR)/%.o: $(MAKE_FILE)
	 $(CC) -o $@ -c $< $(CFLAGS) $(INCLUDEFLAGS) -MD -MF $@.d

$(DIR)/%.o.d: $(MAKE_FILE) 
	 @set -e; rm -f $@; $(CC) -MM $< $(INCLUDEFLAGS) > $@.$$$$; \
    sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
    rm -f $@.$$$$; \
	echo "aaa"


-include $(DEOBJS:.o=.o.d)

.PHONY: debug
debug:
	@echo $(OS)
	@echo $(MAKE_FILE)
	@echo $(DEOBJS)

#产生各种中间文件
.PHONY:clean 
clean:
	-rm -f $(TARGETS) $(addprefix $(DIR)/,*.o *.d *.o.d)

