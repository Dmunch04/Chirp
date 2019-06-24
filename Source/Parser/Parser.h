#pragma once

#include "../Tree.h"

#include "../Object/Object.h"

#include <vector>
#include <string>
#include <stdexcept> // Very important, might create errors if not there on certain system

/*
There can be multiple environements, for multiple files. So environement is a class.
*/
class Environement
{
	public: // Ok so you can see that the lower you go, the later the compiler is gonna work on it
		// Tree ParseTree;

		int Architecture;

		std::vector<std::string> Processed; // All words in the code, are in the vector
		std::vector<Token> Cluster; // Unorganized cluster
		std::vector<Token> Syntax; // Organized cluster

		std::vector<int> Index;
		std::vector<Object> ObjectList; // Objects can be pretty much anything

		std::string InFile;
		std::string AltFile; // Alternative file(asm)
		std::string OutFile;
		std::string EntryLabel; // Name of entry function

		int Stack;
		int StackId; // Ok so this isn't the best practice, but every stack has a number

		std::string Header; // Name I tought would fit, where the asm functions are said "global"
		std::string Text; // Assembly text section
};


namespace Parser
{
	void Setup(std::string,Environement*);
	void Tokenize (Environement*); // Makes the text into tokens
//	void MakeTree (Environement*); // Creates the parse tree
//	void MakeIndex (Environement*); // Read the tree and create an index to make reading it easier
}
