#include "Chirp.h"

#include <vector>

int main (int ArgC, char *ArgV[])
{
		std::vector<std::string> A; // This is so bad

    for (int I = 1; I < ArgC; I++) // i = 1, so program name isn't included
    {
        std::string Text (ArgV[I]);
        A.push_back (Text);
    }

    Command::Run (A);

	return 0;
}
