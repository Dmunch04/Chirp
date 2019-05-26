#include "Function.h"

#include <iostream>

std::string Function::Define()
{
	std::cout << "Writing function assembly definition" << std::endl;

	std::string d;

	d = this->Name.append(": \n");

	for (int pos = this->ScopeStartPos; pos < this->ScopeEndPos; pos++)
	{

	}

	return d;
}

void Parsed::ParseFunc()
{
	int parg = 0; // parenthesis argument lister
	int sarg = 0; // scope argument lister 

	bool ArgOpened = false;
	bool ArgClosed = false;
	bool ScopeOpened = false;
	bool ScopeClosed = false;

	int pos = 0; // may have to do it -1

	for (auto& stat : this->Classified)
	{
		pos++;

		if (stat.Function)
		{
			Function f;

			try
			{
				f.Name = stat.Args.at(1);

				for (pos; pos < this->Classified.size(); pos++) // This is litteraly the most inneficient thing ever made, but computers are fast
				{
					try
					{
						if (this->Classified.at(pos).Args.at(0).compare("(") == 0 && ArgClosed == false)
						{
							parg++;
							ArgOpened = true;
							f.ArgStartPos = pos;
						}
						else if (this->Classified.at(pos).Args.at(0).compare(")") == 0 && ArgClosed == false)
						{
							parg--;
							// Won't do ArgClosed because it won't work with multiple parenthesises
						}
						if (parg == 0 && ArgOpened == true)
						{
							ArgClosed = true;
							f.ArgEndPos = pos;
						}

						if (this->Classified.at(pos).Args.at(0).compare("{") == 0 && ScopeClosed == false)
						{
							sarg++;
							ScopeOpened = true;
							f.ScopeStartPos = pos;
						}
						else if (this->Classified.at(pos).Args.at(0).compare("}") == 0 && ScopeClosed == false)
						{
							sarg--;
						}
						if (sarg == 0 && ScopeOpened == true)
						{
							ScopeClosed = true;
							f.ScopeEndPos = pos;
						}
					}
					catch (...)
					{
					}
				}

				if (stat.Entry == true)
				{
					try
					{
						this->EntryPos = this->FunctionList.size();
					}
					catch (...)
					{
					}
				}

				this->FunctionList.push_back(f);
				stat.Identifier = this->FunctionList.size() - 1;
			}
			catch (...)
			{
				// error should be written
			}
		}
	}
}

void Parsed::CallFunc()
{

}