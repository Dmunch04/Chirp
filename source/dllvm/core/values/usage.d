module dllvm.core.values.usage;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueUses.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Obtain the first use of a value
     +
     + Uses are obtained in an iterator fashion. First, call this function to obtain a reference to the first use.
     + Then, call `LLVMGetNextUse()`` on that instance and all subsequently obtained instances until LLVMGetNextUse() returns `null`
     +/
    LLVMUseRef LLVMGetFirstUse(LLVMValueRef value);

    /++
     + Obtain the next use of a value
     +
     + This effectively advances the iterator.
     + It returns `null` if you are on the final use and no more are available
     +/
    LLVMUseRef LLVMGetNextUse(LLVMUseRef use);

    /++
     + Obtain the user value for a user
     +
     + The returned value corresponds to a `llvm::User` type
     +/
    LLVMValueRef LLVMGetUser(LLVMUseRef use);

    /++
     + Obtain the value this use corresponds to
     +/
    LLVMValueRef LLVMGetUsedValue(LLVMUseRef use);
}