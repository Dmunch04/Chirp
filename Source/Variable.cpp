#include "Output.h"
#include "Variable.h"
#include "Console/Log/Log.h"

#include <iostream>

void Variable::Register (int pos, Environement* env)
{
	Object Var; // New variable
	bool Failure = false;

	bool hasName = false;
	bool hasType = false;

	std::string Name;
	std::string Type;

	Token t = env->Syntax.at(pos); // phew fixed it

	try
	{
		// VAR >VAR_DEC< OBJECT_TYPE CONFIRM OBJECT_NAME
		Name = env->Syntax.at(pos + 2).Lexeme; // type : >name<
		Type = env->Syntax.at(pos + 1).Lexeme; // >type< : name
	}
	catch (std::out_of_range)
	{
		Log::Error::Custom("Error at variable definiton scouting"); // Scouting, is exploring to see what are the values
		Failure = true;
	}

	if (!Failure)
	{
		Var.Name = Name;

		if (Type.compare("int") == 0) // 2 bytes
		{
			Var.Size = 2;
		}
		if (Type.compare("char") == 0 || Type.compare("bool") == 0) // 1 byte
		{
			Var.Size = 1;
		}
		if (Type.compare("string") || Type.compare("float") == 0) // 4 bytes
		{
			Var.Size = 4;
		}
		else // Size for all occasions
		{
			Var.Size = 2;
		}

		env->ObjectList.push_back(Var);
	}
}

// This part of the code really needs cleaning up
// and it is also pretty important. So yea, I guess i could
// make an issue about it. But nah, it's fine
// - Binkiklou
std::string Variable::Operation(int pos, Environement* env)
{
	// The types looks like this
	// 0: Addition
	// 1: Substraction
	// 2: Multiplication
	// 3: Division
	// 4: Incrementation
	// 5: Decrementation
	int Op;

	std::string OpSymbol = env->Syntax.at(pos).Lexeme;

	Token First = env->Syntax.at(pos - 1);
	Token Second = env->Syntax.at(pos + 1);

//	std::cout << "Operation is " << env->Syntax.at(pos).Lexeme << std::endl;

	// Recognizing symbol
	if(OpSymbol.compare("+") == 0)
	{
		Op = 0;
	}
	else if (OpSymbol.compare("-") == 0)
	{
		Op = 1;
	}
	else if (OpSymbol.compare("*") == 0)
	{
		Op = 2;
	//	Log::Warning("Multiplication aren't implemented yet");
	}
	else if (OpSymbol.compare("/") == 0)
	{
		Op = 3;
	//	Log::Warning("Divisions aren't implemented yet");
	}
	else if (OpSymbol.compare("++") == 0)
	{
		Op = 4;
	}
	else if (OpSymbol.compare("--") == 0)
	{
		Op = 5;
	}

	if (First.Identifier == INTERGER_TOKEN && Second.Identifier == INTERGER_TOKEN) // Two constant intergers
	{
		// Ok, so this is the first little optimisation
		switch (Op)
		{
		case 0: // Addition
			return std::to_string(std::stoi(First.Lexeme) + std::stoi(Second.Lexeme));
			break;
		case 1: // Substraction
			return std::to_string(std::stoi(First.Lexeme) - std::stoi(Second.Lexeme));;
			break;
		case 2: // Multiplication
			return std::to_string(std::stoi(First.Lexeme) * std::stoi(Second.Lexeme));
			break;
		case 3: // Division
			return std::to_string(std::stoi(First.Lexeme) / std::stoi(Second.Lexeme));
			break;
		case 4: // Inc
			Log::Warning("Decrementation isn't implemented yet, the specific part of the code won't be compiled");
			return "0";
			break;
		case 5: // Dec
			Log::Warning("Decrementation isn't implemented yet, the specific part of the code won't be compiled");
			return "0";
			break;
		}
	}
	else
	{
		std::string FVal;
		std::string SVal;

		std::string Opcode;

		if (Op == 0)
		{
			Opcode = "add "; // Statement for addition
		}
		else if(Op == 1)
		{
			Opcode = "sub ";
		}

		if (First.Identifier == OBJECT_ID_TOKEN)
		{
			int FPos = Obj::FindByName(First.Lexeme, env->ObjectList); // Fucked if there is two of the same type
			FVal = "[";
			FVal.append(Output::Reg("bp-",env));
			FVal.append(std::to_string(env->ObjectList.at(FPos).Position));
			FVal.append("]");
			env->Text.append("mov ").append(Output::Reg("dx",env)).append(",").append(FVal).append("\n");
			Opcode.append(Output::Reg("ax",env));
			Opcode.append(", ");
		}
		else
		{
			FVal = First.Lexeme;
			Opcode.append(FVal);
			Opcode.append(", ");
			Opcode.append(Output::Reg("dx",env));
		}

		if (Second.Identifier == OBJECT_ID_TOKEN)
		{
			int SPos = Obj::FindByName(Second.Lexeme, env->ObjectList); // Fucked if there is two of the same type
			SVal = "[";
			SVal .append(Output::Reg("bp+", env));
			SVal.append(std::to_string(env->ObjectList.at(SPos).Position));
			SVal.append("]");

			env->Text.append("mov ").append(Output::Reg("ax",env)).append(", ").append(SVal).append("\n");

			Opcode.append(Output::Reg("dx",env));
			Opcode.append("\n");
		}
		else
		{
			SVal = Second.Lexeme;
			Opcode.append(SVal).append("\n");
		}

		env->Text.append(Opcode);
		return Output::Reg("ax",env);
	}
}

