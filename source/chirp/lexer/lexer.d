module chirp.lexer.lexer;

import chirp.lexer.token;
import chirp.lexer.location;
import chirp.logging.logger;

import std.stdio;

/++
 + The lexer turns the source code into tokens
 +/
struct Lexer
{
    private Logger logger;

    private string source;
    private uint position = 0;
    private Token currentToken = Token(TokenType.eof, Location(0, 0, 0, 0), "", null);

    /++
     + Takes in the global logger and the input code to lex
     +/
    this(Logger logger, string source)
    {
        this.logger = logger;
        this.source = source;
    }
}

TokenType getNextType(ref Lexer lexer)
{
    const(char) c = lexer.advance();
    switch (c)
    {
        case '(': return TokenType.leftParen;
        case ')': return TokenType.rightParen;
        case '[': return TokenType.leftBracket;
        case ']': return TokenType.rightBracket;
        case '{': return TokenType.leftBrace;
        case '}': return TokenType.rightBrace;

        case ',': return TokenType.comma;
        case '.':
        {
            if (lexer.match('.')) return TokenType.dotDot;
            else return TokenType.dot;
        }
        case ':':
        {
            if (lexer.match(':')) return TokenType.colonColon;
            else return TokenType.colon;
        }
        case '?': return TokenType.question;
        case '!': return TokenType.bang;
        case '|': return TokenType.pipe;
        case '@': return TokenType.at;
        case '&': return TokenType.ampersand;
        case '$': return TokenType.dollar;

        case '+': return TokenType.plus;
        case '-':
        {
            if (lexer.match('>')) return TokenType.arrow;
            else return TokenType.dash;
        }
        case '*': return TokenType.star;
        case '/': return TokenType.slash;
        case '%': return TokenType.modulo;

        case '=':
        {
            if (lexer.match('=')) return TokenType.equalEqual;
            else return TokenType.equal;
        }
        case '<':
        {
            if (lexer.match('=')) return TokenType.lessEqual;
            else return TokenType.lessThan;
        }
        case '>':
        {
            if (lexer.match('=')) return TokenType.greaterEqual;
            else return TokenType.greaterThan;
        }

        case '\n': return TokenType.newline;
        case '\0': return TokenType.eof;

        default:
        {
            // TODO: Maybe not the best handling?
            if (isWhitespace(c))
            {
                lexer.advance();
                if (lexer.atEnd) return TokenType.eof;
                else return lexer.getNextType();
            }
            else
            {
                // error
                return TokenType.unknown;
            }
        }
    }

    assert(0);
}

private char advance(ref Lexer lexer)
{
    if (lexer.atEnd) return '\0';
    return lexer.source[lexer.position++];
}

private bool match(ref Lexer lexer, char c)
{
    if (lexer.peek == c)
    {
        lexer.advance();
        return true;
    }

    return false;
}

private bool isWhitespace(char c)
{
    return (c == ' ' || c == '\t' || c == '\r');
}

@property private char peek(ref Lexer lexer)
{
    if (lexer.atEnd) return '\0';
    return lexer.source[lexer.position];
}

@property private bool atEnd(ref Lexer lexer)
{
    return lexer.position >= lexer.source.length;
}

unittest
{
    import std.conv : to;

    string source = "()[]{} ,...:::?!|@&$ +-->*/% ===<<=>>=";
    Lexer lexer = Lexer(Logger("TEST", source), source);
    TokenType type = lexer.getNextType();
    while (type != TokenType.eof)
    {
        lexer.logger.print(type.to!string);
        type = lexer.getNextType();
    }
}

/++
 + The lexer class turns the source code into a list of token objects
 +/
/*
class Lexer
{
    private {
        Logger logger;

        string source;
        uint position;
        Token currentToken;
    }

    /++
     + Takes in the source code to lex
     +/
    this(Logger logger, string source)
    {
        this.logger = logger;
        this.source = source;
        this.position = 0;
        this.currentToken = Token(TokenType.eof, Location(0, 0, 0, 0), "", null);
    }

    /++
     +
     +/
    TokenType getNextType()
    {
        const(char) c = advance();
        switch (c)
        {
            case '(': return TokenType.leftParen;
            case ')': return TokenType.rightParen;
            case '[': return TokenType.leftBracket;
            case ']': return TokenType.rightBracket;
            case '{': return TokenType.leftBrace;
            case '}': return TokenType.rightBrace;

            case ',': return TokenType.comma;
            case '.':
            {
                if (match('.')) return TokenType.dotDot;
                else return TokenType.dot;
            }
            case ':':
            {
                if (match(':')) return TokenType.colonColon;
                else return TokenType.colon;
            }
            case '?': return TokenType.question;
            case '!': return TokenType.bang;
            case '|': return TokenType.pipe;
            case '@': return TokenType.at;
            case '&': return TokenType.ampersand;
            case '$': return TokenType.dollar;

            case '+': return TokenType.plus;
            case '-':
            {
                if (match('>')) return TokenType.arrow;
                else return TokenType.dash;
            }
            case '*': return TokenType.star;
            case '/': return TokenType.slash;
            case '%': return TokenType.modulo;

            case '=':
            {
                if (match('=')) return TokenType.equalEqual;
                else return TokenType.equal;
            }
            case '<':
            {
                if (match('=')) return TokenType.lessEqual;
                else return TokenType.lessThan;
            }
            case '>':
            {
                if (match('=')) return TokenType.greaterEqual;
                else return TokenType.greaterThan;
            }

            case '\n': return TokenType.newline;
            case '\0': return TokenType.eof;

            default:
            {
                // TODO: Maybe not the best handling?
                if (isWhitespace(c))
                {
                    advance();
                    if (atEnd) return TokenType.eof;
                    else return getNextType();
                }
                else
                {
                    // error
                    return TokenType.unknown;
                }
            }
        }

        assert(0);
    }

    private char advance()
    {
        if (atEnd()) return '\0';
        return source[position++];
    }

    private bool match(char c)
    {
        if (peek == c)
        {
            advance();
            return true;
        }

        return false;
    }

    private bool isWhitespace(char c)
    {
        return (c == ' ' || c == '\t' || c == '\r');
    }

    @property private char peek()
    {
        if (atEnd) return '\0';
        return source[position];
    }

    @property private bool atEnd()
    {
        return position >= source.length;
    }
}
*/