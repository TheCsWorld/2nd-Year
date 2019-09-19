OBJS = swtch.o proc.o main.o\

sim : $(OBJS)
	cc -g -o sim $(OBJS)

%.o: %.c %.h
	cc -g -c -o $@ $< 

clean :
	rm sim $(OBJS)


