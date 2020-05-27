module dllvm.core.values.constants.global.aliases;

// Source: https://llvm.org/doxygen/group__LLVMCoreValueConstantGlobalAlias.html

import dllvm.ctypes;

extern(C)
{
    LLVMValueRef LLVMAddAlias(LLVMModuleRef mod, LLVMTypeRef ty, LLVMValueRef aliasee, const(char*) name);

    /++
     + Obtain a `GlobalAlias` value from a `Module` by its name
     +
     + The returned value corresponds to a `llvm::GlobalAlias` value
     +/
    LLVMValueRef LLVMGetNamedGlobalAlias(LLVMModuleRef mod, const(char*) name, size_t nameLength);

    /++
     + Obtain an iterator to the first GlobalAlias in a Module
     +/
    LLVMValueRef LLVMGetFirstGlobalAlias(LLVMModuleRef mod);

    /++
     + Obtain an iterator to the last GlobalAlias in a Module
     +/
    LLVMValueRef LLVMGetLastGlobalAlias(LLVMModuleRef mod);

    /++
     + Advance a `GlobalAlias` iterator to the next `GlobalAlias`
     +
     + Returns `null` if the iterator was already at the end and there are no more global aliases
     +/
    LLVMValueRef LLVMGetNextGlobalAlias(LLVMValueRef globalAlias);

    /++
     + Decrement a `GlobalAlias` iterator to the previous `GlobalAlias`
     +
     + Returns `null` if the iterator was already at the beginning and there are no previous global aliases
     +/
    LLVMValueRef LLVMGetPreviousGlobalAlias(LLVMValueRef globalAlias);

    /++
     + Retrieve the target value of an alias
     +
     + - Param `als`: The alias
     +/
    LLVMValueRef LLVMAliasGetAliasee(LLVMValueRef als);

    /++
     + Set the target value of an alias
     +
     + - Param `als`: The alias
     +/
    void LLVMAliasSetAliasee(LLVMValueRef als, LLVMValueRef aliasee);
}