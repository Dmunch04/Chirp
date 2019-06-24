#include "Color.h"

#ifdef _WIN32
#include <Windows.h>
#include <iostream>
#endif

namespace Log
{
#ifdef __linux__
	std::string Color (int Color, std::string Text)
	{
		switch (Color)
		{
		case BLACK:
			return "\x1B[30m" + Text + "\x1B[0m";
			break;

		case RED:
			return "\x1B[31m" + Text + "\x1B[0m";
			break;

		case GREEN:
			return "\x1B[32m" + Text + "\x1B[0m";
			break;

		case BLUE:
			return "\x1B[36m" + Text + "\x1B[0m"; // it's cyan lmao
			break;

		case WHITE:
			return "\x1B[37m" + Text + "\x1B[0m";
			break;

		default:
			return "\x1B[37m" + Text + "\x1B[0m";
			break;
		}
	}
#endif

#ifdef _WIN32
	std::string Color (int Color, std::string Text)
	{
		HANDLE hC = GetStdHandle (STD_OUTPUT_HANDLE);

		switch (Color)
		{
		case BLACK:
		//	SetConsoleTextAttribute(hC,FORGEGROUND_BLACK);
			std::cout << Text;
			break;

		case RED:
			std::cout << Text;
			break;

		case GREEN:
			std::cout << Text;
			break;

		case BLUE:
			std::cout << Text;
			break;

		case WHITE:
			std::cout << Text;
			break;

		default:
			std::cout << Text;
			break;
		}
		
		return " "; // ok so fuck, I am not supposed to return anything with the windows method
	}
#endif
}
