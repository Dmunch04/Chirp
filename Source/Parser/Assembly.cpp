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
				this->data.append(var.Define());
			}
			else
			{
				this->data.append(var.Declare());
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
				std::cout << "fuck error at function" << std::endl;
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

		p->text.append("section .text \n ");
		
		for (auto& d : p->FunctionList)
		{
			p->text.append("global _").append(d.Name);
		}

		p->data.append("section .data \n ");
	}
	void Write(Parsed *p,std::string file)
	{
		p->output = p->text.append(p->data); 

		std::ofstream write(file);

		write << p->output << std::endl;
	}
} 