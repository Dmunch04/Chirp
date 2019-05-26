#include "Build.h"

#include <iostream>

namespace Tools
{
#ifdef __linux__
	void Build(std::string asmfile, std::string out)
	{
		std::cout << "Starting build scripts on windows" << std::endl;
		std::string cmd("nasm -f win32 ");
		cmd.append(asmfile).append(" -o bin.o");
		std::string cmdB = "ld bin.o -o ";
		cmdB.append(out);

		system(cmd.c_str()); // Assembly
		system(cmdB.c_str()); // Linking
		system("del bin.o"); // Clean up
	}
#endif 

#ifdef _WIN32
	void Build(std::string asmfile,std::string out)
	{
		std::cout << "Starting build scripts on windows" << std::endl;
		std::string cmd("nasm -f win32 ");
		cmd.append(asmfile).append(" -o bin.o");
		std::string cmdB = "ld bin.o -o ";
		cmdB.append(out);

		system(cmd.c_str()); // Assembly
		system(cmdB.c_str()); // Linking
		system("del bin.o"); // Clean up
	}
#endif
}