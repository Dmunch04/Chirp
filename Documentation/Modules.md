# Chirp Modules
## Modules

There's module support in Chirp. You can create your own, and then share them with everyone, using [GravPack](https://github.com/Dmunch04/GravPack)!

<br><br>

### Built-in modules

In Chirp, we've created some built-in modules. This means, when you install the language, these gets installed. Here are the built-in modules:
- io
- eve
- json
- math

> None of these modules actually work yet. They'll be soon though, so stick around!

**io:**

Something about the io module.

Import with:
```chirp
import <math>
```

Functions:

| Function | Args | Explanation | Example |
| --- | --- | --- | --- |
| print | ToPrint | It prints out the given arg to the console | print ("Hello, World!") |
| read | File | Returns the contents of the given file (path) | read ("path/to/file.txt") |
| write | Contents, File, Type = w | It writes the `Contents` to the given file (path). It does it by type: `w = write (overwrite whole file)` or `a = append (appends to the bottom)` | write ("Hello, World!", "path/to/file.txt", "a") |

<br>

**eve:**

A lightweight data-interchange format. You can read more here: [EvePy](https://github.com/Dmunch04/EVEPY)

Import with:
```chirp
import <eve>
```

Functions:

| Function | Args | Explanation | Example |
| --- | --- | --- | --- |
| load | File | It takes in an eve file (path), and returns a dict or list of it's variables | load ("path/to/file.eve") |
| loads | Data | It takes in a string of Eve data. It returns a dict or list of it's variables | loads ("[\n  'MyVar' :: 5\n];") |

<br>

**json:**

You probably already know what json is. If not, read more about it here: [JSON](https://www.json.org/)

Import with:
```chirp
import <json>
```

Functions:

| Function | Args | Explanation | Example |
| --- | --- | --- | --- |
| load | File | It takes in an eve file (path), and returns a dict of it's variables | load ("path/to/file.json") |
| loads | Data | It takes in a string of Eve data. It returns a dict of it's variables | loads ('{"MyVar": 5}') |

<br>

**math:**

Math is a very useful module in Chirp. It helps you do a lot of calculation and gives you access to useful variables and functions.

Import with:
```chirp
import <math>
```

Functions:

| Function | Args | Explanation | Example |
| --- | --- | --- | --- |
| eval | Equation | It calculates the given string. It needs to be a valid equation | eval ("5 * (1 + 2)") |
| ceil | x | Return the ceiling of `x`, the smallest integer greater than or equal to `x` | ceil (10) |
| factorial | x | Return `x` factorial as an integer | factorial (10) |
| floor | x | Return the floor of `x`, the largest integer less than or equal to `x` | floor (10) |
| power | x | Return `x` raised to the power `y` | power (10, 5) |
| square | x | Return the square root of `x` | square (10) |
| cos | x | Return the cosine of `x` radians | cos (10) |
| sin | x | Return the sine of `x` radians | square (10) |

Variables:

| Variable | Value | Explanation |
| --- | --- | --- |
| pi | 3.141592… | The mathematical constant `π = 3.141592…`, to available precision | square (10) |
| e | 2.718281… | The mathematical constant `e = 2.718281…`, to available precision | square (10) |
