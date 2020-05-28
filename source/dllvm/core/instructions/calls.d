module dllvm.core.instructions.calls;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueInstructionCall.html

import dllvm.ctypes;
import dllvm.core.enums;

extern(C)
{
    /++
     + Obtain the argument count for a call instruction
     +
     + This expects an `LLVMValueRef` that corresponds to a `llvm::CallInst`, `llvm::InvokeInst` or `llvm:FuncletPadInst`
     +/
    uint LLVMGetNumArgOperands(LLVMValueRef instruction);

    /++
     + Set the calling convention for a call instruction
     +
     + This expects an `LLVMValueRef` that corresponds to a `llvm::CallInst` or `llvm::InvokeInst`
     +/
    void LLVMSetInstructionCallConv(LLVMValueRef instruction, uint callConv);

    /++
     + Obtain the calling convention for a call instruction
     +
     + This is the opposite of `LLVMSetInstructionCallConv()`
     +/
    uint LLVMGetInstructionCallConv(LLVMValueRef instruction);

    void LLVMSetInstrParamAlignment(LLVMValueRef instruction, uint index, uint alignment);

    void LLVMAddCallSiteAttribute(LLVMValueRef callSite, LLVMAttributeIndex index, LLVMAttributeRef attr);

    uint LLVMGetCallSiteAttributeCount(LLVMValueRef callSite, LLVMAttributeIndex index);

    void LLVMGetCallSiteAttributes(LLVMValueRef callSite, LLVMAttributeIndex index, LLVMAttributeRef* attrs);

    LLVMAttributeRef LLVMGetCallSiteEnumAttribute(LLVMValueRef callSite, LLVMAttributeIndex index, uint kindId);

    LLVMAttributeRef LLVMGetCallSiteStringAttribute(LLVMValueRef callSite, LLVMAttributeIndex index, const(char*) k, uint kLength);

    void LLVMRemoveCallSiteEnumAttribute(LLVMValueRef callSite, LLVMAttributeIndex index, uint kindId);

    void LLVMRemoveCallSiteStringAttribute(LLVMValueRef callSite, LLVMAttributeIndex index, const(char*) k, uint kLength);

    /++
     + Obtain the function type called by this instruction
     +/
    LLVMTypeRef LLVMGetCalledFunctionType(LLVMValueRef callSite);

    /++
     + Obtain the pointer to the function invoked by this instruction
     +
     + This expects an `LLVMValueRef` that corresponds to a `llvm::CallInst` or `llvm::InvokeInst`
     +/
    LLVMValueRef LLVMGetCalledValue(LLVMValueRef instruction);

    /++
     + Obtain whether a call instruction is a tail call
     +
     + This only works on `llvm::CallInst` instructions
     +/
    LLVMBool LLVMIsTailCall(LLVMValueRef callInstruction);

    /++
     + Set whether a call instruction is a tail call
     +
     + This only works on `llvm::CallInst` instructions
     +/
    void LLVMSetTailCall(LLVMValueRef callInstruction, LLVMBool isTailCall);

    /++
     + Return the normal destination basic block
     +
     + This only works on `llvm::InvokeInst` instructions
     +/
    LLVMBasicBlockRef LLVMGetNormalDest(LLVMValueRef invokeInstruction);

    /++
     + Return the unwind destination basic block
     +
     + Works on `llvm::InvokeInst`, `llvm::CleanupReturnInst` and `llvm::CatchSwitchInst` instructions
     +/
    LLVMBasicBlockRef LLVMGetUnwindDest(LLVMValueRef invokeInstruction);

    /++
     + Set the normal destination basic block
     +
     + This only works on `llvm::InvokeInst` instructions
     +/
    void LLVMSetNormalDest(LLVMValueRef invokeInstruction, LLVMBasicBlockRef block);

    /++
     + Set the unwind destination basic block.
     +
     + Works on `llvm::InvokeInst`, `llvm::CleanupReturnInst` and `llvm::CatchSwitchInst` instructions
     +/
    void LLVMSetUnwindDest(LLVMValueRef invokeInstruction, LLVMBasicBlockRef block);
}