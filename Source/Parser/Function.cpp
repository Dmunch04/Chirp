#include "Function.h"

void Parsed::ParseFunc()
{
	for (auto& stat : this->Classified)
	{
		if (stat.Function)
		{
			Function f;
			try
			{
				f.Name = stat.Args.at(1);

				this->FunctionList.push_back(f);
			}
			catch (...)
			{
				// error should be written
			}
		}
	}
}