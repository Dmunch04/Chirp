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

	int iValue; // Interger value
	float fValue; // Float value
	char cValue; // Character value
};

/*
This is pretty important, for function.
*/
class Function
{
public:
	std::string Name;

	std::string Define();

	int Type; // 0 - int, 1 - float, 2 - character
	bool Defined;

	int ArgStartPos; // ( - pos
	int ArgEndPos; // ) - pos

	int ScopeStartPos; // Position where the scope starts
	int ScopeEndPos; // Position where the scope ends 

	int OutId; // Position in parsed's fout
};

class Statement
{
public:
	Statement();

	int Type; // 0 - Variable Dec, 1 - Variable Def, 2 - Variable Dec&Def
	int Identifier; // Should I call id ? Identify in the vector of either Variable or Function depending on the type

	bool Defined;
	bool Variable;
	bool Function;
	bool Entry;

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
	void ParseFunc();
	void CallFunc();
	void MakeAssembly();

	std::vector<std::string> Unclassified; // What if it's declassified O_o 
	std::vector<Statement> Classified;

	std::vector<Variable> VariableList;
	std::vector<Function> FunctionList;

	int EntryPos;

	std::string text; // section .text
	std::vector<std::string> fout; // Function and Output
	std::string data; // section .data

	std::string output;
};

namespace Parser
{
	Parsed Parse(std::string);
}