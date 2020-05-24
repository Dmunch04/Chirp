module chirp.lexer.lexer;

/++
 + The lexer class turns the source code into a list of token objects
 +/
class Lexer
{
    private {
        string source;
    }

    /++
     + Takes in the source code to lex
     +/
    this(string source)
    {
        this.source = source;
    }
}