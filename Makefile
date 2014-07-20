all : main

main : main.o test.o test_external.o
	gcc -o $@ $+

%.s : %.ll
	llc $<

%.o : %.s
	gcc -c $<

%.o : %.c
	gcc -c $<

clean :
	rm -f *.s *.o
