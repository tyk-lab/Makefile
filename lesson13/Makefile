

CC := gcc

app.out : main.o func.o

	 $(CC) -lstdc++ -o $@ $^


.c.o :
	@echo "my suffix1 rule"
	$(CC) -o $@ -c $^
	
.c :
	@echo "my suffix rule"
	$(CC) -o $@ -c $^
	