#pragma once

#include "Variable.h"

#include <vector>
#include <string>

/*
Class used to represent variables that can be rewritten in assembly later.
*/
class Variable
{
public:
	bool Defined;
};

class Statement
{
public:
	Statement();

	bool Defined;
	bool Variable;

	std::vector<std::string> Args; // Pretty Universal
};

/*
Most important class for the compiler. Everything is happening here and it's a 
pretty way to do stuff.
*/
class Parsed
{
public: // Ok so you can see that the lower you go, the later the compiler is gonna work on it
	Parsed();
	
	void Classify();
	void ParseVar(); // Pretty self explanatry wait fuck..

	std::vector<std::string> Unclassified; // What if it's declassified O_o 
	std::vector<Statement> Classified;

	std::vector<Variable> VariableList;

	std::string text; // section .text
	std::string data; // section .data

	std::string output;
};

namespace Parser
{
	Parsed Parse(std::string);
}