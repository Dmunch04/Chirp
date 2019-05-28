# Getting started with chirp
This isn't about the source code, this documentation is for the programming language.

## Basic code
So let's get started with basic code, below is some basic code with C++:
``` cpp
#include <iostream>

int main()
{
	std::cout<<"This works!"<<std::endl;
	return 0;
}
```
Now with Chirp the code above would look like this


```chirp
import <io>
 
entry int start()
{
	print("This works!")
}
```

> The code above isn't working yet, it will be soon.

The Chirp code is weird but has some use to it. Such as the entry keyword which make it so any function can be the entry point. 

## Variables
Chirp like any other programming language has variales. In chirp the variables have 4 types, ``int``,``float``,``char`` and ``string``.
```chirp
int: a = 13
```
As you can see, the code above is **weird**, but I like it.'

Unlike in C/C++ strings are  natives and don't have to be imported, this is demonstrated in the code below.
```chirp
string: name = "Maxence"
```

## Inner
The inner keyword is used to write assembly inside Chirp code. It is pretty weird, but I guess you could do cool stuff with it.

```chirp
inner
{
	number DW 1234
}
```

> The inner statement is not supported yet. It will like in 1-3 days
