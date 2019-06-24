#include "Menu.h"

#include <iostream>
#include <stdexcept>



//===PAGE
Page::Page()
{
	std::string blank;

	for (int i = 0; i < 120; i++)
	{
		blank.append(1, ' ');
	}

	for (int i = 0; i < 30; i++)
	{
		this->Text.push_back(blank);
	}
}

//===MENU
Menu::Menu()
{
	std::string blank;

#ifdef _WIN32
	std::system("mode con:cols=120 lines=30");
#endif

	for (int i = 0; i < 120; i++)
	{
		blank.append(1, ' ');
	}

	for (int i = 0; i < 30; i++)
	{
		Buffer.push_back(blank);
	}

	CursorPos = 0;
}

void Menu::Init()
{
	std::string blank;

#ifdef _WIN32
	std::system("mode con:cols=120 lines=30");
#endif

	for (int i = 0; i < 120; i++)
	{
		blank.append(1, ' ');
	}

	for (int i = 0; i < 30; i++)
	{
		Buffer.push_back(blank);
	}
}

void Menu::Write(std::string txt)
{
	this->Buffer.at(0) = txt;
}

void Menu::Write(int x, int y, std::string txt)
{
	this->Buffer.at(y).replace(x, txt.size(), txt);
}


void Menu::Update()
{
	// === INPUT
	// This used to be in "activate" but I moved it here, and it fixed everything. Like it took me 3 hours wtf
	// it wasn't supposed to be that hard.
	// I would call it "tricky" thought

	int key = Key::Get();

	if (key == 72) // Up arrow
	{
		if (CursorPos > 0)
		{
			CursorPos--;
		}
		else if (CursorPos == 0) // ok so fun fact: because the code above will sub by 1, you need to have this as a else
		{
			CursorPos = this->Current->Buttons.size() - 1;
		}
	}
	if (key == 80) // Down arrow
	{
		if (CursorPos < this->Current->Buttons.size() - 1)
		{
			CursorPos++;
		}
		else if (CursorPos == this->Current->Buttons.size() - 1)
		{
			CursorPos = 0;
		}
	}
	if (key == 32) // Space
	{
		try
		{
			Load(&Index.at(this->Current->Buttons.at(CursorPos).Destination));
		}
		catch (std::out_of_range)
		{
			Write(0, 20, "Cannot load, link's destination");
		}
	}
	// === DRAW
	int pos = 0;
	int bPos = this->Current->ButtonPos;

	for (auto& button : this->Current->Buttons)
	{
		this->Write(1, bPos + pos, button.Label);

		if (pos == this->CursorPos)
		{
			this->Write(0, bPos + CursorPos, ">");
		}
		else
		{
			this->Write(0, bPos + pos, " ");
		}

		pos++;
	}

	int Txtpos = 0;
	for (auto& txt : this->Buffer)
	{
		std::cout << txt << std::endl;
	}
}

void Menu::Activate()
{
	CursorPos = 0;

	while (true)
	{
		Update();
	}
}

int Menu::Push(Page p)
{
	p.PosInVector = Index.size();
	Index.push_back(p);
	return Index.size() - 1;
}

void Menu::Load(Page* p)
{
	int pos = 0;

	this->Current = p;

	for (auto& txt : p->Text)
	{
		pos++;
		try
		{
			this->Buffer.at(pos) = txt;
		}
		catch (...)
		{
			// This is bad, but this is bad
			std::cout << "Handled exception" << std::endl;
		}
	}
}

void Menu::Edit(Page n, int pos) // n for new, o for old
{
	Page old = this->Index.at(pos);
	this->Index.at(pos) = n;
}