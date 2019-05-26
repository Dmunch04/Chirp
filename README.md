<p align="center">
  <img src="https://camo.githubusercontent.com/641f171b8217bb22d5951086a25c7c7a037a106c/68747470733a2f2f63646e2e646973636f72646170702e636f6d2f6174746163686d656e74732f3530363135323839363631383935343831322f3538323035313338303737373435313534312f4368697270536d616c6c49636f6e2e706e67">
 </p>
 
# Chirp
A modern low-level programming language written in C++, to replace C++ and other old languages, but it's still pretty bad right now.

# Simple Example
```chirp
int start()
{
int: a
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
cd chirp/tools/build
make
```

and there you go, you just build Chirp. You can now either use the language or contribute to the developpement of it.
