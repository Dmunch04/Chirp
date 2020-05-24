module chirp.logging.color;

/++
 + An enum of ANSI color codes
 +/
enum Color : string
{
    reset = "\u001b[0m",
    clear = reset,

    bold = "\u001b[1m",
    underline = "\u001b[4m",
    reversed = "\u001b[7m",

    black = "\u001b[30m",
    boldBlack = "\u001b[30m;1m",
    red = "\u001b[31m",
    boldRed = "\u001b[31m;1m",
    green = "\u001b[32m",
    boldGreen = "\u001b[32m;1m",
    yellow = "\u001b[33m",
    boldYellow = "\u001b[33m;1m",
    blue = "\u001b[34m",
    boldBlue = "\u001b[34m;1m",
    purple = "\u001b[35m",
    boldPurple = "\u001b[35m;1m",
    cyan = "\u001b[36m",
    boldCyan = "\u001b[36m;1m",
    white = "\u001b[37m",
    boldWhite = "\u001b[37m;1m"
}

/++
 + Returns the ANSI color code of a 256 color
 +/
string make256Color(int index)
{
    import std.conv : to;
    return "\u001b[38;5;" ~ index.to!string ~ "m";
}