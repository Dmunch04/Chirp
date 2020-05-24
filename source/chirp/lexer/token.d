module chirp.lexer.token;

import chirp.lexer.location;

/++
 + All possible token types
 +/
enum TokenType
{
    leftParen,
    rightParen,
    leftBracket,
    rightBracket,
    leftBrace,
    rightBrace,

    comma,
    dot,
    colon,
    question,
    bang,
    pipe,
    at,
    ampersand,
    dollar,

    plus,
    dash,
    star,
    slash,

    equal,
    equalEqual,
    lessThan,
    lessEqual,
    greaterThan,
    greaterEqual,

    arrow,
    colonColon,
    dotDot,

    identifier,
    // TODO: Hmm
    stringLiteral,
    integerLiteral,
    longLiteral,
    floatLiteral,

    // TODO: Other naming convention?
    _string,
    integer,
    _long,
    _float,
    _import,
    _if,
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