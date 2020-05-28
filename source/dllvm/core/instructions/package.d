module dllvm.core.instructions;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueInstruction.html

public import dllvm.core.instructions.allocas;
public import dllvm.core.instructions.calls;
public import dllvm.core.instructions.extract;
public import dllvm.core.instructions.geps;
public import dllvm.core.instructions.insert;
public import dllvm.core.instructions.phi;
public import dllvm.core.instructions.terminators;

import dllvm.ctypes;
import dllvm.core.enums;

extern(C)
{
    /++
     + Determine whether an instruction has any metadata attached
     +/
    int LLVMHasMetadata(LLVMValueRef value);

    /++
     + Return metadata associated with an instruction value
     +/
    LLVMValueRef LLVMGetMetadata(LLVMValueRef value, uint kindId);

    /++
     + Set metadata associated with an instruction value
     +/
    void LLVMSetMetadata(LLVMValueRef value, uint kindId, LLVMValueRef node);

    /++
     + Returns the metadata associated with an instruction value, but filters out all the debug locations
     +/
    LLVMValueMetadataEntry* LLVMInstructionGetAllMetadataOtherThanDebugLoc(LLVMValueRef instruction, size_t* entriesCount);

    /++
     + Obtain the basic block to which an instruction belongs
     +/
    LLVMBasicBlockRef LLVMGetInstructionParent(LLVMValueRef instruction);

    /++
     + Obtain the instruction that occurs after the one specified
     +
     + The next instruction will be from the same basic block
     +
     + If this is the last instruction in a basic block, `null` will be returned
     +/
    LLVMValueRef LLVMGetNextInstruction(LLVMValueRef instruction);

    /++
     + Obtain the instruction that occurred before this one
     +
     + If the instruction is the first instruction in a basic block, `null` will be returned
     +/
    LLVMValueRef LLVMGetPreviousInstruction(LLVMValueRef instruction);

    /++
     + Remove and delete an instruction
     +
     + The instruction specified is removed from its containing building block but is kept alive
     +/
    void LLVMInstructionRemoveFromParent(LLVMValueRef instruction);

    /++
     + Remove and delete an instruction
     +
     + The instruction specified is removed from its containing building block and then deleted
     +/
    void LLVMInstructionEraseFromParent(LLVMValueRef instruction);

    /++
     + Obtain the code opcode for an individual instruction
     +/
    LLVMOpcode LLVMGetInstructionOpcode(LLVMValueRef instruction);

    /++
     + Obtain the predicate of an instruction
     +
     + This is only valid for instructions that correspond
     + to `llvm::ICmpInst` or `llvm::ConstantExpr` whose opcode is `llvm::Instruction::ICmp`
     +/
    LLVMIntPredicate LLVMGetICmpPredicate(LLVMValueRef instruction);

    /++
     + Obtain the float predicate of an instruction
     +
     + This is only valid for instructions that correspond
     + to `llvm::FCmpInst` or `llvm::ConstantExpr` whose opcode is `llvm::Instruction::FCmp`
     +/
    LLVMRealPredicate LLVMGetFCmpPredicate(LLVMValueRef instruction);

    /++
     + Create a copy of `this` instruction that is identical in all ways except the following:
     + - The instruction has no parent
     + - The instruction has no name
     +/
    LLVMValueRef LLVMInstructionClone(LLVMValueRef instruction);

    /++
     + Determine whether an instruction is a terminator
     +
     + This routine is named to be compatible with historical
     + functions that did this by querying the underlying C++ type
     +/
    LLVMValueRef LLVMIsATerminatorInst(LLVMValueRef instruction);
}