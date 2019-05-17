#include "Parser.h"

//===CLASS DEFINITON
Keyword::Keyword()
{

}
Parsed::Parsed()
{
	
}
//===FUNCTION DEFINITIONS
Parsed Parser::Parse()
{
	// Ok so basically in here let's seperate words.
	// and make them in seperate keywords, but let's not touch any assembly code
	// because the nicely parsed objects will be forwared to the assembly portion
	// of the compiler.
	Parsed p;
	return p;
}