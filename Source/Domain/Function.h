#pragma once

#include "../Parser/Parser.h"

namespace Function
{
	void GenOpen (Environement*); // Generate the function opening
	void GenClose (Environement*); // Generate the function close
	void RegisterFunction (int, Environement*);
	std::string WriteFunction (int,Environement*);
	std::string CallFunction (int, Environement*);
}
