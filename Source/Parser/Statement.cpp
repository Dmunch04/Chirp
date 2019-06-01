#include "Statement.h"

#include <iostream>

std::string Parsed::ASMStat (Statement* Statement)
{
	if (Statement -> Variable)
	{
		Variable Var;

		try
		{
			Var = this -> VariableList.at (Statement -> Identifier);
		}

		catch (...)
		{
			return ";fuck \n";
		}

		if (!Var.Constant)
		{
		//	this->bss.append(var.Define());
		}
	}

	else if (Statement -> Type == 4)
	{
		return this -> CallFunc (Statement);
	}
	
	return "";
}
