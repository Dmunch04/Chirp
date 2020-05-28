module dllvm.core.instructions.terminators;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueInstructionTerminator.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Return the number of successors that this terminator has
     +/
    uint LLVMGetNumSuccessors(LLVMValueRef term);

    /++
     + Return the specified successor
     +/
    LLVMBasicBlockRef LLVMGetSuccessor(LLVMValueRef term, uint index);

    /++
     + Update the specified successor to point at the provided block
     +/
    void LLVMSetSuccessor(LLVMValueRef term, uint index, LLVMBasicBlockRef block);

    /++
     + Return if a branch is conditional
     +
     + This only works on `llvm::BranchInst` instructions
     +/
    LLVMBool LLVMIsConditional(LLVMValueRef branch);

    /++
     + Return the condition of a branch instruction
     +
     + This only works on `llvm::BranchInst` instructions
     +/
    LLVMValueRef LLVMGetCondition(LLVMValueRef branch);

    /++
     + Set the condition of a branch instruction
     +
     + This only works on `llvm::BranchInst` instructions
     +/
    void LLVMSetCondition(LLVMValueRef branch, LLVMValueRef condition);

    /++
     + Obtain the default destination basic block of a switch instruction
     +
     + This only works on `llvm::SwitchInst` instructions
     +/
    LLVMBasicBlockRef LLVMGetSwitchDefaultDest(LLVMValueRef switchInstruction);
}