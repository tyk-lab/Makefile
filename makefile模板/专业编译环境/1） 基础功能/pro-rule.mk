
.PHONY : all compile link clean rebuild

# 产生 .../bulid 这个绝对路径
DIR_PROJECT := $(realpath .)
DIR_BUILD_SUB := $(addprefix $(DIR_BUILD)/, $(MODULES))

# 产生 build/common.a build/module.a build/main.a
MODULE_LIB := $(addsuffix .a, $(MODULES))
MODULE_LIB := $(addprefix $(DIR_BUILD)/, $(MODULE_LIB))

# 产生 build/app.out
APP := $(addprefix $(DIR_BUILD)/, $(APP))

all : compile $(APP)
	@echo "Success! Target ==> $(APP)"

# 遍历文件目录，并对子模块的makefile，在make执行前传入参数设置
# 若不加前缀导入参数，则在子模块的include，默认导入子模块的当前目录
compile : $(DIR_BUILD) $(DIR_BUILD_SUB)
	@echo "Begin to compile ..."
	@set -e; \
	for dir in $(MODULES); \
	do \
		cd $$dir && \
		$(MAKE) all \
		        DEBUG:=$(DEBUG) \
		        DIR_BUILD:=$(addprefix $(DIR_PROJECT)/, $(DIR_BUILD)) \
		        DIR_COMMON_INC:=$(addprefix $(DIR_PROJECT)/, $(DIR_COMMON_INC)) \
		        CMD_CFG:=$(addprefix $(DIR_PROJECT)/, $(CMD_CFG)) \
		        MOD_CFG:=$(addprefix $(DIR_PROJECT)/, $(MOD_CFG)) \
		        MOD_RULE:=$(addprefix $(DIR_PROJECT)/, $(MOD_RULE)) && \
		cd .. ; \
	done
	@echo "Compile Success!"

# 子模块执行完，将 .a文件更新，导致此规则执行
link $(APP) : $(MODULE_LIB)
	@echo "Begin to link ..."
	$(CC) -o $(APP) -Xlinker "-(" $^ -Xlinker "-)" $(LFLAGS)
	@echo "Link Success!"

# 创建相关目录	
$(DIR_BUILD) $(DIR_BUILD_SUB) : 
	$(MKDIR) $@
	
clean : 
	@echo "Begin to clean ..."
	$(RM) $(DIR_BUILD)
	@echo "Clean Success!"
	
rebuild : clean all
