module chirp.utils.input;

/++
 + Reads a file and returns its content.
 + Returns an empty string if the file doesn't exist or is a directory
 +/
public string readFile(string path)
{
    import std.file : exists, isDir, readText;

	if (exists(path) && !isDir(path))
    {
        return readText(path);
    }

    return "";
}