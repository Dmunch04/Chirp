# I have no idea how to write makefiles
# - Maxence "Binkiklou" Cossette

.ONESHELL:
all: compile build done

compile:
	@echo "Starting build processs.."
	g++ -I ../../Source/ -I ../../Source/Console -I ../../Source/Logger -I ../../Source/Parser ../../Source/*.cpp ../../Source/Console/*.cpp ../../Source/Logger/*.cpp ../../Source/Parser/*.cpp -std=c++11 -o Chirp.o

build:
	@echo "Creating ressource files.."
	@cd ../../Ressources/Binaries/
#	@cp ld ../../Tools/Build/ld.o
	@cp nasm   ../../Tools/Build/nasm.o

done:
	@echo "Build process is done! Output is in this folder - Chirp.o"
