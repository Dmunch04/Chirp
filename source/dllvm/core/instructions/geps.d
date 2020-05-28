module dllvm.core.instructions.geps;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueInstructionGetElementPointer.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Check whether the given GEP instruction is inbounds
     +/
    LLVMBool LLVMIsInBounds(LLVMValueRef gep);

    /++
     + Set the given GEP instruction to be inbounds or not
     +/
    void LLVMSetIsInBounds(LLVMValueRef gep, LLVMBool inBounds);
}