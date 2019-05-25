# Parser documentation
Obviously, this is a compiler, so like in all compilers there is parser. This file will document how you should parse stuff,
I think. I'm gonna be honest, I haven't tought about it.

### ``class`` Statement
The class keyword has stuff in it, I guess.

## Parsing order
``int: a = 1``
Let's see the order in which the parser should parse the code above.
First the words will be disjointed into seperate strings and put into a vector, the vector would look like this:

``int``   ``:``   ``a``   ``=``   ``1``

The process above will be executed by the function ``Parser::Parse()`` declared in the Parser.h file. Then they will be
interpreted in ``Parsed::Classify`` which will classify the word into the ``Statement`` class, declared in the Parser.h header. After this, some function will loop trough every Statement classes of the ``Parsed::Classified`` vector then will rewrite the equivalent of the statement in assembly.

After this, the build scripts will be run, and then other adjustement may be made. After this process this might just give up an error or make a runnable executable file.

## Function parsing
Into the function parsing there is stuff, I guess. The statement has stuff in it. I guess, so in the statement there is a vector called ``args`` and the order of stuff in it goes like this.

``return value type``,``name``,``argument start position``,``argument end position``,``scope start position``,``scope stop position``

> nope nevermind let's not do what I did above
