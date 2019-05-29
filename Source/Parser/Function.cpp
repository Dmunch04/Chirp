#include "Function.h"

#include <iostream>

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
				if (stat.Args.at(1).compare("entry") == 0)
				{
					f.Name = stat.Args.at(2);
					f.Entry = true;
				}
				else
				{
					f.Name = stat.Args.at(1);
					f.Entry = false;
				}

				f.scope.Set(pos,&this->Classified);

				if (f.Entry == true)
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