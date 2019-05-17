#include "Commands.h"
#include "../Parser/Parser.h"
#include "../Parser/Assembly.h"

#include <iostream>
#include <fstream>

std::string Read(std::string file)
{
	char c;
	std::string data;
	std::ifstream read(file);

	if (!read)
	{
		// Error while reading file
	}
	else
	{
		for (int i = 0; ! read.eof(); i++)
		{
			read.get(c);
			data.append(1, c);
		}
		return data;
	}
}

namespace Command
{
	void Run(std::vector<std::string> Args)
	{
		// Once the -i flag is declared, this is on.Until there is another flag
		bool IncludeFlag = false;
		bool OutputFlag = false;

		// Temporary
		bool In = false;
		bool Out = false;
		std::string InputFile;
		std::string OutputFile;

		// Start
		for (const auto& arg : Args)
		{
			if (arg.compare("-i") == 0)
			{
				IncludeFlag = true;
				OutputFlag = false;
			}
			else if (arg.compare("-o") == 0)
			{
				IncludeFlag = false;
				OutputFlag = true;
			}
			else
			{
				if (IncludeFlag == true)
				{
					// Wait maybe you should have only one input, so the input is the main file
					// and include other stuff from there, but the code here is easy to make it run
					// multiple files.

					if (In == false)
					{
						InputFile = arg;
						In = true;
					}
					else
					{
						// Temporary, should make&use Logger's error
						std::cout << "Error, cannot currently include more than one file" << std::endl;
					}
				}
				else if (OutputFlag == true)
				{
					// You shouldn't be able to have more than one input, i think.
					if (Out == false)
					{
						OutputFile = arg;
						Out = true;
					}
					else
					{
						std::cout << "Error, cannot output to more than one file" << std::endl;
					}
				}
			}
		}
		//End
		
		bool Error = false;

		if (InputFile.empty())
		{
			std::cout << "Error, No input files are specified" << std::endl;
			Error = true;
		}
		else
		{
			std::cout << "Input file is " << InputFile << std::endl;
		}
		if (OutputFile.empty())
		{
			std::cout << "Error, No output file are specified" << std::endl;
			Error = true;
		}
		else
		{
			std::cout << "Output file is " << OutputFile << std::endl;
		}

		if (Error == false) // Lets compile now 
		{
			// Ok we can finally get started on doing real stuff
			std::string FileData = Read(InputFile);
			Parsed P = Parser::Parse(FileData);
			P.Classify();
			Assembly::Init(&P);
			Assembly::Write(&P,InputFile.append(".asm"));
		}
	}
}