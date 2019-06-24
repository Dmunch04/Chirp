#include "Syntax.h"
#include "Variable.h"

#include <iostream>

void Syntax::MakeSyntax(Environement* env)
{
	int pos = 0;

	bool InASM = false;
	bool InArgs = false;

	for (auto& t : env->Cluster)
	{
		// Preprocessor commands
		if(t.Identifier == PREP_ASM)
		{
			InASM = true;
		}
		if (t.Identifier == PREP_END)
		{
			InASM = false;
		}

		// Keywords
		if (!InASM)
		{
			if (t.Identifier == OBJECT_TYPE_TOKEN)
			{
				if (env->Cluster.at(pos + 1).Identifier == VAR_CONFIRM_TOKEN) // Is a variable
				{
					// >int< : a = 123
					Token Var;
					Var.Identifier = VAR_TOKEN;
					env->Syntax.push_back(Var);

					Token Dec; // Declaration
					Dec.Identifier = VAR_DEC_TOKEN;
					env->Syntax.push_back(Dec);

					env->Syntax.push_back(env->Cluster.at(pos)); // Data type

					Token Name;
					Name.Identifier = OBJECT_ID_TOKEN;
					Name.Lexeme = env->Cluster.at(pos + 2).Lexeme;
					env->Syntax.push_back(Name); // After Assignement, so it's in order
				}
				else // Is probably a function
				{
					// int abc() { }
					// ^^^ 1  23 4 5
					if (env->Cluster.at(pos + 1).Identifier == UNPARSED_TOKEN)
					{
						Token Func;
						Func.Identifier = FUNC_TOKEN;
						env->Syntax.push_back(Func);

						Token Name;
						Name.Identifier = OBJECT_ID_TOKEN;
						Name.Lexeme = env->Cluster.at(pos + 1).Lexeme;
						env->Syntax.push_back(Name);
					}
				}
			}
			if (t.Identifier == ASSIGNEMENT_OPERATOR_TOKEN) // Assignement
			{
				Token Exp; // Expression
				Exp.Identifier = EXPRESSION_TOKEN;
				env->Syntax.push_back(Exp);

				env->Syntax.push_back(t);

				if (env->Cluster.at(pos + 2).Identifier != ARITHMETIC_OPERATOR_TOKEN)
				{
					Token Value; // Very very very very temporary

					if (isdigit(env->Cluster.at(pos + 1).Lexeme.at(0)))
					{
						Value.Identifier = INTERGER_TOKEN;
						Value.Lexeme = env->Cluster.at(pos + 1).Lexeme;
					}
					else if (env->Cluster.at(pos + 1).Lexeme.compare("true") == 0 || env->Cluster.at(pos + 1).Lexeme.compare("false") == 0)
					{
						Value.Identifier = BOOLEAN_TOKEN;
						Value.Lexeme = env->Cluster.at(pos + 1).Lexeme;
					}
					else
					{
						Value.Identifier = OBJECT_ID_TOKEN;
						Value.Lexeme = env->Cluster.at(pos + 1).Lexeme;
					}

					env->Syntax.push_back(Value);
				}
			}
			if (t.Identifier == ARITHMETIC_OPERATOR_TOKEN)
			{
				Token Arth;
				Arth.Identifier = ARITHMETIC_OPERATOR_TOKEN;
				Arth.Lexeme = t.Lexeme;

				Token First;
				First.Lexeme = env->Cluster.at(pos - 1).Lexeme;

				Token Second;
				Second.Lexeme = env->Cluster.at(pos + 1).Lexeme;

				// Checks for identifiers
				if (isdigit(env->Cluster.at(pos - 1).Lexeme.at(0)))
				{
					First.Identifier = INTERGER_TOKEN;
				}
				else // Doesn't take into account(yet) for char
				{
					First.Identifier = OBJECT_ID_TOKEN;
				}

				if (isdigit(env->Cluster.at(pos + 1).Lexeme.at(0)))
				{
					Second.Identifier = INTERGER_TOKEN;
				}
				else
				{
					Second.Identifier = OBJECT_ID_TOKEN;
				}

				env->Syntax.push_back(First);
				env->Syntax.push_back(Arth);
				env->Syntax.push_back(Second);
			}
			if (t.Identifier == GATE_ARG_TOKEN)
			{
				env->Syntax.push_back(t);
			}
			if (t.Identifier == GATE_SCOPE_TOKEN)
			{
				env->Syntax.push_back(t);
			}
			if (t.Identifier == KEYWORD_ENTRY_TOKEN) // Entry functions
			{
				Token Func;
				Func.Identifier = FUNC_TOKEN;
				env->Syntax.push_back(Func);

				env->Syntax.push_back(t);

				Token Name;
				Name.Identifier = OBJECT_ID_TOKEN;
				Name.Lexeme = env->Cluster.at(pos + 1).Lexeme;

				if (Name.Lexeme.compare("(") == 0)
				{
					Name.Lexeme = "undefined";
					env->Syntax.push_back(Name);
				}
				else
				{
					env->Syntax.push_back(Name);
				}

				env->EntryLabel = Name.Lexeme;
				/*
				Token Arg;
				Arg.Identifier = GATE_ARG_TOKEN;
				Arg.Lexeme = "(";
				env->Syntax.push_back(Arg);
				Arg.Lexeme = ")";
				env->Syntax.push_back(Arg);
				*/
			}
			if (t.Identifier == GATE_ARG_TOKEN) // Probably a function call
			{
				if (pos - 2 > 0) // So we don't get an out of range if entry is the first token.
				{
					if (env->Cluster.at(pos - 2).Identifier != OBJECT_TYPE_TOKEN && env->Cluster.at(pos - 1).Identifier != KEYWORD_ENTRY_TOKEN) // Confirming not a declaration or def
					{
						if (t.Lexeme.compare("(") == 0)
						{
							// Confirmed function call
							Token Call;
							Call.Identifier = FUNC_CALL_TOKEN;
							env->Syntax.push_back(Call);

							Token Name;
							Name.Identifier = OBJECT_ID_TOKEN;
							Name.Lexeme = env->Cluster.at(pos - 1).Lexeme;
							env->Syntax.push_back(Name);

							InArgs = true;
						}
						if (t.Lexeme.compare(")") == 0)
						{
							InArgs = false;
						}
					}
				}
			}
			if (InArgs)
			{
				Token Param;

				if (t.Lexeme.compare("(") == 0 || t.Lexeme.compare(")") == 0) // This is bad
				{
					Param.Identifier = GATE_ARG_TOKEN;
					Param.Lexeme = t.Lexeme;
				}
				else
				{
					if (isdigit(t.Lexeme.at(0)))
					{
						Param.Identifier = INTERGER_TOKEN;
					}
					else
					{
						Param.Identifier = OBJECT_ID_TOKEN;
					}
				}

				Param.Lexeme = t.Lexeme;

				if (env->Cluster.at(pos - 1).Identifier != ASSIGNEMENT_OPERATOR_TOKEN || env->Cluster.at(pos - 1).Identifier != ARITHMETIC_OPERATOR_TOKEN)
				{
					env->Syntax.push_back(Param);
				}
			}
		}
		else
		{
		Token tkn;
		tkn.Identifier = PREP_ASM_WORD;
		tkn.Lexeme = t.Lexeme.append(" ");
		env->Syntax.push_back(tkn);

			if (t.Identifier == NEWLINE_TOKEN)
			{
				env->Syntax.push_back(t);
			}
		}
		pos++;
	}
}
