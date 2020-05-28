module chirp.lexer.token;

import chirp.lexer.location;

/++
 + All possible token types
 +/
enum TokenType : ubyte
{
    leftParen = 0,
    rightParen,
    leftBracket,
    rightBracket,
    leftBrace,
    rightBrace,

    comma = 10,
    dot,
    colon,
    question,
    bang,
    pipe,
    at,
    ampersand,
    dollar,

    plus = 20,
    dash,
    star,
    slash,
    modulo,

    equal = 30,
    equalEqual,
    lessThan,
    lessEqual,
    greaterThan,
    greaterEqual,

    arrow = 40,
    colonColon,
    dotDot,

    identifier = 50,
    stringLiteral,
    integerLiteral,
    longLiteral,
    floatLiteral,

    // TODO: Other naming convention?
    _string = 60,
    integer,
    _long,
    _float,
    _import,
    _if,

    newline = 97,
    unknown = 98,
    eof = 99
}

/++
 + Struct holding information about a token
 +/
struct Token
{
    /++
     + The type of the token
     +/
    TokenType type;

    /++
     + The position of the token
     +/
    Location position;

    /++
     + The tokens lexeme
     +/
    string lexeme;

    /++
     + The tokens literal, if it has any
     +/
    // TODO: Should this be a string? It would really be like `Object` or `any`
    string literal = "";
}

string toString(ref TokenType type)
{
    import std.conv : to;
    return type.to!string;
}

string toString(ref Token token)
{
    import std.conv : to;
    return token.type.toString() ~ "'" ~ token.lexeme ~ "'";
}