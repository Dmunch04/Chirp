#pragma once

#include "Parser.h"

namespace Assembly
{
	void Init(Parsed*);
	std::string Make(Parsed*,int,int); // Uhm so basically it's like MakeAssembly but like for only inside functions
	void Write(Parsed*,std::string);
}