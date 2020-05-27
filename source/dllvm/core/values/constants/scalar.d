module dllvm.core.values.constants.scalar;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueConstantScalar.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Obtain a constant value for an integer type
     +
     + The returned value corresponds to a `llvm::ConstantInt`
     +
     + - Param `n`: The value the returned instance should refer to
     +/
    LLVMValueRef LLVMConstInt(LLVMTypeRef intType, ulong n, LLVMBool signExtend);

    /++
     + Obtain a constant value for an integer of arbitrary precision
     +/
    LLVMValueRef LLVMConstIntOfArbitraryPrecision(LLVMTypeRef intType, uint numWords, const(ulong)[] words);

    /++
     + Obtain a constant value for an integer parsed from a string.
     +
     + A similar API, `LLVMConstIntOfStringAndSize` is also available.
     + If the string's length is available, it is preferred to call that function instead
     +/
    LLVMValueRef LLVMConstIntOfString(LLVMTypeRef intType, const(char*) text, ubyte radix);

    /++
     + Obtain a constant value for an integer parsed from a string with specified length
     +/
    LLVMValueRef LLVMConstIntOfStringAndSize(LLVMTypeRef intType, const(char*) text, uint length, ubyte radix);

    /++
     + Obtain a constant value referring to a double floating point value
     +/
    LLVMValueRef LLVMConstReal(LLVMTypeRef realType, double n);

    /++
     + Obtain a constant for a floating point value parsed from a string.
     +
     + A similar API, `LLVMConstRealOfStringAndSize` is also available.
     + It should be used if the input string's length is known
     +/
    LLVMValueRef LLVMConstRealOfString(LLVMTypeRef realType, const(char*) text);

    /++
     + Obtain a constant for a floating point value parsed from a string
     +/
    LLVMValueRef LLVMConstRealOfStringAndSize(LLVMTypeRef realType, const(char*) text, uint length);

    /++
     + Obtain the zero extended value for an integer constant value
     +/
    ulong LLVMConstIntGetZExtValue(LLVMValueRef value);

    /++
     + Obtain the sign extended value for an integer constant value
     +/
    long LLVMConstIntGetSExtValue(LLVMValueRef value);

    /++
     + Obtain the double value for an floating point constant value.
     +
     + - Param `losesInfo`: Indicates if some precision was lost in the conversion
     +/
    double LLVMConstRealGetDouble(LLVMValueRef value, LLVMBool* losesInfo);
}