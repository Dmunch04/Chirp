#pragma once

#include "Keyboard.h"

#include <vector>
#include <string>

#define UP 1
#define DOWN 0

class Button
{
	public:
		std::string Label;
		int Destination; // Position inside the buffer vector
};

class Page
{
	public:
		Page ();

		int PosInVector; // Position in the vector index
		int ButtonPos; // Position of the first button on the page

		std::vector<std::string> Text;
		std::vector<Button> Buttons;
};


class Menu
{
	public:
		Menu ();
		void Init ();
		void Update ();
		void Activate (); // Stats the update loop

		void Write (std::string);
		void Write (int, int, std::string);

		int  Push (Page); // Push a page, also returns the position
		void Load( Page*);
		void Edit (Page, int);

		int CursorPos; // Cursor of button
		Page* Current;

		std::vector<std::string> Buffer;
		std::vector<Page> Index; // Not the index page, but like idk
};
