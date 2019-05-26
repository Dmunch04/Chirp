#include "Parser.h"
#include "Variable.h"

#include <iostream>

//===CLASS DEFINITON

Variable::Variable()
{

}

Statement::Statement()
{

}

/*
Constructor function for the Parsed class, maybe we should move all the code from Parser::Parse()
to here?
*/
Parsed::Parsed()
{
	
}

/*
Actually parses the words in the Parsed class then start the whole thing.
*/
void Parsed::Classify()
{
	// Now, here you separate unclassified strings into keywords that will then be analyzed
	// and made into assembly.

	int Pos = -1;

	for (auto& txt : this->Unclassified)
	{
		Pos++;

		Statement s;

		if (txt.compare("int") == 0 || txt.compare("float") == 0 || txt.compare("char") == 0)
		{
			try
			{
				if (Unclassified.at(Pos + 1).compare(":") == 0)
				{
					// Not a function
					s.Variable = true;
					s.Args.push_back(Unclassified.at(Pos));
					try
					{
						if (Unclassified.at(Pos + 3).compare("=") == 0)
						{
							s.Args.push_back(Unclassified.at(Pos + 2));

							// Should check if there isn't any other stuff like additions and function return values
							s.Args.push_back(Unclassified.at(Pos + 4)); // <-- Start value(const)

							Classified.push_back(s);
						}
						else
						{
							s.Args.push_back(Unclassified.at(Pos + 2));

							Classified.push_back(s);
						}
					}
					catch (std::out_of_range)
					{
						Log::Error::Defined(6);
					}
				}
				else // Function stuff
				{
					//int func()
					// 1   2  34

					try
					{
						if (Unclassified.at(Pos + 2).compare("(") == 0)
						{
							// Error confirmation
							s.Function = true;
							s.Args.push_back(Unclassified.at(Pos)); // Data type 
							s.Args.push_back(Unclassified.at(Pos + 1)); // Name

							try
							{
								if (Unclassified.at(Pos - 1).compare("entry") == 0)
								{
									s.Entry = true;
								}
							}
							catch (...)
							{
								// not entry point
								s.Entry = false;
							}

							Classified.push_back(s);
						}
					}
					catch (std::out_of_range)
					{
						std::cout << "Alternative Error B" << std::endl;
					}
				}
			}
			catch (std::out_of_range)
			{
				std::cout << "Error A" << std::endl;
			}
		}
		if (txt.compare("(") == 0 || txt.compare(")") == 0 || txt.compare("{") == 0 || txt.compare("}") == 0) // Paren Expressions to list
		{
			s.Args.push_back(txt);
			this->Classified.push_back(s);
		}
		
		if (txt.compare("(") == 0) // Function call
		{
			try
			{
				if (this->Unclassified.at(Pos - 2).compare("int") != 0 && this->Unclassified.at(Pos - 2).compare("float") != 0 && this->Unclassified.at(Pos - 2).compare("char") != 0)
				{
					std::cout << "Is function call" << std::endl;
				}
			}
			catch (std::out_of_range)
			{
				std::cout << "Error unrecognized argument" << std::endl;
			}
		}
	}
	this->ParseVar();
	this->ParseFunc();
}

//===FUNCTION DEFINITIONS

/*
Creates an automatic "Parsed" class with separated words
@std::string txt - Text to parse
*/
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
		if(isspace(c) || c == '\n')
		{
			//p_b
			if (Word.compare("") != 0)
			{
				p.Unclassified.push_back(Word);
				Word.erase();
			}
		}
		else
		{
			if (c == '=' || c == '"' || c == ':' || c == '(' || c == ')' || c == '{' || c == '}')
			{
				if (Word.compare("") != 0) // hmm
				{
					p.Unclassified.push_back(Word);
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