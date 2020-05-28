module dllvm.core.contexts;

// Source: https://llvm.org/doxygen/group__LLVMCCoreContext.html

import dllvm.ctypes;

alias LLVMDiagnosticHandler = extern(C) void function(LLVMDiagnosticInfoRef, void*);
alias LLVMYieldCallback = extern(C) void function(LLVMContextRef, void*);

extern(C)
{
    LLVMContextRef LLVMContextCreate();

    void LLVMContextDispose(LLVMContextRef ctx);

    void* LLVMContextGetDiagnosticContext(LLVMContextRef ctx);

    LLVMDiagnosticHandler LLVMContextGetDiagnosticHandler(LLVMContextRef ctx);

    void LLVMContextSetDiagnosticHandler(LLVMContextRef ctx, LLVMDiagnosticHandler handler, void* DiagnosticContext);

    void LLVMContextSetDiscardValueNames(LLVMContextRef ctx, LLVMBool discard);
}