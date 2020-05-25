module chirp.program;

import chirp.logging.logger;
import chirp.lexer.lexer;
import chirp : chirpVersion;

/++
 + The main class that handles the compilation of a file
 +/
class Program
{
    private {
        bool debugging = false;
        bool verbose = false;

        Logger logger = new Logger();
    }

    /++
     + Takes in the CLI arguments
     +/
    this(string[] args)
    {
        handleArgs(args[1..$]);
    }

    private void run(ref string source)
    {
        if (debugging)
        {
            import std.datetime.stopwatch : StopWatch, AutoStart;
            import std.conv : to;

            const auto timer = StopWatch(AutoStart.yes);

            Lexer lexer = new Lexer(source);

            logger.print("Finished compilation in " ~ timer.peek.total!"msecs".to!string ~ "ms");
        }
    }

    private void runFile(string path)
    {
        import chirp.utils.input : readFile;
        import std.file : exists, isDir;

        if (!exists(path))
	    {
		    logger.error("Path does not exist: " ~ path);
	    }

	    if (isDir(path))
	    {
		    logger.error("Path is a directory and not a file: " ~ path);
	    }

        logger.print("Compiling file '" ~ path ~ "'..");
        string contents = readFile(path);
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
            this.logger.error(e.msg);
        }

        if (printVersion)
        {
            this.logger.printExit("Chirp v" ~ chirpVersion);
        }

        if (args.length <= 0)
        {
            this.logger.error("No path given");
        }

        runFile(args[0]);
    }
}