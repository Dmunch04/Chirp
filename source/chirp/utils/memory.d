module chirp.utils.memory;

/++
 +
 +/
void freeString(ref string s)
{
    import core.stdc.stdlib : free;
    import core.memory : GC;
    import std.experimental.allocator : theAllocator, make, dispose;

    destroy(s);
    GC.removeRange(cast(void*) s);
    free(cast(void*) s);
}