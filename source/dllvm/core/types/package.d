module dllvm.core.types;

public import dllvm.core.types.floating;
public import dllvm.core.types.functions;
public import dllvm.core.types.integer;
public import dllvm.core.types.other;
public import dllvm.core.types.sequential;
public import dllvm.core.types.structure;

// Source: https://llvm.org/doxygen/group__LLVMCCoreType.html

import dllvm.core.enums;
import dllvm.ctypes;

extern(C)
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
