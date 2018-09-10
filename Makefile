GHC := ghc
HSFLAGS := -o

all:

	$(GHC) $(HSFLAGS) prog main.hs
	
run:

	./prog

install:
	cabal install split && cabal install ansi-terminal

clean:

	rm prog *.hi *.o

