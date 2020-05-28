module dllvm.instructionbuilders;

import dllvm.ctypes;

extern(C)
{
    LLVMBuilderRef LLVMCreateBuilderInContext(LLVMContextRef ctx);

    LLVMBuilderRef LLVMCreateBuilder();

    void LLVMPositionBuilder(LLVMBuilderRef builder, LLVMBasicBlockRef block, LLVMValueRef instruction);

    void LLVMPositionBuilderBefore(LLVMBuilderRef builder, LLVMValueRef instruction);

    void LLVMPositionBuilderAtEnd(LLVMBuilderRef builder, LLVMBasicBlockRef block);

    LLVMBasicBlockRef LLVMGetInsertBlock(LLVMBuilderRef builder);

    void LLVMClearInsertionPosition(LLVMBuilderRef builder);

    void LLVMInsertIntoBuilder(LLVMBuilderRef builder, LLVMValueRef instruction);

    void LLVMInsertIntoBuilderWithName(LLVMBuilderRef builder, LLVMValueRef instruction, const(char*) name);

    void LLVMDisposeBuilder(LLVMBuilderRef builder);

    LLVMMetadataRef LLVMGetCurrentDebugLocation2(LLVMBuilderRef builder);

    void LLVMSetCurrentDebugLocation2(LLVMBuilderRef builder, LLVMMetadataRef location);

    void LLVMSetInstDebugLocation(LLVMBuilderRef builder, LLVMValueRef instruction);

    LLVMMetadataRef LLVMBuilderGetDefaultFPMathTag(LLVMBuilderRef builder);

    void LLVMBuilderSetDefaultFPMathTag(LLVMBuilderRef builder, LLVMMetadataRef fpMathTag);

    void LLVMSetCurrentDebugLocation(LLVMBuilderRef builder, LLVMValueRef l);

    LLVMValueRef LLVMGetCurrentDebugLocation(LLVMBuilderRef builder);

    LLVMValueRef LLVMBuildRetVoid(LLVMBuilderRef builder);

    LLVMValueRef LLVMBuildRet(LLVMBuilderRef builder, LLVMValueRef value);

    LLVMValueRef LLVMBuildAggregateRet(LLVMBuilderRef builder, LLVMValueRef* retVals, uint n);

    LLVMValueRef LLVMBuildBr(LLVMBuilderRef builder, LLVMBasicBlockRef destination);

    LLVMValueRef LLVMBuildCondBr (LLVMBuilderRef builder, LLVMValueRef ifValue, LLVMBasicBlockRef thenBlock, LLVMBasicBlockRef elseBlock);

    LLVMValueRef LLVMBuildSwitch(LLVMBuilderRef builder, LLVMValueRef value, LLVMBasicBlockRef elseBlock, uint casesCount);

    LLVMValueRef LLVMBuildIndirectBr(LLVMBuilderRef builder, LLVMValueRef addr, uint destinationCount);

    LLVMValueRef LLVMBuildInvoke(LLVMBuilderRef builder, LLVMValueRef fn, LLVMValueRef* args, uint argsCount, LLVMBasicBlockRef thenBlock, LLVMBasicBlockRef catchBlock, const(char*) name);

    LLVMValueRef LLVMBuildInvoke2(LLVMBuilderRef builder, LLVMTypeRef ty, LLVMValueRef fn, LLVMValueRef* args, uint argsCount, LLVMBasicBlockRef thenBlock, LLVMBasicBlockRef catchBlock, const(char*) name);

    LLVMValueRef LLVMBuildUnreachable(LLVMBuilderRef builder);

    LLVMValueRef LLVMBuildResume(LLVMBuilderRef builder, LLVMValueRef exn);

    LLVMValueRef LLVMBuildLandingPad(LLVMBuilderRef builder, LLVMTypeRef ty, LLVMValueRef persFn, uint clausesCount, const(char*) name);

    LLVMValueRef LLVMBuildCleanupRet(LLVMBuilderRef builder, LLVMValueRef catchPad, LLVMBasicBlockRef block);

    LLVMValueRef LLVMBuildCatchRet(LLVMBuilderRef builder, LLVMValueRef catchPad, LLVMBasicBlockRef block);

    LLVMValueRef LLVMBuildCatchPad (LLVMBuilderRef builder, LLVMValueRef parentPad, LLVMValueRef* args, uint argsCount, const(char*) name);

    LLVMValueRef LLVMBuildCleanupPad (LLVMBuilderRef builder, LLVMValueRef parentPad, LLVMValueRef* args, uint argsCount, const(char*) name);

    LLVMValueRef LLVMBuildCatchSwitch (LLVMBuilderRef builder, LLVMValueRef parentPad, LLVMBasicBlockRef unwindBlock, uint handlersCount, const(char*) name);

    // TODO: Add the rest functions
    // (I've reach https://llvm.org/doxygen/group__LLVMCCoreInstructionBuilder.html#gad317453abcbb1693b9a08e2af3eb4234)
}