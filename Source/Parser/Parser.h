#pragma once

#include <vector>
#include <string>

class Keyword
{
public:
	Keyword();
};

class Parsed
{
public:
	Parsed();
	
	void Classify();

	std::vector<Keyword> Keys; // Or hooks ? That would sound cool
	std::vector<std::string> Unclassified; // What if it's declassified O_o 
};

namespace Parser
{
	Parsed Parse(std::string);
}