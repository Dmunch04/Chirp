module chirp.logging.logger;

import chirp.logging.color : Color;

import std.stdio : writeln;
import core.stdc.stdlib : exit;

/++
 + The main logger
 +/
class Logger
{
    /++
     + Print a plain message to the console
     +/
    void print(string msg)
    {
        writeln(msg);
    }

    /++
     + Print a plain message to the console and exit
     +/
    void printExit(string msg)
    {
        print(msg);
        exit(0);
    }

    /++
     + Print and error to the console and exit
     +/
    // TODO: Fix that for some reason bold colors doesn't work
    void error(string msg)
    {
        print(Color.boldRed ~ "[ERROR] " ~ Color.red ~ msg);
        exit(-1);
    }
}