#include "Statement.h"

#include <iostream>

std::string Parsed::ASMStat(Statement* s)
{
	if (s->Variable)
	{
		Variable var;

		try
		{
			var = this->VariableList.at(s->Identifier);
		}
		catch (...)
		{
			return ";fuck \n";
		}

		if (!var.Constant)
		{
			this->bss.append(var.Define());
			std::cout << "Yeeted: " << bss << std::endl;
		}
	}
	return ";yeet \n";
}