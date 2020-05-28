module dllvm.core.instructions.allocas;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueInstructionAlloca.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Obtain the type that is being allocated by the alloca instruction
     +/
    LLVMTypeRef LLVMGetAllocatedType(LLVMValueRef alloca);
}