#include "Chirp.h"

#include <vector>

int main(int argc, char *argv[])
{
	std::vector<std::string> a; // This is so bad

	for (int i = 1; i <argc; i++) // i = 1, so program name isn't included
	{
		std::string txt(argv[i]);
		a.push_back(txt);
	}
	
	Command::Run(a);

	return 0;
}