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
				std::cout << "" << std::endl;
				break;
			default:
				std::cout << Color(RED, "Error: ") << "Unspecified error has been detected" << std::endl;
				break;
			}
		}
		void Custom(std::string txt)
		{

		}
	}
}