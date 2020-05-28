module dllvm.initialization;

// Source: https://llvm.org/doxygen/group__LLVMCInitialization.html

import dllvm.ctypes;

extern(C)
{
    // LLVMInitializeCore is defined in core.package

    /++
     + `LLVMInitializeTransformUtils` - C binding for `initializeTransformUtilsPasses`
     +/
    void LLVMInitializeTransformUtils(LLVMPassRegistryRef registry);

    void LLVMInitializeScalarOpts(LLVMPassRegistryRef registry);

    void LLVMInitializeObjCARCOpts(LLVMPassRegistryRef registry);

    void LLVMInitializeVectorization(LLVMPassRegistryRef registry);

    void LLVMInitializeInstCombine(LLVMPassRegistryRef registry);

    void LLVMInitializeAggressiveInstCombiner(LLVMPassRegistryRef registry);

    void LLVMInitializeIPO(LLVMPassRegistryRef registry);

    /++
     + `LLVMInitializeInstrumentation` - C binding for `initializeInstrumentation`
     +/
    void LLVMInitializeInstrumentation(LLVMPassRegistryRef registry);

    void LLVMInitializeAnalysis(LLVMPassRegistryRef registry);

    void LLVMInitializeIPA(LLVMPassRegistryRef registry);

    void LLVMInitializeCodeGen(LLVMPassRegistryRef registry);

    void LLVMInitializeTarget(LLVMPassRegistryRef registry);
}