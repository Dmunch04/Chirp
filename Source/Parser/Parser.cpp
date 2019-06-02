#include "Parser.h"
#include "Variable.h"

#include <iostream>

//===CLASS DEFINITON

Variable::Variable ()
{

}

Scope::Scope ()
{

}

Statement::Statement ()
{

}

/*
Constructor function for the Parsed class, maybe we should move all the code from Parser::Parse()
to here?
*/
Parsed::Parsed ()
{

}

/*
Actually parses the words in the Parsed class then start the whole thing.
*/
void Parsed::Classify ()
{
	// Now, here you separate unclassified strings into keywords that will then be analyzed
	// and made into assembly.

	int Pos = -1;

	for (auto& Text : this -> Unclassified)
	{
		Pos++;

		Statement Statement;

		if (Text.compare ("int") == 0 || Text.compare ("float") == 0 || Text.compare ("char") == 0)
		{
			try
			{
				if (Unclassified.at (Pos + 1).compare (":") == 0)
				{
					// Not a function
					Statement.Variable = true;

					try
					{
						if (Unclassified.at (Pos - 1).compare ("const") == 0)
						{
							Statement.Args.push_back (Unclassified.at (Pos - 1));
						}
					}

					catch (std::out_of_range)
					{
						// Not a const
					}

					Statement.Args.push_back (Unclassified.at (Pos));

					try
					{
						if (Unclassified.at (Pos + 3).compare ("=") == 0)
						{
							Statement.Args.push_back (Unclassified.at (Pos + 2));

							// Should check if there isn't any other stuff like additions and function return values
							Statement.Args.push_back (Unclassified.at (Pos + 4)); // <-- Start value(const)

							Classified.push_back (Statement);
						}

						else
						{
							Statement.Args.push_back (Unclassified.at (Pos + 2));

							Classified.push_back (Statement);
						}
					}

					catch (std::out_of_range)
					{
						Log::Error::Defined (6);
					}
				}

				else // Function stuff
				{
					//int func()
					// 1   2  34

					try
					{
						if (Unclassified.at (Pos + 2).compare ("(") == 0)
						{
							// Error confirmation
							Statement.Function = true;

							try
							{
								if (Unclassified.at (Pos - 1).compare ("entry") == 0)
								{
									Statement.Args.push_back (Unclassified.at (Pos - 1));
								}
							}

							catch (...)
							{
								// not entry point
								Log::Error::Custom("Unexpected end of line after entry keyword");
							}

							Statement.Args.push_back (Unclassified.at (Pos)); // Data type or cast ??
							Statement.Args.push_back (Unclassified.at (Pos + 1)); // Name

							Classified.push_back (Statement);
						}
					}

					catch (std::out_of_range)
					{
						Log::Error::Custom("Unexpected start of line at function parsing");
					}
				}
			}

			catch (std::out_of_range)
			{
				Log::Error::Custom("Unexpected vector out-of-range at parsing statement with data type");
			}
		}

		if (Text.compare ("(") == 0) // Function call
		{
			try
			{
				if (this -> Unclassified.at (Pos - 2).compare ("int") != 0 && this -> Unclassified.at (Pos - 2).compare ("float") != 0 && this -> Unclassified.at (Pos - 2).compare ("char") != 0)
				{
					// Function call
					Statement.Type = 4;
					Statement.Args.push_back (Unclassified.at (Pos - 1));
					this -> Classified.push_back (Statement);
				//	break;
				}

				else // Ok so this is a mildly bad fix
				{
					Statement.Args.push_back (Text);
					this -> Classified.push_back (Statement);
				}
			}

			catch (std::out_of_range)
			{
				Log::Error::Custom("Undefined error");
			}
		}

		if (Text.compare (")") == 0 || Text.compare ("{") == 0 || Text.compare ("}") == 0) // Paren Expressions to list
		{
			Statement.Args.push_back (Text);
			this -> Classified.push_back(Statement);
		}
	}

	this -> ParseVar ();
	this -> ParseFunc ();
}

//===FUNCTION DEFINITIONS

/*
Creates an automatic "Parsed" class with separated words
@std::string txt - Text to parse
*/
Parsed Parser::Parse (std::string Text)
{
	// Ok so basically in here let's seperate words.
	// and make them in seperate keywords, but let's not touch any assembly code
	// because the nicely parsed objects will be forwared to the assembly portion
	// of the compiler.
	Parsed Parsed;

	std::string Word;
	int Pos = 0;

	for (char &Char : Text) // The eagle eyed among, may have noticed this look like something from Powerscript
	{
		Pos++;

		if (isspace (Char) || Char == '\n')
		{
			//p_b
			if (Word.compare ("") != 0)
			{
				Parsed.Unclassified.push_back (Word);
				Word.erase ();
			}
		}

		else
		{
			if (Char == '=' || Char == '"' || Char == ':' || Char == '(' || Char == ')' || Char == '{' || Char == '}')
			{
				if (Word.compare ("") != 0) // hmm
				{
					Parsed.Unclassified.push_back (Word);
					Word.clear ();
				}

				Word.append (1, Char);
				Parsed.Unclassified.push_back (Word);
				Word.clear ();
			}

			else
			{
				Word.append (1, Char);
			}

			if (Pos >= Text.length ())
			{
				// Ending
				Parsed.Unclassified.push_back (Word);
				Word.erase ();

				return Parsed;
			}
		}
	}

	return Parsed;
}
