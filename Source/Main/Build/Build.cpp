#include "Build.h"

#include <iostream>

namespace Tools
{
// I just realised that it's pretty stupid
#ifdef __linux__
	void Build (std::string AsmFile, std::string Out, int v)
	{
		std::cout << "Starting build scripts on Linux.." << std::endl;

		std::string Cmd;
		std::string CmdB;

		if(v == 32)
		{
			Cmd = "nasm -f elf ";
			CmdB = "ld -m elf_i386 bin.o -o ";
		}
		if(v == 64)
		{
			Cmd = "nasm -f elf64 "; 
			CmdB = "ld bin.o -o ";
		}
		
	//	std::string Cmd ("nasm -f elf32 ");
		Cmd.append (AsmFile).append (" -o bin.o");
		CmdB.append (Out);

		system (Cmd.c_str ()); 	// Assembly
		system (CmdB.c_str ()); // Linking
		system ("rm bin.o"); 	// Clean up
	}
#endif

#ifdef _WIN32
	void Build (std::string AsmFile, std::string Out,int v)
	{
		std::cout << "Starting build scripts on Windows.." << std::endl;
		std::string Cmd;

		if (v == 64)
		{
			Cmd = "nasm -f win64 ";
		}
		else
		{
			Cmd = "nasm -f win32 ";
		}

		Cmd.append (AsmFile).append (" -o bin.o");
		std::string CmdB = "ld bin.o -o ";
		CmdB.append (Out);

		system (Cmd.c_str ()); 	// Assembly
		system (CmdB.c_str ()); // Linking
		system ("del bin.o"); 	// Clean up
	//	system(std::string("del ").append(AsmFile).c_str());
	}
#endif
}
