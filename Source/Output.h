#pragma once

#include "Parser/Parser.h"

namespace Output
{
	void Generate (Environement*);
	void Write (Environement*); // Writes inside a file the ouput of env
	std::string Reg (std::string,Environement*);
}
