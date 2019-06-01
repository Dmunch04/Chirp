#include "Assembly.h"

#include "Variable.h"

#include <fstream>
#include <iostream>

// Starts the assembly writing process after writing in assembly
void Parsed::MakeAssembly ()
{
	for (auto &Statement : this -> Classified) // Ok so get this shit ID
	{
		if (Statement.Variable)
		{
			Variable Var;

			try
			{
				Var = this -> VariableList.at (Statement.Identifier);
			}

			catch (std::out_of_range)
			{
				Log::Error::Defined (9);
				break;
			}

			if (Var.Defined)
			{
				if (Var.Constant)
				{
					this -> Data.append (Var.Define ());
				}
			}

			else
			{
				this -> Data.append (Var.Declare ());
			}

		}

		else if (Statement.Function)
		{
			Function* Function;

			try
			{
				Function = &this -> FunctionList.at (Statement.Identifier);

				if (Function -> Entry == true)
				{
					Function -> Name.insert (0, "_");
				}

				Function -> Output.append (Function -> Name).append (": \n");

				for (int Pos = Function -> ThisScope.ScopeStart + 1; Pos < Function -> ThisScope.ScopeStop; Pos++)
				{
					Function -> Output.append (this -> ASMStat (&this -> Classified.at (Pos)));
				}

				Function -> Output.append ("ret \n ");
			}

			catch (std::out_of_range)
			{
				std::cout << "fuck error at function" << std::endl;
				break;
			}
		}
	}

	// Should be finished now

	for (auto& Functions : this -> FunctionList)
	{
		this -> Text.append (Functions.Output);
	}
}

namespace Assembly
{
	void Init (Parsed* Parsed)
	{
		/*
		section .text
			global _start

		_start:

		section .data
		*/

		Parsed -> Text.append ("section .text \n ");

		try
		{
			Parsed -> Text.append ("global _").append (Parsed -> FunctionList.at (Parsed -> EntryPos).Name).append (" \n"); // Still ok, because the insert is later
		}

		catch (...)
		{
			std::cout << "No entry point defined!" << std::endl;
		}

		Parsed -> BSS.append ("section .bss \n");
		Parsed -> Data.append ("section .data \n ");
	}

	// Takes the parsed stuff and redirect it to their specific functions that write stuff
	std::string Make (Parsed* Parsed, int Start, int Stop)
	{
		std::string Data;

		for (int Pos = Start + 1; Pos < Stop; Pos++)
		{
			Statement Statement = Parsed -> Classified.at (Pos);

			if (Statement.Variable)
			{
				Variable Var;

				try
				{
					Var = Parsed -> VariableList.at (Statement.Identifier);
				}

				catch (std::out_of_range)
				{
					Log::Error::Defined (9);
				}

				//			std::cout <<"Variable name is: "<< var.Name << std::endl;

				if (Var.Defined)
				{
					if (Var.Constant)
					{
						Data.append (Var.Define ());
					}
				}

				else
				{
					Data.append (Var.Declare ());
				}

			}
		}

		return Data;
	}

	void Write (Parsed *Parsed, std::string File)
	{
		Parsed -> Output = Parsed -> Text.append (Parsed -> BSS).append (Parsed -> Data);

 		std::ofstream Write (File);

		Write << Parsed -> Output << std::endl;
	}
}
