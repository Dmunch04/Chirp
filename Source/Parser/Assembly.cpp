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
				Log::Error::Defined(9);
				break;
			}

			if (var.Defined)
			{
				if (var.Constant)
				{
					this->data.append(var.Define());
				}
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

//			this->text.append(func.Define(&this->Classified));
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

		try
		{
			p->text.append("global _").append(p->FunctionList.at(p->EntryPos).Name).append(" \n");
		}
		catch (...)
		{
			std::cout << "No entry point defined" << std::endl;
		}

		/*
		for (auto& d : p->FunctionList)
		{
			p->text.append("global _").append(d.Name).append(" \n");
		}
		*/

		p->data.append("section .data \n ");
	}

	// Takes the parsed stuff and redirect it to their specific functions that write stuff
	std::string Make(Parsed* p,int start,int stop)
	{
		std::string d;

		for (int pos = start + 1; pos < stop; pos++)
		{
			Statement s = p->Classified.at(pos);
			if (s.Variable)
			{
				Variable var;

				try
				{
					var = p->VariableList.at(s.Identifier);
				}
				catch (std::out_of_range)
				{
					Log::Error::Defined(9);
				}

				//			std::cout <<"Variable name is: "<< var.Name << std::endl;

				if (var.Defined)
				{
					if (var.Constant)
					{
						d.append(var.Define());
					}
				}
				else
				{
					d.append(var.Declare());
				}

			}
		}
		return d;
	}

	void Write(Parsed *p,std::string file)
	{
		p->output = p->text.append(p->data); 

		std::ofstream write(file);

		write << p->output << std::endl;
	}
} 