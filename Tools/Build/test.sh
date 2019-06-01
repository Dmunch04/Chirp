# I made this file so travis works.
g++ -I ../../Source/ -I ../../Source/Console -I ../../Source/Logger -I ../../Source/Parser ../../Source/*.cpp ../../Source/Console/*.cpp ../../Source/Logger/*.cpp ../../Source/Parser/*.cpp -std=c++11 -o Chirp.o
