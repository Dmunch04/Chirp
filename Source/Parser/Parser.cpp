#include "Parser.h"

//===CLASS DEFINITON
Keyword::Keyword()
{

}
Parsed::Parsed()
{
	
}
//===FUNCTION DEFINITIONS
Parsed Parser::Parse(std::string txt)
{
	// Ok so basically in here let's seperate words.
	// and make them in seperate keywords, but let's not touch any assembly code
	// because the nicely parsed objects will be forwared to the assembly portion
	// of the compiler.
	Parsed p;
	
	for (char &c : txt)
	{
		std::string Word;
		int Pos;

		if(isspace(c))
		{
			//p_b
			Word.erase();
		}
		else
		{
			if (c == '=' || c == '"')
			{
				if (Word.compare("") != 0) // hmm
				{
					Word.clear();
				}
				Word.append(1,c);
				// Maybe push back something here ?
				Word.clear();
			}
			else
			{
				Word.append(1,c);
			}

			if (Pos >= txt.length)
			{
				// Ending
				Word.erase();
			}
		}
	}

	return p;
}