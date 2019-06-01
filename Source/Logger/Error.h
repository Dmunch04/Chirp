#pragma once

#include <string>

namespace Log
{
	namespace Error
	{
		void Defined(int);
		void Custom(std::string);
		void At(int,std::string); // Creates an error message with specific position
	}
}