std::string Variable::Assign(int pos, Environement* env)
{
	bool Failure = false;
	bool TargetSet = false; //This should look like int: Target = Source
	bool SourceSet = false; // Can be another variable id or value
	bool AssignSet = false;
	bool ConstantVal = false;

	std::string Target; // Variable to be assigned
	std::string Source;

	for (int i = pos; i < env->Syntax.size() - 1; i++) // This has ok efficiency
	{
		Token t = env->Syntax.at(i);

		if (t.Identifier == OBJECT_ID_TOKEN)
		{
			if (!TargetSet) // Setting target
			{
				Target = t.Lexeme;
				TargetSet = true;
			}
			else // Is source
			{

			}
		}

		if (t.Identifier == ASSIGNEMENT_OPERATOR_TOKEN && !AssignSet)
		{
		//	std::cout << t.Lexeme << std::endl << std::endl;
			if (env->Syntax.at(i + 2).Identifier != ARITHMETIC_OPERATOR_TOKEN && !SourceSet)
			{
				if (env->Syntax.at(i + 1).Identifier == INTERGER_TOKEN)
				{
					Source = env->Syntax.at(i + 1).Lexeme;
					ConstantVal = true;
				}
				else if (env->Syntax.at(i + 1).Identifier == BOOLEAN_TOKEN)
				{
					std::string v = env->Syntax.at(i + 1).Lexeme;

					// Fun fact: In memory, true & false are 1 and 0, so you can actually do
					// bool: something = true
					// if(something == 1)... and it will work

					if (v.compare("true") == 0)
					{
						Source = "1";
					}
					else if (v.compare("false") == 0)
					{
						Source = "0";
					}

					ConstantVal = true;
				}
				else if(env->Syntax.at(i + 1).Identifier == OBJECT_ID_TOKEN)
				{
					Object Src;
					Src = env->ObjectList.at(Obj::FindByName(env->Syntax.at(i + 1).Lexeme,env->ObjectList));
					env->Text.append("mov eax, ").append("[").append(Output::Reg("bp-", env)).append(std::to_string(Src.Position)).append("] \n");
					Source = "eax";
				};
			}
			SourceSet = true;
		}

		if (t.Identifier == ARITHMETIC_OPERATOR_TOKEN)
		{
		//	std::cout<<std::to_string(std::stoi("100") / std::stoi("10"))<<std::endl;
			Source = Variable::Operation(i,env);
			SourceSet = true;
		}

		if (Failure)
		{
			break;
		}
		if (SourceSet && TargetSet && AssignSet)
		{
			break;
		}
	}

	if (!Failure)
	{
		int lPos = Obj::FindByName(Target, env->ObjectList); // position of local
		Object local;
		local = env->ObjectList.at(lPos);
		std::string output = "mov ";

		if (local.Size == 1) // Writing the approriate size
		{
			local.Position = env->Stack + 1;
			output.append("byte ");
		}
		else if (local.Size == 2)
		{
			local.Position = env->Stack + 2;
			output.append("word ");
		}
		else if (local.Size == 4)
		{
			local.Position = env->Stack + 4;
			output.append("dword ");

		}
		else if (local.Size == 8)
		{
			local.Position = env->Stack + 8;
			output.append("qword ");
		}

	/*	if (ConstantVal)
		{
			output.append(Source).append("\n");
		}
		else
		{
			output.append(" [").append("bp").append("+").append(std::to_string(local.Position)).append("],").append("ebp").append("\n");
		}
	*/

		output.append(" [").append(Output::Reg("bp",env)).append("-").append(std::to_string(local.Position)).append("],").append(Source).append("\n");
		env->ObjectList.at(lPos) = local;
		env->Stack = local.Position; // So the stack updates
		return output;
	}
	else
	{
		Log::Error::Custom("Variable couldn't be assigned");
		return "; Variable registering error here";
	}
}
