#include "Debug.h"

#include <iostream>

namespace Debug
{
	void MakeMenu()
	{
		Menu UI;
		Page Main;
		Page Other;
		Button Back;
		Button Link;

		Link.Label = "Some link to somewhere";
		Back.Label = "Go back";

		Main.Text.at(0) = "Chirp Debug Menu";
		Main.Text.at(1) = "This menu is a bit overkill, but you can do stuff like looking at tokens";
		Main.Text.at(2) = "and someday add break points and $#1t";

		Other.Text.at(0) = "Other page";
		Other.Text.at(1) = "This is ok";

		Main.ButtonPos = 5;
		Other.ButtonPos = 5;

		Back.Destination = UI.Push(Main);
		Link.Destination = UI.Push(Other);

		Main.Buttons.push_back(Link);
		Other.Buttons.push_back(Back);

		UI.Edit(Other,Link.Destination); // This has nothing to do with the link, but it has the pos

		UI.Load(&Main);

		UI.Update();
		UI.Activate();

		while (true)
		{

		}
	}
}