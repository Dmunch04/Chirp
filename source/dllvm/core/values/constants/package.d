module dllvm.core.values.constants;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueConstant.html

public import dllvm.core.values.constants.global;
public import dllvm.core.values.constants.composite;
public import dllvm.core.values.constants.expressions;
public import dllvm.core.values.constants.functions;
public import dllvm.core.values.constants.scalar;

import dllvm.ctypes;

extern(C)
{
    /++
     + Obtain a constant value referring to the null instance of a type
     +/
    LLVMValueRef LLVMConstNull(LLVMTypeRef ty);

    /++
     + Obtain a constant value referring to the instance of a type consisting of all ones
     +
     + This is only valid for integer types
     +/
    LLVMValueRef LLVMConstAllOnes(LLVMTypeRef ty);

    /++
     + Obtain a constant value referring to an undefined value of a type
     +/
    LLVMValueRef LLVMGetUndef(LLVMTypeRef ty);

    /++
     + Determine whether a value instance is null
     +/
    LLVMBool LLVMIsNull(LLVMValueRef value);

    /++
     + Obtain a constant that is a constant pointer pointing to `null` for a specified type
     +/
    LLVMValueRef LLVMConstPointerNull(LLVMTypeRef ty);
}