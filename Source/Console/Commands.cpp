#include "Commands.h"

#include <iostream>

namespace Command
{
	void Run(std::vector<std::string> Args)
	{
		for (const auto &arg : Args)
		{
			std::cout<< arg <<std::endl;
		}
	}
}