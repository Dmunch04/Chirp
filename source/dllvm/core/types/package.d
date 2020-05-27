module dllvm.core.types;

public import dllvm.core.types.integer;

// Source: https://llvm.org/doxygen/group__LLVMCCoreType.html

import dllvm.core.enums;
import dllvm.ctypes;

extern (C)
{
    /++
     +
     +/
    LLVMTypeKind LLVMGetTypeKind(LLVMTypeRef ty);

    /++
     +
     +/
    LLVMBool LLVMTypeIsSized(LLVMTypeRef ty);

    /++
     +
     +/
    LLVMContextRef LLVMGetTypeContext(LLVMTypeRef ty);

    /++
     +
     +/
    void LLVMDumpType(LLVMTypeRef value);

    /++
     +
     +/
    char* LLVMPrintTypeToString(LLVMTypeRef value);
}