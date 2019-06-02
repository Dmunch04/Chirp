## Build File

Here's the instructions for building Chirp scripts. Currently there's been written for:
- Windows
- Linux

<br>

### Windows:
  Clone the repo

  Add:

    - Chirp.exe

    - nasm.exe

    - ld.exe

  Into `Tools/Build`.

  Then cd into Chirp/Tools/Build (`cd Chirp/Tools/Build`).

  Then create your chirp file in this folder.

  Open cmd for this folder, and type in:

  `Chirp -i %Filename%.ch -o %Outputname%.exe`

<br>

### Linux:
  Install:

    - nasm (`sudo apt install nasm`)

    - g++ (`sudo apt install g++`)

  Then clone the repo with opening the terminal and typing:

  `git clone https://github.com/binkiklou/Chirp.git`

  Then cd into Chirp/Tools/Build (`cd Chirp/Tools/Build`).

  Then type

  `make`

  into the terminal.

  Then create your chirp file in this folder.

  While in this folder in terminal, type this in:

  `./Chirp.o -i %Filename%.ch -o %Outputname%.o`
