#include "Tree.h"
#include <iostream>

void Tree::MakeStart(Node* n)
{
	int yeet = this->NodeList.size(); // Maybe I should name it better
	n->SelfPos = yeet;
	this->NodeList.push_back(*n);
	this->StartPos = yeet;
}

void Tree::AddChild(int pos, Node* n)
{
	try
	{
		int yeet = this->NodeList.size();
		n->SelfPos = yeet;
		n->ParentPos = pos;
		n->PosInNode = this->NodeList.at(pos).ChildPos.size();
		this->NodeList.at(pos).ChildPos.push_back(yeet);
		this->NodeList.push_back(*n);
	}
	catch (std::out_of_range)
	{
		Log::Error::Custom("Couldn't find Node to add Child to, on the tree.");
	}
}

void Tree::AddChild(Node* p, Node n) // p is for parent, n for node
{

}

void Tree::SetChild(int pos, Node* n)
{
	try
	{
		n->ParentPos = pos;
		this->NodeList.at(pos).ChildPos.push_back(n->SelfPos);
	}
	catch (std::out_of_range)
	{
		Log::Error::Custom("Couldn't set Node as a child");
	}
}

Node Tree::FindNode(std::string lexeme)
{
	Node n;

	return n;
}


Node Tree::FindChild(Node* node, std::string lexeme)
{
	Node n;

	return n;
}

Node Tree::GetNode(int pos)
{
	Node n;

	try
	{
		n = this->NodeList.at(pos);
	}
	catch (std::out_of_range)
	{
		Log::Error::Custom("Couldn't find node at given position.");
	}

	return n;
}