src1 := a.cc.d b.cc.d c.cc.d
obj1 := $(src1:.cc.d=.dd.o)

test1 :
	@echo "obj1 => $(obj1)"
	
	
src2 := a11b.c a22b.c a33b.c
obj2 := $(src2:a%b.c=x%y)

test2 :
	@echo "obj2 => $(obj2)"