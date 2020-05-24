module chirp.lexer.location;

/++
 + Struct holding information about a tokens position in the source code
 +/
struct Location
{
    /++
     + The line the first part of the token is seen on
     +/
    int startLine;

    /++
     + The line the last part of the token is seen on
     +/
    int endLine;

    /++
     + The tokens column start
     +/
    int startCol;

    /++
     + The tokens column end
     +/
    int endCol;
}