#include "Function.h"

#include <iostream>

void Parsed::ParseFunc ()
{
	int PArg = 0; // parenthesis argument lister
	int SArg = 0; // scope argument lister

	bool ArgOpened = false;
	bool ArgClosed = false;
	bool ScopeOpened = false;
	bool ScopeClosed = false;

	int Pos = 0; // may have to do it -1

	for (auto& Statement : this -> Classified)
	{
		Pos++;

		if (Statement.Function)
		{
			Function Function;

			try
			{
				if (Statement.Args.at (0).compare ("entry") == 0)
				{
					Function.Name = Statement.Args.at (2);
					Function.Entry = true;
				}

				else
				{
					Function.Name = Statement.Args.at (1);
					Function.Entry = false;
				}

				Function.ThisScope.Set (Pos, &this -> Classified);

				if (Function.Entry == true)
				{
					try
					{
						this -> EntryPos = this -> FunctionList.size ();
					}

					catch (...)
					{
					}
				}

				this -> FunctionList.push_back (Function);
				Statement.Identifier = this -> FunctionList.size () - 1;
			}

			catch (...)
			{
				// error should be written
			}
		}
	}
}

std::string Parsed::CallFunc (Statement* Statement)
{
	std::string Data = "call "; // d stands for "data"

	try
	{
		Data.append (Statement -> Args.at (0)).append (" \n");
	}

	catch (...)
	{
		return "; error at function call \n";
	}

//	std::cout << "eh" << std::endl;

	return Data;
}
