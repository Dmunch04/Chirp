#pragma once

#include "../Logger/Error.h"

#include <vector>
#include <string>

/*
Class used to represent variables that can be rewritten in assembly later.
*/
class Variable
{
public:
	Variable();

	std::string Name;

	std::string Define();
	std::string Declare();

	int Type; // 0 - int, 1 - float, 2 - character
	bool Defined;
	bool Constant;

	int iValue; // Interger value
	float fValue; // Float value
	char cValue; // Character value
};

class Statement
{
public:
	Statement();

	int Type; // Look up the codes in Documentation/Parsing.md, it's there and it's pretty. - Binkiklou
	int Identifier; // Should I call id ? Identify in the vector of either Variable or Function depending on the type

	bool Variable;
	bool Function;

	std::vector<std::string> Args; // Pretty Universal
};

// Thise shouldn't be called scope but it is, can't find a name
// basicallly it's either the positions of various symbols or
// thoses of conditions
class Scope
{
public:
	Scope();

	void Set(int, std::vector<Statement>*); // Pretty much parses it 

	bool hasArg;

	int ArgStart; // Position where the parenthesis opens
	int ArgStop; // Position where the parenthesis closes
	int ScopeStart; // Position where the brackets start
	int ScopeStop; // Position where the brackets stop
};

/*
This is pretty important, for function.
*/
class Function
{
public:
	std::string Name;

	int Type; // 0 - int, 1 - float, 2 - character
	bool Defined;
	bool Entry;

	Scope scope;

	std::string Output;
//	int OutId; // Position in parsed's fout
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
	void ParseFunc();
	std::string CallFunc(Statement* stat);
	std::string ASMStat(Statement*); // Makes a statement inside a stack into assembly code
	void MakeAssembly();

	std::vector<std::string> Unclassified; // What if it's declassified O_o 
	std::vector<Statement> Classified;

	std::vector<Variable> VariableList;
	std::vector<Function> FunctionList;

	int EntryPos;

	std::string text; // section .text
	std::string bss; // section .bss
	std::string data; // section .data

	std::string output;
};

namespace Parser
{
	Parsed Parse(std::string);
}
