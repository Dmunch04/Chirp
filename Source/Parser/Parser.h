#pragma once

#include <vector>
#include <string>

class Token // WeLL TeChNiCaLlY It'S A LExeME
{
public:
	Token();
	int Type;
	std::vector<std::string> Args;
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

	std::vector<std::string> Unclassified; // What if it's declassified O_o 
	std::vector<Token> Classified;
	
	std::string text; // section .text
	std::string data; // section .data

	std::string output;
};

namespace Parser
{
	Parsed Parse(std::string);
}