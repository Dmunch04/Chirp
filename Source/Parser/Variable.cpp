#include "Variable.h"

#include <iostream>

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
					v.Declared = true;
				}
				else if (stat.Args.at(0).compare("float") == 0)
				{
					v.Type = 1;
					v.Name = stat.Args.at(1);
					v.Declared = true;
				}
				else if (stat.Args.at(0).compare("char") == 0)
				{
					v.Type = 2;
					v.Name = stat.Args.at(1);
					v.Declared = true;
				}
				else
				{
					v.Declared = false;
				}

				if (v.Declared == true)
				{
					try
					{
						// Defined
						if (v.Type == 0)
						{
							v.iValue = std::stoi(stat.Args.at(2));
							this->VariableList.push_back(v);
						}
						else if (v.Type == 1)
						{
							v.fValue = std::stof(stat.Args.at(2));
							this->VariableList.push_back(v);
						}
						else if (v.Type == 2)
						{
							v.cValue = stat.Args.at(2).at(0);
							this->VariableList.push_back(v);
						}
					}
					catch (std::out_of_range)
					{
						// Undefined
						// It's kinda stupid that I didn't make a defined/undefined boolean
						this->VariableList.push_back(v);
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