## Importing
Chirps import system, is built on relativness. Every file you're in, you can import files relative to the current files path.

<br>

### Examples
#### Comparison - Python vs. Chirp
**Python**:

The way Python imports work, is it's relative to the "starter" files path. Example:
Project folder:
```
  Source:
  - Main.py
  - Helpers:
    - Helper.py
    - HelpersHelper.py
```
So in this example, the `Main.py` file, imports a function from `Helpers/Helper.py`, but `Helpers/Helper.py` imports a function from `Helpers/HelpersHelper.py`. But in order for `Helpers/Helper.py` to import from `Helpers/HelpersHelper.py`, it must use `from Helpers.HelpersHelper import HelperFunction`. Now that sucks. So instead of just being able to do `from HelpersHelper import HelperFunction`, it needs to import it from the Helpers folder.

**Chirp**:

The way Chirp imports work, is it's **always** relative to the current files path. Example:
Project folder:
```
  Source:
  - Main.ch
  - Helpers:
    - Helper.ch
    - HelpersHelper.ch
```
So in this example, the `Main.ch` file, imports a function from `Helpers/Helper.ch`, but `Helpers/Helper.ch` imports a function from `Helpers/HelpersHelper.ch`. Luckily, that's super easy. `Main.ch` will import like this: `import <Helpers.Helper>`, and `Helpers/Helper.ch` like this: `import <HelpersHelper>`. Easy as that.

<br>

### Conclusion
No matter in which folder you are, or in which file, you can always import relatively.
