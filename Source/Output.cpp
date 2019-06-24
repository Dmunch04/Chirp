#include "Output.h"

#include "Variable.h"
#include "Domain/Function.h"
#include "Console/Log/Error.h"

#include <fstream>
#include <iostream>

namespace Output
{
	void Generate (Environement* env)
	{
	//	std::cout << "Starting assembly generator" << std::endl;

		int Position = 0;
		bool InVar = false; // Inside a variable
		bool InAsm = false;

		for (auto& tkn : env->Syntax)
		{
			if (tkn.Identifier == PREP_ASM_WORD)
			{
				env->Text.append(tkn.Lexeme);
			}
			if (tkn.Identifier == NEWLINE_TOKEN)
			{
				env->Text.append("\n");
			}

			if (tkn.Identifier == VAR_TOKEN)
			{
				//		std::cout << "Inside a variable" << std::endl;
				InVar = true;
			}
			if (tkn.Identifier == VAR_DEC_TOKEN)
			{
				Variable::Register(Position, env);
			}
			if (tkn.Identifier == EXPRESSION_TOKEN)
			{
				env->Text.append(Variable::Assign(Position - 1, env)); // pos - 1 so it starts at name
			}
			if (tkn.Identifier == FUNC_TOKEN)
			{
			//	std::cout << "Function token" << std::endl;
				env->Text.append(Function::WriteFunction(Position, env));
			}
			if (tkn.Identifier == GATE_SCOPE_TOKEN)
			{
				if (tkn.Lexeme.compare("{") == 0)
				{
					Function::GenOpen(env);
				}
				if (tkn.Lexeme.compare("}") == 0)
				{
					Function::GenClose(env);
				}
			}
			if (tkn.Identifier == FUNC_CALL_TOKEN)
			{
				env->Text.append(Function::CallFunction(Position,env));
			}
			Position++;
		}
	}

	void Write(Environement* env)
	{
		std::ofstream Write(env->AltFile);

		if (!Write)
		{
			Log::Error::Custom("Couldn't write assembly output");
		}
		else
		{
			Write << "section .text \n"; // Stupid problems need lazy solutions
			Write << env->Header.append(env->Text) << std::endl;
			Write.close();
			// Succes
		}
	}
	std::string Reg(std::string p, Environement* env)
	{
		std::string Out = p;

		if (env->Architecture == 32)
		{
			Out.insert(0,"e");
			return Out;
		}
		else if (env->Architecture == 64)
		{
			Out.insert(0,"r");
			return Out;
		}

	}
}
