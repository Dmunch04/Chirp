#include "Logger.h"
#include "Color.h"

#include <iostream>

namespace Log
{
	void Debug(std::string txt)
	{
		std::cout << Color(GREEN, "Debug: ")<< txt <<std::endl;;
	}
}