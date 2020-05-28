module dllvm.core.instructions.phi;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueInstructionPHINode.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Add an incoming value to the end of a PHI list
     +/
    void LLVMAddIncoming(LLVMValueRef phiNode, LLVMValueRef* incomingValues, LLVMBasicBlockRef* incomingBlocks, uint count);

    /++
     + Obtain the number of incoming basic blocks to a PHI node
     +/
    uint LLVMCountIncoming(LLVMValueRef phiNode);

    /++
     + Obtain an incoming value to a PHI node as an `LLVMValueRef`
     +/
    LLVMValueRef LLVMGetIncomingValue(LLVMValueRef phiNode, uint index);

    /++
     + Obtain an incoming value to a PHI node as an `LLVMBasicBlockRef`
     +/
    LLVMBasicBlockRef LLVMGetIncomingBlock(LLVMValueRef phiNode, uint index);
}