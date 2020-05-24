import std.stdio;

private string ver = "1.0.0";

private bool debugging = false;

// TODO: Make better CLI arg system
// TODO: Make better logging system -> colors are done
// TODO: Maybe make a like `Chirp class`, which holds the lexer, parser, compiler, logger, etc.
void main(string[] args)
{
	string[] arguments = args[1..$];
	string filePath = "";

	if (arguments.length == 0)
	{
		runRepl();
		return;
	}

	import std.algorithm : startsWith;
	foreach (arg; arguments)
	{
		if (arg.startsWith("--"))
		{
			switch (arg)
			{
				case "--version":
				{
					writeln("Chirp v" ~ ver);
					return;
				}

				case "--help":
				{
					writeln("Help message");
					return;
				}

				case "--debug":
				{
					debugging = true;
					break;
				}

				default:
				{
					writeln("Unkown command line argument: " ~ arg);
					return;
				}
			}
		}
		else
		{
			filePath = arg;
		}
	}

	if (filePath != "")
	{
		runFile(filePath);
	}
}

private void run(string input)
{
	if (debugging)
	{
		writeln(input);
	}
}

private void runRepl()
{

}

private void runFile(string path)
{
	import std.file : exists, isDir, readText;

	if (!exists(path))
	{
		writeln("Path does not exist: " ~ path);
		return;
	}

	if (isDir(path))
	{
		writeln("Path is a directory and not a file: " ~ path);
		return;
	}

	writeln("Compiling file '" ~ path ~ "'..");
	run(readText(path));
}
