#pragma once

#include <vector>
#include <string>

/*
Contains all the information about keywords
*/
class Keyword
{
public:
	Keyword();
};

/*
Most important class for the compiler. Everything is happening here and it's a 
pretty way to do stuff.
*/
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