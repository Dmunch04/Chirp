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
	std::string Name;

	int Type; // 0 - int, 1 - float, 2 - character
	bool Declared;

	int iValue; // Interger value
	float fValue; // Float value
	char cValue; // Character value
};


class Function
{
public:
	int Type; // 0 - int, 1 - float, 2 - character
	bool Declared;

	int StartPos; // Position where the scope starts
	int EndPos; // Position where the scope ends
};

class Statement
{
public:
	Statement();

	int Type; // 0 - Variable Dec, 1 - Variable Def, 2 - Variable Dec&Def
	int Identifier; // Should I call id ? Identify in the vector of either Variable or Function depending on the typr

	bool Defined;
	bool Variable;

	std::vector<std::string> Args; // Pretty Universal
};

/*
Most important class for the compiler. Everything is happening here iet's a 
pretty way to do stuff.
*/
class Parsed
{
public: // Ok so you can see that the lower you go, the later the compiler is gonna work on it
	Parsed();
	
	void Classify();
	void ParseVar(); // Pretty self explanatry wait fuck..
	void MakeAssembly();

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