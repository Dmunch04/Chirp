module dllvm.core.instructions.insert;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueInstructionInsertValue.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Obtain the number of indices.
     +
     + Note: This also works on GEP
     +/
    uint LLVMGetNumIndices(LLVMValueRef instruction);

    /++
     + Obtain the indices as an array
     +/
    const(uint*) LLVMGetIndices(LLVMValueRef instruction);
}