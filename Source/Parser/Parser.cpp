#include "Parser.h"

//===CLASS DEFINITON
Keyword::Keyword()
{

}
Parsed::Parsed()
{
	
}
void Parsed::Classify()
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
	
	std::string Word;
	int Pos = 0;

	for (char &c : txt) // The eagle eyed among, may have noticed this look like something from Powerscript
	{
		Pos++;
		if(isspace(c))
		{
			//p_b
			p.Unclassified.push_back(Word);
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

				p.Unclassified.push_back(Word);
				Word.clear();
			}
			else
			{
				Word.append(1,c);
			}

			if (Pos >= txt.length())
			{
				// Ending
				p.Unclassified.push_back(Word);
				Word.erase();
				return p;
			}
		}
	}

	return p;
}