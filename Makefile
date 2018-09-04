GHC := ghc
HSFLAGS := -o

all:

	$(GHC) $(HSFLAGS) prog main.hs  

clean:

	rm prog main.hi main.o

run:

	./prog