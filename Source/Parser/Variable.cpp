#include "Variable.h"

#include <iostream>

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
	int FailIndex;
	for (auto& Statement : this -> Classified)
	{
		//std::cout << Statement.Args.at (0);
		if (Statement.Variable == true)
		{
			Variable Var;
			int Index; // Position of the regular position of interger

			//std::cout << Statement.Args.at (0);
			for (auto v : Statement.Args)
				std::cout << v << " ";
			std::cout << " :: ";
			std::cout << Var.Name;

			try
			{
				FailIndex += 1;

				if (Statement.Args.at (0).compare ("const") == 0)
				{
					std::cout << "a";
					Var.Name = Statement.Args.at (2);
					Var.Constant = true;
					Index = 1;
				}

				else
				{
					std::cout << "b";
					Var.Name = Statement.Args.at(1);
					Var.Constant = false;
					Index = 0;
				}

				if (Statement.Args.at (Index + 0).compare ("int") == 0)
				{
					std::cout << "c";
					Var.Type = 0;
					Var.Defined = true;
				}

				else if (Statement.Args.at (Index + 0).compare ("float") == 0)
				{
					std::cout << "d";
					Var.Type = 1;
					Var.Defined = true;
				}

				else if (Statement.Args.at (Index +0).compare ("char") == 0)
				{
					std::cout << "e";
					Var.Type = 2;
					Var.Defined = true;
				}

				else
				{
					std::cout << "f";
					Var.Defined = false;
				}

				if (Var.Defined == true)
				{
					std::cout << "g";
					try
					{
						// Defined
						if (Var.Type == 0)
						{
							std::cout << "h";
							Var.iValue = std::stoi (Statement.Args.at (Index + 2));

							this -> VariableList.push_back (Var);
							Statement.Identifier = this -> VariableList.size () - 1;
						}

						else if (Var.Type == 1)
						{
							std::cout << "i";
							Var.fValue = std::stof (Statement.Args.at (Index + 2));

							this -> VariableList.push_back (Var);
							Statement.Identifier = this -> VariableList.size () - 1;
						}

						else if (Var.Type == 2)
						{
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
				std::cout << "\n";
				// The error gets printed here!
				Log::Error::Custom ("Out of range vector at variable parsing");
			}

			std::cout << "\n";
		}
	}
}
