module dllvm.core.basicblock;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueBasicBlock.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Convert a basic block instance to a value type
     +/
    LLVMValueRef LLVMBasicBlockAsValue(LLVMBasicBlockRef block);

    /++
     + Determine whether an LLVMValueRef is itself a basic block
     +/
    LLVMBool LLVMValueIsBasicBlock(LLVMValueRef value);

    /++
     + Convert an LLVMValueRef to an LLVMBasicBlockRef instance
     +/
    LLVMBasicBlockRef LLVMValueAsBasicBlock(LLVMValueRef value);

    /++
     + Obtain the string name of a basic block
     +/
    const(char*) LLVMGetBasicBlockName(LLVMBasicBlockRef block);

    /++
     + Obtain the function to which a basic block belongs
     +/
    LLVMValueRef LLVMGetBasicBlockParent(LLVMBasicBlockRef block);

    /++
     + Obtain the terminator instruction for a basic block.
     +
     + If the basic block does not have a terminator (it is not well-formed if it doesn't), then `null` is returned
     +
     + The returned `LLVMValueRef` corresponds to an `llvm::Instruction`
     +/
    LLVMValueRef LLVMGetBasicBlockTerminator(LLVMBasicBlockRef block);

    /++
     + Obtain the number of basic blocks in a function
     +/
    uint LLVMCountBasicBlocks(LLVMValueRef fn);

    /++
     + Obtain all of the basic blocks in a function
     +
     + This operates on a function value. The BasicBlocks parameter is a pointer to a
     + pre-allocated array of `LLVMBasicBlockRef` of at least `LLVMCountBasicBlocks()` in length.
     + This array is populated with `LLVMBasicBlockRef` instances
     +/
    void LLVMGetBasicBlocks(LLVMValueRef fn, LLVMBasicBlockRef* blocks);

    /++
     + Obtain the first basic block in a function
     +
     + The returned basic block can be used as an iterator.
     + You will likely eventually call into `LLVMGetNextBasicBlock()` with it
     +/
    LLVMBasicBlockRef LLVMGetFirstBasicBlock(LLVMValueRef fn);

    /++
     + Obtain the last basic block in a function
     +/
    LLVMBasicBlockRef LLVMGetLastBasicBlock(LLVMValueRef fn);

    /++
     + Advance a basic block iterator
     +/
    LLVMBasicBlockRef LLVMGetNextBasicBlock(LLVMBasicBlockRef block);

    /++
     + Go backwards in a basic block iterator
     +/
    LLVMBasicBlockRef LLVMGetPreviousBasicBlock(LLVMBasicBlockRef block);

    /++
     + Obtain the basic block that corresponds to the entry point of a function
     +/
    LLVMBasicBlockRef LLVMGetEntryBasicBlock(LLVMValueRef fn);

    /++
     + Insert the given basic block after the insertion point of the given builder
     +
     + The insertion point must be valid
     +/
    void LLVMInsertExistingBasicBlockAfterInsertBlock(LLVMBuilderRef builder, LLVMBasicBlockRef block);

    /++
     + Append the given basic block to the basic block list of the given function
     +/
    void LLVMAppendExistingBasicBlock(LLVMValueRef fn, LLVMBasicBlockRef block);

    /++
     + Create a new basic block without inserting it into a function
     +/
    LLVMBasicBlockRef LLVMCreateBasicBlockInContext(LLVMContextRef ctx, const(char*) name);

    /++
     + Append a basic block to the end of a function
     +/
    LLVMBasicBlockRef LLVMAppendBasicBlockInContext(LLVMContextRef ctx, LLVMValueRef fn, const(char*) name);

    /++
     + Append a basic block to the end of a function using the global context
     +/
    LLVMBasicBlockRef LLVMAppendBasicBlock(LLVMValueRef fn, const(char*) name);

    /++
     + Insert a basic block in a function before another basic block
     +
     + The function to add to is determined by the function of the passed basic block
     +/
    LLVMBasicBlockRef LLVMInsertBasicBlockInContext(LLVMContextRef ctx, LLVMBasicBlockRef block, const(char*) name);

    /++
     + Insert a basic block in a function using the global context
     +/
    LLVMBasicBlockRef LLVMInsertBasicBlock(LLVMBasicBlockRef insertBeforeBlock, const(char*) name);

    /++
     + Remove a basic block from a function and delete it
     +
     + This deletes the basic block from its containing function and deletes the basic block itself
     +/
    void LLVMDeleteBasicBlock(LLVMBasicBlockRef block);

    /++
     + Remove a basic block from a function
     +
     + This deletes the basic block from its containing function but keep the basic block alive
     +/
    void LLVMRemoveBasicBlockFromParent(LLVMBasicBlockRef block);

    /++
     + Move a basic block to before another one
     +/
    void LLVMMoveBasicBlockBefore(LLVMBasicBlockRef block, LLVMBasicBlockRef movePosition);

    /++
     + Move a basic block to after another one
     +/
    void LLVMMoveBasicBlockAfter(LLVMBasicBlockRef block, LLVMBasicBlockRef movePosition);

    /++
     + Obtain the first instruction in a basic block
     +
     + The returned `LLVMValueRef` corresponds to a `llvm::Instruction` instance
     +/
    LLVMValueRef LLVMGetFirstInstruction(LLVMBasicBlockRef block);

    /++
     + Obtain the last instruction in a basic block
     +
     + The returned `LLVMValueRef` corresponds to an `llvm::Instruction` instance
     +/
    LLVMValueRef LLVMGetLastInstruction(LLVMBasicBlockRef block);
}