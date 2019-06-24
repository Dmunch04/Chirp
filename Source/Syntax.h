#pragma once

// This is just taking the tokenized stuff
// and tokenizing it even more.

#include "Parser/Parser.h"

namespace Syntax
{
	/*
	Making the syntax, it's like the MakeTree but without a
	tree. Will create a vector with the same tokens but with a
	bit more tokens. So things are more organized.
	Basically structure the cluster
	*/
	void MakeSyntax(Environement*);
}
