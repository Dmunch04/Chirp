module dllvm.core.values.constants.global.variables;

// Source: https://llvm.org/doxygen/group__LLVMCoreValueConstantGlobalVariable.html

import dllvm.ctypes;
import dllvm.core.enums;

extern(C)
{
    LLVMValueRef LLVMAddGlobal(LLVMModuleRef mod, LLVMTypeRef ty, const(char*) name);

    LLVMValueRef LLVMAddGlobalInAddressSpace(LLVMModuleRef mod, LLVMTypeRef ty, const(char*) name, uint addressSpace);

    LLVMValueRef LLVMGetNamedGlobal(LLVMModuleRef mod, const(char*) name);
    
    LLVMValueRef LLVMGetFirstGlobal(LLVMModuleRef mod);

    LLVMValueRef LLVMGetLastGlobal(LLVMModuleRef mod);

    LLVMValueRef LLVMGetNextGlobal(LLVMValueRef globalVariable);

    LLVMValueRef LLVMGetPreviousGlobal(LLVMValueRef globalVariable);

    void LLVMDeleteGlobal(LLVMValueRef globalVariable);

    LLVMValueRef LLVMGetInitializer(LLVMValueRef globalVariable);

    void LLVMSetInitializer(LLVMValueRef globalVariable, LLVMValueRef value);

    LLVMBool LLVMIsThreadLocal(LLVMValueRef globalVariable);

    void LLVMSetThreadLocal(LLVMValueRef globalVariable, LLVMBool isThreadLocal);

    LLVMBool LLVMIsGlobalConstant(LLVMValueRef globalVariable);

    void LLVMSetGlobalConstant(LLVMValueRef globalVariable, LLVMBool isConstant);

    LLVMThreadLocalMode LLVMGetThreadLocalMode(LLVMValueRef globalVariable);

    void LLVMSetThreadLocalMode(LLVMValueRef globalVariable, LLVMThreadLocalMode mode);

    LLVMBool LLVMIsExternallyInitialized(LLVMValueRef globalVariable);

    void LLVMSetExternallyInitialized(LLVMValueRef globalVariable, LLVMBool isExitInit);
}