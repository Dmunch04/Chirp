module dllvm.analysis;

// Source: https://llvm.org/doxygen/group__LLVMCAnalysis.html

import dllvm.ctypes;

alias LLVMVerifierFailureAction = int;
enum : LLVMVerifierFailureAction
{
    LLVMAbortProcessAction,
    LLVMPrintMessageAction,
    LLVMReturnStatusAction
}

extern(C)
{
    LLVMBool LLVMVerifyModule(LLVMModuleRef mod, LLVMVerifierFailureAction action, char** outMessage);

    LLVMBool LLVMVerifyFunction(LLVMValueRef fn, LLVMVerifierFailureAction action);

    void LLVMViewFunctionCFG(LLVMValueRef fn);
    
    void LLVMViewFunctionCFGOnly(LLVMValueRef fn);
}