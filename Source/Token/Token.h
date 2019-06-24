#pragma once

#include <string>

// If you are confused by this, check out Lexer.cpp where most of them are assigned

// Token macro's below
// Note: They may or may not be in order, but they are grouped
#define TREE_START_TOKEN 0
#define TREE_UNDEFINED_TOKEN 2

#define VAR_TOKEN 3 // First node of any variable related structure
#define VAR_DEC_TOKEN 5
#define VAR_CONFIRM_TOKEN 12 // The : in int: a...

#define FUNC_TOKEN 23
#define FUNC_CALL_TOKEN 24

#define INTERGER_TOKEN 9
#define BOOLEAN_TOKEN 29

#define GATE_STRING_TOKEN 7
#define GATE_SCOPE_TOKEN 10
#define GATE_ARG_TOKEN 11

#define OBJECT_ID_TOKEN 8
#define OBJECT_TYPE_TOKEN 6 // Cast Type

#define KEYWORD_UNKNOWN_TOKEN 1 // When stuff is unknown, then spooky
#define KEYWORD_ENTRY_TOKEN 13
#define KEYWORD_CONST_TOKEN  14 // const keyword
#define KEYWORD_INNER_TOKEN 15

#define EXPRESSION_TOKEN 4
#define STATEMENT_TOKEN 17

#define ARITHMETIC_OPERATOR_TOKEN 18
#define ASSIGNEMENT_OPERATOR_TOKEN 19
#define COMPARAISON_OPERATOR_TOKEN 20
#define FIELD_OPERATOR_TOKEN 21 // .
#define SCOPE_OPERATOR_TOKEN 22 // ::

#define UNPARSED_TOKEN 16
#define NEWLINE_TOKEN 28 // Used in special occasions

// Preprocessor section
#define PREP_ASM 25
#define PREP_ASM_WORD 27
#define PREP_END 26

class Token
{
  public:
  	int Identifier; // Is defined somewhere
  	std::string Lexeme;
};
