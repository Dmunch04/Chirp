# Parser documentation
Obviously, this is a compiler, so like in all compilers there is parser. This file will document how you should parse stuff,
I think. I'm gonna be honest, I haven't tought about it.

### ``class`` Keyword
The class keyword has stuff in it, I guess.

## Parsing order
``int: a = 1``
Let's see the order in which the parser should parse the code above.
First the words will be disjointed into seperate strings and put into a vector, the vector would look like this:
``int``   ``:``   ``a``   ``=``   ``1``
The process above will be executed by the function ``Parser::Parse()`` declared in the Parser.h file.
