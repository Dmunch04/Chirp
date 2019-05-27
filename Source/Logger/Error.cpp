#include "Error.h"
#include "Color.h"

#include <iostream>

namespace Log
{
	namespace Error
	{
		void Defined(int err)
		{
			switch(err)
			{
			case 1:
				std::cout << Log::Color(RED,"Error 001:") << "Unspecified input file" << std::endl;
				break;
			case 2:
				std::cout << Log::Color(RED, "Error 002:")  << "Unspecified output file" << std::endl;
				break;
			case 3:
				std::cout << Log::Color(RED, "Error 003:")  << "Too much Input files" << std::endl;
				break;
			case 4:
				std::cout << Log::Color(RED, "Error 004:") << "More than one Output file" << std::endl;
				break;
			case 5:
				std::cout << Log::Color(RED, "Error 005:") << "Main input file unspeficied" << std::endl;
				break;
			case 6:
				std::cout << Log::Color(RED, "Error 006:") << "Variable has declaration token but no value" << std::endl;
				break;
			case 7:
				std::cout << Log::Color(RED, "Error 007:") << "Function has declaration but no definition" << std::endl;
				break;
			case 8:
				std::cout << Log::Color(RED, "Error 008:") << "Function has unrecognized argument start position" << std::endl;
				break;
			case 9:
				std::cout << Log::Color(RED, "Error 009:") << "Statement's variable is unrecognized" << std::endl;
				break;
			default:
				std::cout << Color(RED, "Error ???: ") << "Unspecified error has been detected" << std::endl;
				break;
			}
		}
		void Custom(std::string txt)
		{

		}
	}
}