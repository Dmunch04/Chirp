module dllvm.core.values.general;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueGeneral.html

import dllvm.ctypes;
import dllvm.core.enums;

extern(C)
{
    /++
     +
     +/
    LLVMTypeRef LLVMTypeOf(LLVMValueRef value);

    /++
     + Obtain the enumerated type of a Value instance
     +/
    LLVMValueKind LLVMGetValueKind(LLVMValueRef value);

    /++
     + Obtain the string name of a value
     +/
    const(char*) LLVMGetValueName2(LLVMValueRef value, size_t* length);

    /++
     + Set the string name of a value
     +/
    void LLVMSetValueName2(LLVMValueRef value, const(char*) name, size_t length);

    /++
     + Dump a representation of a value to stderr
     +/
    void LLVMDumpValue(LLVMValueRef value);

    /++
     + Return a string representation of the value
     +
     + Use LLVMDisposeMessage to free the string
     +/
    char* LLVMPrintValueToString(LLVMValueRef value);

    /++
     + Replace all uses of a value with another one
     +/
    void LLVMReplaceAllUsesWith(LLVMValueRef oldValue, LLVMValueRef newValue);

    /++
     + Determine whether the specified value instance is constant
     +/
    LLVMBool LLVMIsConstant(LLVMValueRef value);

    /++
     + Determine whether a value instance is undefined
     +/
    LLVMBool LLVMIsUndef(LLVMValueRef value);

    LLVMValueRef LLVMIsAMDNode(LLVMValueRef value);

    LLVMValueRef LLVMIsAMDString(LLVMValueRef value);

    /++
     + Deprecated: Use `LLVMGetValueName2` instead
     +/
    deprecated const(char*) LLVMGetValueName(LLVMValueRef value);

    /++
     + Deprecated: Use `LLVMSetValueName2` instead
     +/
    deprecated void LLVMSetValueName(LLVMValueRef value, const(char*) name);
}