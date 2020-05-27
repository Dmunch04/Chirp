module dllvm.core.types.functions;

// Source: https://llvm.org/doxygen/group__LLVMCCoreTypeFunction.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Obtain a function type consisting of a specified signature
     +
     + The function is defined as a tuple of a return Type, a list of parameter types, and whether the function is variadic
     +/
    LLVMTypeRef LLVMFunctionType(LLVMTypeRef returnType, LLVMTypeRef* paramTypes, uint paramCount, LLVMBool isVarArg);

    /++
     + Returns whether a function type is variadic
     +/
    LLVMBool LLVMIsFunctionVarArg(LLVMTypeRef ty);

    /++
     + Obtain the Type this function Type returns
     +/
    LLVMTypeRef LLVMGetReturnType(LLVMTypeRef ty);

    /++
     + Obtain the number of parameters this function accepts
     +/
    uint LLVMCountParamTypes(LLVMTypeRef ty);

    /++
     + Obtain the types of a function's parameters
     +
     + The Dest parameter should point to a pre-allocated array of LLVMTypeRef at least LLVMCountParamTypes() large.
     + On return, the first LLVMCountParamTypes() entries in the array will be populated with LLVMTypeRef instances.
     +/
    void LLVMGetParamTypes(LLVMTypeRef ty, LLVMTypeRef *destination);
}