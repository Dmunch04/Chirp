## Get Started

Here's a guide, on how to quickly get started using Chirp!

<br>

### Install

**Windows:**

Just run it

**Linux:**

*For more help building, check out Build.md*

To install Chirp on Linux, simply execute the commands below. This should make an executable: **chirp**.
```bash
  git clone https://github.com/binkiklou/Chirp.git
  cd Chirp/Tools/Build
  make
```

> If you want to use the Chirp compiler globally, just add it to your **$PATH**

<br>

### Syntax highlighting

Coding is way better and more fun when using syntax highlighting. It also helps readability. We've created some packages to different editors, to add Chirp syntax highlighting:
- [Visual Studio Code] (https://github.com/binkiklou/Chirp-vscode-extension)
- [Atom] (https://github.com/Dmunch04/AtomChirpLanguage) - TO COME!

<br>

### Command line

Commands are to come!

<br>

### Simple program

This is a very simple **Hello World** program, written in Chirp:
```chirp
import <io>

entry int start ()
{
  print ("Hello, World!")
}
```
