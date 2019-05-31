#include "Assembly.h"

#include "Variable.h"

#include <fstream>
#include <iostream>

// Starts the assembly writing process after writing in assembly
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
			Function* func;

			try
			{
				func = &this->FunctionList.at(s.Identifier);
				
				if (func->Entry == true)
				{
					func->Name.insert(0,"_");
				}

				func->Output.append(func->Name).append(": \n");

				for (int pos = func->scope.ScopeStart + 1; pos < func->scope.ScopeStop; pos++)
				{
					func->Output.append(this->ASMStat(&this->Classified.at(pos)));
				}

				func->Output.append("ret \n ");
			}
			catch (std::out_of_range)
			{
				std::cout << "fuck error at function" << std::endl;
				break;
			}
		}
	}

	// Should be finished now

	for (auto& f : this->FunctionList)
	{
		this->text.append(f.Output);
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
			p->text.append("global _").append(p->FunctionList.at(p->EntryPos).Name).append(" \n"); // Still ok, because the insert is later
		}
		catch (...)
		{
			std::cout << "No entry point defined" << std::endl;
		}

		p->bss.append("section .bss \n");
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
		p->output = p->text.append(p->bss).append(p->data); 

 		std::ofstream write(file);

		write << p->output << std::endl;
	}
} 