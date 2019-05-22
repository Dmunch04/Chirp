#include "Color.h"

#ifdef _WIN32
#include <Windows.h>
#include <iostream>
#endif

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
		HANDLE hC = GetStdHandle(STD_OUTPUT_HANDLE);
		switch (c)
		{
		case BLACK:
		//	SetConsoleTextAttribute(hC,FORGEGROUND_BLACK);
			std::cout << txt;
			break;
		case RED:
			std::cout << txt;
			break;
		case GREEN:
			std::cout << txt;
			break;
		case BLUE:
			std::cout << txt;
			break;
		case WHITE:
			std::cout << txt;
			break;
		default:
			std::cout << txt;
			break;
		}
		return " "; // ok so fuck, I am not supposed to return anything with the windows method
	}
#endif
}