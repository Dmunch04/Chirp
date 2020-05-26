module dllvm.core.types;

// Source: https://llvm.org/doxygen/group__LLVMCCoreType.html

import dllvm.core.enums;
import dllvm.ctypes;

extern (C)
{
    /++
     +
     +/
    LLVMTypeKind LLVMGetTypeKind(LLVMTypeRef ty);
}