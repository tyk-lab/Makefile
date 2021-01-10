
.PHONY : all

# 产生 build/common build/module build/main 之一，由pro-rule.mk，cd进入
MODULE := $(realpath .)
MODULE := $(notdir $(MODULE))
DIR_OUTPUT := $(addprefix $(DIR_BUILD)/, $(MODULE))

# 产生 build/common.a build/module.a build/main.a 之一
OUTPUT := $(MODULE).a
OUTPUT := $(addprefix $(DIR_BUILD)/, $(OUTPUT))

# src/*.c
SRCS := $(wildcard $(DIR_SRC)/*$(TYPE_SRC))

# src/*.c -> build/common/*.o
OBJS := $(SRCS:$(TYPE_SRC)=$(TYPE_OBJ))
OBJS := $(patsubst $(DIR_SRC)/%, $(DIR_OUTPUT)/%, $(OBJS))

# src/*.dep -> build/common/*.dep
DEPS := $(SRCS:$(TYPE_SRC)=$(TYPE_DEP))
DEPS := $(patsubst $(DIR_SRC)/%, $(DIR_OUTPUT)/%, $(DEPS))

# 搜索路径， inc src common/inc
vpath %$(TYPE_INC) $(DIR_INC)
vpath %$(TYPE_INC) $(DIR_COMMON_INC)
vpath %$(TYPE_SRC) $(DIR_SRC)

-include $(DEPS)

all : $(OUTPUT)
	@echo "Success! Target ==> $(OUTPUT)"

# 链接为库文件（.a）
$(OUTPUT) : $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

# 产生 build/common/*.o 目标文件，根据 .c和.dep文件
$(DIR_OUTPUT)/%$(TYPE_OBJ) : %$(TYPE_SRC)
	$(CC) $(CFLAGS) -o $@ -c $(filter %$(TYPE_SRC), $^)
	
# 自动生成依赖变量 	build/common/*.dep (由include规则产生)
$(DIR_OUTPUT)/%$(TYPE_DEP) : %$(TYPE_SRC)
	@echo "Creating $@ ..."
	@set -e; \
	$(CC) $(CFLAGS) -MM -E $(filter %$(TYPE_SRC), $^) | sed 's,\(.*\)\.o[ :]*,$(DIR_OUTPUT)/\1$(TYPE_OBJ) $@ : ,g' > $@
