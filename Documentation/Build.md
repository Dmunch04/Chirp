# Build instructions

## Windows

There is currently no build tools for Windows, but you can build Chirp on any modern C++ compilers with only the Standard Library.

## Linux

It is very easy to build Chirp on linux. It only requires the G++ compiler and nasm. If you don't have it yet you can run this command:

```sh
  sudo apt install g++
  sudo apt install nasm
```

If you have done the steps above or already have the g++ compiler and nasm, you can run the commands under:

```sh
  git clone https://github.com/binkiklou/Chirp.git
  cd Chirp/Tools/Build
  make
```

And there you go, you just build Chirp. You can now either use the language or contribute to the developpement of it.
