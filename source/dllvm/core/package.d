module dllvm.core;

// Source: https://llvm.org/doxygen/group__LLVMCCore.html

public import dllvm.core.instructions;
public import dllvm.core.types;
public import dllvm.core.values;
public import dllvm.core.basicBlock;
public import dllvm.core.contexts;
public import dllvm.core.enums;
public import dllvm.core.metadata;
public import dllvm.core.modules;

import dllvm.ctypes;

extern(C)
{
    char* LLVMCreateMessage(const(char*) message);

    void LLVMDisposeMessage(char* message);

    void LLVMInitializeCore(LLVMPassRegistryRef r);

    /++
     + Deallocate and destroy all ManagedStatic variables.
     +/
    void LLVMShutdown();
}