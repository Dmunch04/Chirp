# I have no idea how to write makefiles, so I used a lot of code from Github user Wenchy's makefile on github gist
# - Maxence "Binkiklou" Cossette

all: compile build done

compile:
	@echo "Starting build processs"
	g++ -I ../../Source/ -I ../../Source/Console -I ../../Source/Logger -I ../../Source/Parser ../../Source/*.cpp ../../Source/Console/*.cpp ../../Source/Logger/*.cpp ../../Source/Parser/*.cpp -std=c++11 -o Chirp.o

build:
	@echo "Desktop file creation isn't completed yet"	

done:
	@echo "Build process is done, and output is probably in the Chirp/Build.o"