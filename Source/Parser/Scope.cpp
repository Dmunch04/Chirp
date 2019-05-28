#include "Scope.h"

#include <iostream>

void Scope::Set(int pos,std::vector<Statement>* c)
{
	int argl = 0; // Tracks where the current parenthesis is, in relation to other ones
	int scopel  = 0; // Tracks where the current brackets is, in relation to other ones

	bool ArgOpen = false;
	bool ArgClose = false;
	bool ScopeOpen = false;
	bool ScopeClose = false;

	for (pos; pos < c->size(); pos++)
	{
		try
		{
			// Argument detection
			if (c->at(pos).Args.at(0).compare("(") == 0 && !ArgClose)
			{
				argl++;
				ArgOpen = true;
				this->ArgStart = pos;
			}
			else if (c->at(pos).Args.at(0).compare(")") == 0 && !ArgClose)
			{
				argl--;

				if (argl == 0 && ArgOpen)
				{
					ArgClose = true;
					this->ArgStop = pos;

				}

			}
			// Scope detection
			if (c->at(pos).Args.at(0).compare("{") == 0 && !ScopeClose && !ScopeOpen)
			{
				scopel++;
				ScopeOpen = true;
				this->ScopeStart = pos;
			}
			else if (c->at(pos).Args.at(0).compare("}") == 0 && !ScopeClose)
			{
				scopel--;

				if (scopel == 0 && ScopeOpen)
				{
					ScopeClose = true;
					this->ScopeStop = pos;
				}
			}
		}
		catch (...)
		{
			// Scope parsing error
		}
	}
}