import std.stdio;

import chirp.program;
import dllvm;
import std.stdio;

// TODO: Fix generated docs
// TODO: Turns out you don't need to name params in extern functions. oof

struct Lexer
{
	ulong a = 0;
}

void lex(ref Lexer lexer, string source)
{
	if (lexer.a == 0)
	{
		lexer.a = source.length;
	}
}

void main(string[] args)
{
	//Program program = new Program(args);

	writeln(dllvm.LLVMVoidType());

	Lexer lexer = Lexer();
	lexer.lex("aaa");
	writeln(lexer.a);
}