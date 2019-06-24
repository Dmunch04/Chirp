#pragma once

#include <vector>
#include <string>
#include <stdexcept>

#include "Console/Log/Error.h"
#include "Token/Token.h"

/*
Node in tree class. The elements like parents and child aren't actual other nodes but
the location inside the Tree's Node vector.
*/
class Node
{
public:
	int ParentPos; // Position inside the Node Vector
	int SelfPos; // Position inside the node vector
	int PosInNode; // Position inside parent

	std::vector<int> ChildPos; // Positions of the childs inside the Node Vector

	Token Value;

//	int Token; // Pretty much the type
//	std::string Lexeme; // Not used most of the time but is really usefull in some cases
};

/*
Main class to create a tree
*/
class Tree
{
public:
	int StartPos; // Position of the start node
	std::vector<Node> NodeList;

	void MakeStart(Node*); // Makes the first node inside the tree

	void AddChild(int, Node*); // Adds node to other node at given position
	void AddChild(Node*, Node); // Adds node to other node with given node
	void SetChild(int,Node*); // Position of Node to link to, Node

	Node GetNode(int); // Returns the node at a specific positon

	Node FindNode(std::string); // Find a node in all the tree, with given Lexeme
	Node FindChild(Node*, std::string); // Find a child of node with given lexeme
};
