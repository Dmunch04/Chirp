module chirp.lexer.lexer;

import chirp.utils.memory;

import std.stdio;

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
    this(ref string source)
    {
        this.source = source;
        writeln(this.source);

        // TODO: How do we check to see if this actually works lol. In the `profilegc.log` it doesn't seem to take affect
        freeString(source);
        // TODO: Don't actually free this here. But is it even needed to free it?
        freeString(this.source);
    }
}