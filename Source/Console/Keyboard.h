#pragma once

#ifdef _WIN32
#include <conio.h>
#endif

#ifdef __linux__
#include <unistd.h>
#include <termios.h>
#include <iostream>
#endif

namespace Key
{
	char Get();
}