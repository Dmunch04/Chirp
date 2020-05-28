module chirp.program;

import chirp.logging.logger;
import chirp.lexer.lexer;
import chirp : chirpVersion;
import chirp.logging.color : Color;

/++
 + The main class that handles the compilation of a file
 +/
// TODO: Make better logging system. Both for compilation errors, but also CLI errors
// TODO: Better memory management
class Program
{
    private {
        bool debugging = false;
        bool verbose = false;

        Logger logger = Logger();
    }

    /++
     + Takes in the CLI arguments
     +/
    this(string[] args)
    {
        handleArgs(args[1..$]);
    }

    private void run(string source)
    {
        if (debugging)
        {
            import std.datetime.stopwatch : StopWatch, AutoStart;
            import std.conv : to;

            const auto timer = StopWatch(AutoStart.yes);

            //Lexer lexer = new Lexer(source);
            Lexer lexer = Lexer(logger, "()[]{} ,...:::?!|@&$ +-->*/% ===<<=>>=");

            import chirp.lexer.token : TokenType;
            import std.conv : to;
            TokenType type = lexer.getNextType();
            while (type != TokenType.eof)
            {
                logger.print(type.to!string);
                type = lexer.getNextType();
            }

            logger.print("Finished compilation in " ~ timer.peek.total!"msecs".to!string ~ "ms");
        }
    }

    private void runFile(string path)
    {
        import chirp.utils.input : readFile;
        import std.file : exists, isDir;

        if (!exists(path))
	    {
		    logger.printExit(Color.boldRed ~ "Path does not exist: " ~ path);
	    }

	    if (isDir(path))
	    {
		    logger.printExit(Color.boldRed ~ "Path is a directory and not a file: " ~ path);
	    }

        logger.print("Compiling file '" ~ path ~ "'..");
        string contents = readFile(path);

        this.logger = Logger(path, contents);
        run(contents);
    }

    private void handleArgs(string[] args)
    {
        import std.getopt : getopt, defaultGetoptPrinter, GetOptException, config;

        bool printVersion = false;

        try
        {
            auto help = getopt(
                args,
                config.caseInsensitive,

                "version|v", "Prints the version of the compiler", &printVersion,
                "debug|d", "Should the compiler log extra information?", &debugging,
                "verbose", "Verbose mode", &verbose
            );

            if (help.helpWanted)
            {
                defaultGetoptPrinter("All available arguments:", help.options);
            }
        }
        // If an unkown argument was passed, error out
        catch (GetOptException e)
        {
            this.logger.printExit(Color.boldRed ~ e.msg);
        }

        if (printVersion)
        {
            this.logger.printExit("Chirp v" ~ chirpVersion);
        }

        if (args.length <= 0)
        {
            this.logger.printExit(Color.boldRed ~ "No path given");
        }

        runFile(args[0]);
    }
}