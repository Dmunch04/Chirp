# I have no idea how to write makefiles
# - Maxence "Binkiklou" Cossette

.ONESHELL:
all: compile build done

compile:
	@echo "Starting build processs"
	sh build.sh

build:
	@echo "Creating ressource files"
	@cd ../../Ressources/Binaries/
#	@cp ld ../../Tools/Build/ld.o
	@cp nasm   ../../Tools/Build/nasm.o

done:
	@echo "Build process is done, and output is probably in the Chirp/Build.o"
