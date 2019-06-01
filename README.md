<p align = 'center'>
  <img src = 'https://camo.githubusercontent.com/641f171b8217bb22d5951086a25c7c7a037a106c/68747470733a2f2f63646e2e646973636f72646170702e636f6d2f6174746163686d656e74732f3530363135323839363631383935343831322f3538323035313338303737373435313534312f4368697270536d616c6c49636f6e2e706e67'>
</p>

# Fork Status
Currently I'm dealing with this error:
```
terminate called after throwing an instance of 'std::out_of_range'
  what():  vector::_M_range_check: __n (which is 1) >= this->size() (which is 1)
Aborted (core dumped)
```

Full console result:
```
Input file is: Test.ch
Output file is: Test.o
terminate called after throwing an instance of 'std::out_of_range'
  what():  vector::_M_range_check: __n (which is 1) >= this->size() (which is 1)
Aborted (core dumped)
```

The first two lines are printed in `Console/Commands.cpp`

# Chirp
A modern low-level programming language written in C++, to replace C++ and other old languages, but it's still pretty bad right now.

# Simple Example
```chirp
entry int start ()
{
  int: a = 123
}
```
As you can see this is weird.

# Build instructions

## Windows

There is currently no build tools for Windows, but you can build Chirp on any modern C++ compilers with only the Standard Library.

## Linux

It is very easy to build Chirp on linux, it only requires the G++ compiler. If you don't have it yet you can run this command:

```sh
sudo apt install g++
```

If you have done the steps above or already have the g++ compiler, you can run the commands under:

```sh
git clone https://github.com/binkiklou/chirp.git
cd Chirp/Tools/Build
make
```

And there you go, you just build Chirp. You can now either use the language or contribute to the developpement of it.
