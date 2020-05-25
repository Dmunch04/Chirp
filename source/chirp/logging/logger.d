module chirp.logging.logger;

import chirp.logging.color;
import chirp.lexer.token : Token;

import std.stdio : writeln;
import core.stdc.stdlib : exit;

/++
 +
 +/
enum ErrorType : string
{
    unexpectedToken = "Unexpected-Token",
    unterminatedString = "Unterminated-String"
}

/++
 +
 +/
struct Error
{
    /++
     +
     +/
    string message;

    /++
     +
     +/
    ErrorType type;

    /++
     +
     +/
    Token token;
}

/++
 + The main logger
 +/
struct Logger
{

    /++
     + The current files name
     +/
    string filename = "";

    /++
     + The file contents of the current file
     +/
    string contents = "";

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
    void error(Error error)
    {
        import std.conv : to;

        string color = make256Color(60);

        //print(Color.boldRed ~ "[ERROR] " ~ Color.reset ~ Color.red ~ error.message);
        print(
            Color.boldRed ~ Color.underline ~ error.type ~ Color.reset ~ "\n\n\t" ~
            error.message ~ "\n\t" ~
            color ~ filename ~ ":" ~ error.token.position.startLine.to!string ~ "\n\n\t" ~
            color ~ error.token.position.startLine.to!string ~ Color.reset ~ " | " ~ error.token.lexeme
        );
        exit(-1);
    }
}