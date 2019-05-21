#include "Color.h"

namespace Log
{
#ifdef linux
	std::string Color(int c,std::string txt)
	{
		switch (c)
		{
		case BLACK:
			return "\x1B[30m" + txt + "\x1B[0m";
			break;
		case RED:
			return "\x1B[31m" + txt + "\x1B[0m";
			break;
		case GREEN:
			return "\x1B[32m" + txt + "\x1B[0m";
			break;
		case BLUE:
			return "\x1B[36m" + txt + "\x1B[0m"; // it's cyan lmao
			break;
		case WHITE:
			return "\x1B[37m" + txt + "\x1B[0m";
			break;
		default:
			return "\x1B[37m" + txt + "\x1B[0m";
			break;
		}
	}
#endif
#ifdef _WIN32
	std::string Color(int c,std::string txt)
	{

	}
#endif
}