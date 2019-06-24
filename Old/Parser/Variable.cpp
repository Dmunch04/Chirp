#include "Variable.h"

#include <iostream>

Variable Parsed::FindVar(std::string name)
{
	for (auto& var : this->VariableList)
	{
		if (var.Name.compare(name) == 0)
		{
			return var; // wow that was pretty simple
		}
	}
}

std::string Variable::Define ()
{
	std::cout << "Writing variable definition in assembly" << std::endl;
	std::string Data;

	switch (this -> Type)
	{
	case 0:
		Data.append (this -> Name).append (" DW ").append (std::to_string (this -> iValue));
		return Data.append (" \n");

	case 1:
		Data.append(this -> Name).append (" DQ ").append (std::to_string (this -> fValue));
		return Data.append (" \n");

	case 2:
		Data.append (this -> Name).append (" DB '").append (1, this -> cValue).append ("'");
		return Data.append (" \n");

	default:
		Data.append ("; Oh hey, you're there. So basically your code is strangely wrong and I won't bother making any error for that");
		return Data.append (" \n");
	}
}

std::string Variable::Declare ()
{
	std::cout << "Writing variable declaration in assembly" << std::endl;
	std::string Data;
	Data.append (this -> Name);

	return Data;
}

// The: Error: Out of range vector at... error happens here!
void Parsed::ParseVar ()
{
	for (auto& Statement : this -> Classified)
	{
		if (Statement.Variable == true)
		{
			Variable Var;
			int Index; // Position of the regular position of interger

			// -- DEBUG -> REMOVE LATER --
			for (auto Arg : Statement.Args)
				std::cout << Arg << " ";

			std::cout << " :: ";
			std::cout << Var.Name;
			//

			try
			{
				if (Statement.Args.at (0).compare ("const") == 0)
				{
					// -- DEBUG -> REMOVE LATER --
					std::cout << "a";

					Var.Name = Statement.Args.at (2);
					Var.Constant = true;
					Index = 1;
				}

				else
				{
					// -- DEBUG -> REMOVE LATER --
					std::cout << "b";

					Var.Name = Statement.Args.at(1);
					Var.Constant = false;
					Index = 0;
				}

				if (Statement.Args.at (Index + 0).compare ("int") == 0)
				{
					// -- DEBUG -> REMOVE LATER --
					std::cout << "c";

					Var.Type = 0;
					Var.Defined = true;
				}

				else if (Statement.Args.at (Index + 0).compare ("float") == 0)
				{
					// -- DEBUG -> REMOVE LATER --
					std::cout << "d";

					Var.Type = 1;
					Var.Defined = true;
				}

				else if (Statement.Args.at (Index +0).compare ("char") == 0)
				{
					// -- DEBUG -> REMOVE LATER --
					std::cout << "e";

					Var.Type = 2;
					Var.Defined = true;
				}

				else
				{
					// -- DEBUG -> REMOVE LATER --
					std::cout << "f";

					Var.Defined = false;
				}

				if (Var.Defined == true)
				{
					// -- DEBUG -> REMOVE LATER --
					std::cout << "g";

					try
					{
						// Defined
						if (Var.Type == 0)
						{
							// -- DEBUG -> REMOVE LATER --
							std::cout << "h";

							Var.iValue = std::stoi (Statement.Args.at (Index + 2));

							this -> VariableList.push_back (Var);
							Statement.Identifier = this -> VariableList.size () - 1;
						}

						else if (Var.Type == 1)
						{
							// -- DEBUG -> REMOVE LATER --
							std::cout << "i";

							Var.fValue = std::stof (Statement.Args.at (Index + 2));
							this -> VariableList.push_back (Var);
							Statement.Identifier = this -> VariableList.size () - 1;
						}

						else if (Var.Type == 2)
						{
							// -- DEBUG -> REMOVE LATER --
							std::cout << "j";

							Var.cValue = Statement.Args.at (Index + 2).at (0);
							this -> VariableList.push_back (Var);
							Statement.Identifier = this -> VariableList.size () - 1;
						}
					}

					catch (std::out_of_range)
					{
						// Undefined
						// It's kinda stupid that I didn't make a defined/undefined boolean
						this -> VariableList.push_back (Var);
						Statement.Identifier = this -> VariableList.size () -1 ;
					}
				}
			}

			catch (std::out_of_range)
			{
				// -- DEBUG -> REMOVE LATER --
				std::cout << "\n";

				// The error gets printed here!
				Log::Error::Custom ("Out of range vector at variable parsing");
			}

			// -- DEBUG -> REMOVE LATER --
			std::cout << "\n";
		}
	}
}
