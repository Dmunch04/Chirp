#include "Object.h"

#include <iostream>

namespace Obj
{
	int FindByName (std::string name,std::vector<Object> objects)
	{
		bool hasFound = false;

		int pos = 0;

		for (auto& obj : objects)
		{
			if (hasFound)
			{
				break;
			}

			if (obj.Name == name)
			{
				hasFound = true;
				return pos;
		//		return obj;
			}
			pos++;
		}

		if (!hasFound)
		{
			Object undef; // Undefined object
			undef.Name = "undefined";
			undef.Size = 1;
			return 0;
		//	return undef;
		}
	}
	int FindById(std::string id, std::vector<Object> objects)
	{
		bool hasFound = false;
		int pos = 0;

		for (auto& obj : objects)
		{
			if (hasFound)
			{
				break;
			}

			if (obj.Id == id) // I forgot that works
			{
				hasFound = true;
				return pos;
		//		return obj;
			}
			pos++;
		}

		if (!hasFound)
		{
			Object undef; // Undefined object
			undef.Name = "undefined";
			undef.Size = 1;
			return 0;
		//	return undef;
		}
	}
}
