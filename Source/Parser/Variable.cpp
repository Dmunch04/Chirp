#include "Variable.h"

#include <iostream>

std::string Variable::Define()
{
	std::cout << "Writing variable definition in assembly" << std::endl;
	std::string d;

	switch (this->Type)
	{
	case 0:
		d.append(this->Name).append(" DW ").append(std::to_string(this->iValue));
		break;
	case 1:
		d.append(this->Name).append(" DQ ").append(std::to_string(this->fValue));
		break;
	case 2:
		d.append(this->Name).append(" DB '").append(1,this->cValue).append("'");
		break;
	default:
		d.append("; Oh hey, you're there. So basically your code is strangely wrong and I won't bother making any error");
		break;
	}

	return d.append(" \n");
}
std::string Variable::Declare()
{
	std::cout << "Writing variable declaration in assembly" << std::endl;
	std::string d;
	d.append(this->Name);
	return d;
}

void Parsed::ParseVar()
{
	for (auto& stat : this->Classified)
	{
		if (stat.Variable == true)
		{
			Variable v;
			try
			{
				if (stat.Args.at(0).compare("int") == 0)
				{
					v.Type = 0;
					v.Name = stat.Args.at(1);
					v.Defined = true;
				}
				else if (stat.Args.at(0).compare("float") == 0)
				{
					v.Type = 1;
					v.Name = stat.Args.at(1);
					v.Defined = true;
				}
				else if (stat.Args.at(0).compare("char") == 0)
				{
					v.Type = 2;
					v.Name = stat.Args.at(1);
					v.Defined = true;
				}
				else
				{
					v.Defined = false;
				}

				if (v.Defined == true)
				{
					try
					{
						// Defined
						if (v.Type == 0)
						{
							v.iValue = std::stoi(stat.Args.at(2));
							
							this->VariableList.push_back(v);
							stat.Identifier = this->VariableList.size() - 1;
						}
						else if (v.Type == 1)
						{
							v.fValue = std::stof(stat.Args.at(2));
							
							this->VariableList.push_back(v);
							stat.Identifier = this->VariableList.size() - 1;
						}
						else if (v.Type == 2)
						{
							v.cValue = stat.Args.at(2).at(0);

							this->VariableList.push_back(v);
							stat.Identifier = this->VariableList.size() - 1;
						}
					}
					catch (std::out_of_range)
					{
						// Undefined
						// It's kinda stupid that I didn't make a defined/undefined boolean
						this->VariableList.push_back(v);
						stat.Identifier = this->VariableList.size() -1 ;
					}
				}
			}
			catch (std::out_of_range)
			{
				std::cout << "Error C" << std::endl;
			}
		}
	}
}