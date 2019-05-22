#include "Assembly.h"

#include "Variable.h"

#include <fstream>
#include <iostream>

void Parsed::MakeAssembly()
{
	for (auto &s : this->Classified) // Ok so get this shit ID
	{
		if (s.Variable)
		{
			Variable var;

			try
			{
				var = this->VariableList.at(s.Identifier);
			}
			catch (std::out_of_range)
			{
				std::cout << "fuck error" << std::endl;
				break;
			}

			std::cout <<"Variable name is: "<< var.Name << std::endl;

			if (var.Defined)
			{
				Var::Define(&var,&text);
			}
			else
			{
				Var::Declare(&var,&text);
			}

		}
		else if (s.Function)
		{
			Function func;

			try
			{
				func = this->FunctionList.at(s.Identifier);
			}
			catch (std::out_of_range)
			{
				std::cout << "fuck error" << std::endl;
				break;
			}

			std::cout << "Function name is: " << func.Name << std::endl;
		}
	}
}

namespace Assembly
{
	void Init(Parsed* p)
	{
		/*
		section .text
			global _start

		_start:
			
		section .data
		*/
		p->text.insert(0,"section .text \n ");
		p->text.append("global _start \n ");
		p->text.append("_start: \n ");
		
		p->data.append("section .data \n ");
	}
	void Write(Parsed *p,std::string file)
	{
		p->output = p->text.append(p->data); 

		std::ofstream write(file);

		write << p->output << std::endl;
	}
} 