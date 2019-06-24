#pragma once

#include "Parser/Parser.h"

namespace Variable
{
	void Register (int,Environement*); // Register the variable so it remembers
	std::string Operation (int, Environement*); // Return the asm to do an operation
	std::string Assign (int,Environement*);  // Assign a variable and return the asm
}
