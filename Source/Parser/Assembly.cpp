#include "Assembly.h"

#include <fstream>
#include <iostream>

void Parsed::MakeAssembly()
{
}

namespace Assembly
{
	void Init(Parsed* p)
	{
		p->text.append("section .text \n");
		p->text.append("global _start \n");
		p->text.append("_start: \n");
		
		p->data.append("section .data \n");
	}
	void Write(Parsed *p,std::string file)
	{
		p->output = p->text.append(p->data); 

		std::ofstream write(file);

		write << p->output << std::endl;
	}
} 