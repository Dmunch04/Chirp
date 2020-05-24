module chirp;

/++
 + The version of the compiler (major.minor.patch)
 +/
public string chirpVersion = "1.0.0";

public import chirp.ast;
public import chirp.compiler;
public import chirp.lexer;
public import chirp.logging;
public import chirp.parser;