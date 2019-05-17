#include "Variable.h"

#include <iostream>

void Parsed::ParseVar()
{
	for (auto& var : this->Classified)
	{
		if (var.Variable)
		{
			std::cout << "Variable exists" << std::endl;
		}
	}
}