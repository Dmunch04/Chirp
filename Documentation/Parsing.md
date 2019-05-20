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

The process above will be executed by the function ``Parser::Parse()`` declared in the Parser.h file. Then they will be
interpreted in ``Parsed::Classify`` which will classify the word into the ``Statement`` class, declared in the Parser.h header. After this, some function will loop trough every Statement classes of the ``Parsed::Classified`` vector then will rewrite the equivalent of the statement in assembly.

After this, the build scripts will be run, and then other adjustement may be made. After this process this might just give up an error or make a runnable executable file.
