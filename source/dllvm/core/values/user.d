module dllvm.core.values.user;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueUser.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Obtain an operand at a specific index in a `llvm::User` value
     +/
    LLVMValueRef LLVMGetOperand(LLVMValueRef value, uint index);

    /++
     + Obtain the use of an operand at a specific index in a `llvm::User` value
     +/
    LLVMUseRef LLVMGetOperandUse(LLVMValueRef value, uint index);

    /++
     + Set an operand at a specific index in a `llvm::User` value
     +/
    void LLVMSetOperand(LLVMValueRef user, uint index, LLVMValueRef value);

    /++
     + Obtain the number of operands in a llvm::User value
     +/
    int LLVMGetNumOperands(LLVMValueRef value);
}