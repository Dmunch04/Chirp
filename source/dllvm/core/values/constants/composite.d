module dllvm.core.values.constants.composite;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueConstantComposite.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Create a `ConstantDataSequential` and initialize it with a string
     +/
    LLVMValueRef LLVMConstStringInContext(LLVMContextRef ctx, const(char*) str, uint length, LLVMBool dontNullTerminate);

    /++
     + Create a `ConstantDataSequential` with string content in the global context
     +
     + This is the same as `LLVMConstStringInContext` except it operates on the global context
     +/
    LLVMValueRef LLVMConstString(const(char*) str, uint length, LLVMBool dontNullTerminate);

    /++
     + Returns true if the specified constant is an array of i8
     +/
    LLVMBool LLVMIsConstantString(LLVMValueRef value);

    /++
     + Get the given constant data sequential as a string
     +/
    const(char*) LLVMGetAsString(LLVMValueRef value, size_t length);

    /++
     + Create an anonymous ConstantStruct with the specified values
     +/
    LLVMValueRef LLVMConstStructInContext(LLVMContextRef ctx, LLVMValueRef* value, uint count, LLVMBool packed);

    /++
     + Create a `ConstantStruct` in the global Context.
     +
     + This is the same as `LLVMConstStructInContext` except it operates on the global Context
     +/
    LLVMValueRef LLVMConstStruct(LLVMValueRef* value, uint count, LLVMBool packed);

    /++
     + Create a `ConstantArray` from values
     +/
    LLVMValueRef LLVMConstArray(LLVMTypeRef elementType, LLVMValueRef* value, uint length);

    /++
     + Create a non-anonymous `ConstantStruct` from values
     +/
    LLVMValueRef LLVMConstNamedStruct(LLVMTypeRef structType, LLVMValueRef* value, uint count);

    /++
     + Get an element at specified index as a constant
     +/
    LLVMValueRef LLVMGetElementAsConstant(LLVMValueRef value, uint index);

    /++
     + Create a ConstantVector from values
     +/
    LLVMValueRef LLVMConstVector(LLVMValueRef* value, uint size);
}