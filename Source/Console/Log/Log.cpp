#include "Log.h"
#include "Color.h"

#include <iostream>

namespace Log
{
	void Warning(std::string txt)
	{
		std::cout << Log::Color(YELLOW, "Warning: ") << txt << std::endl;
	}
}