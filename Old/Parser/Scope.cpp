#include "Scope.h"

#include <iostream>

void Scope::Set (int Pos, std::vector<Statement>* Char)
{
	int ArgL = 0; // Tracks where the current parenthesis is, in relation to other ones
	int ScopeL  = 0; // Tracks where the current brackets is, in relation to other ones

	bool ArgOpen = false;
	bool ArgClose = false;
	bool ScopeOpen = false;
	bool ScopeClose = false;

	for (Pos; Pos < Char -> size (); Pos++)
	{
		try
		{
			// Argument detection
			if (Char -> at (Pos).Args.at (0).compare ("(") == 0 && !ArgClose)
			{
				ArgL++;
				ArgOpen = true;
				this -> ArgStart = Pos;
			}

			else if (Char -> at (Pos).Args.at (0).compare (")") == 0 && !ArgClose)
			{
				ArgL--;

				if (ArgL == 0 && ArgOpen)
				{
					ArgClose = true;
					this -> ArgStop = Pos;
				}

			}

			// Scope detection
			if (Char -> at (Pos).Args.at (0).compare ("{") == 0 && !ScopeClose && !ScopeOpen)
			{
				ScopeL++;
				ScopeOpen = true;
				this -> ScopeStart = Pos;
			}

			else if (Char -> at (Pos).Args.at (0).compare ("}") == 0 && !ScopeClose)
			{
				ScopeL--;

				if (ScopeL == 0 && ScopeOpen)
				{
					ScopeClose = true;
					this -> ScopeStop = Pos;
				}
			}
		}

		catch (...)
		{
			// Scope parsing error
		}
	}
}
