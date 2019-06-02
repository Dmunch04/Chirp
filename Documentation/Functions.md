## Functions

*About functions*

**Define:**

You define a function with:
```chirp
  int MyFunction ()
  {
    int: Test = 1
  }
```

**Call:**

You call a function like so many other languages:
```chirp
  MyFunction ()
```
> You can ofc. give args in the `()`

<br>

### Examples
Here's a simple example:
```chirp
  int Add (x, y)
  {
    return x + y
  }

  entry int start ()
  {
    int: result = Add (1, 2)
  }
```
