# Using the Chirp Compiler Command line
Like every other compilers, Chirp has a command line and it is used
to compile code. Unlike other compilers, it isn't written by someone that knows what he is doing.

<br>

##  Basic Compiling
This is the command you will be most likely typing most of the time, it is
pretty simple and works on all mainstream OS.

```
  Chirp main.ch -o main.exe
```

As you can see, I ran this on windows because it's outputing to an exe file, but you can use it on linux with this simple
modification ``-o main.o``, boom your mind is blown right.

Right now, the only working and designed arguments are the following with examples:

```
  -o file.exe
```
```
  -i file.ch
```

> Currently only one input file can be specified

That's it. If you think more files are required you can change it, the code is open source.
