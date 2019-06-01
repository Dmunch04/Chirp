#include "Build.h"

#include <iostream>

namespace Tools
{
#ifdef __linux__
	void Build (std::string AsmFile, std::string Out)
	{
		std::cout << "Starting build scripts on Linux.." << std::endl;
		std::string Cmd ("nasm -f elf ");
		Cmd.append (AsmFile).append (" -o bin.o");
		std::string CmdB = "ld bin.o -o ";
		CmdB.append (Out);

		system (Cmd.c_str ()); 	// Assembly
		system (CmdB.c_str ()); // Linking
		system ("del bin.o"); 	// Clean up
	}
#endif

#ifdef _WIN32
	void Build (std::string AsmFile, std::string Out)
	{
		std::cout << "Starting build scripts on Windows.." << std::endl;
		std::string Cmd ("nasm -f win32 ");
		Cmd.append (AsmFile).append (" -o bin.o");
		std::string CmdB = "ld bin.o -o ";
		CmdB.append (Out);

		system (Cmd.c_str ()); 	// Assembly
		system (CmdB.c_str ()); // Linking
		system ("del bin.o"); 	// Clean up
	}
#endif
}
