module dllvm.core.types.floating;

// Source: https://llvm.org/doxygen/group__LLVMCCoreTypeFloat.html

import dllvm.ctypes;

extern(C)
{
    LLVMTypeRef LLVMHalfTypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMBFloatTypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMFloatTypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMDoubleTypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMX86FP80TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMFP128TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMPPCFP128TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMHalfType();

    LLVMTypeRef LLVMBFloatType();

    LLVMTypeRef LLVMFloatType();

    LLVMTypeRef LLVMDoubleType();

    LLVMTypeRef LLVMX86FP80Type();

    LLVMTypeRef LLVMFP128Type();

    LLVMTypeRef LLVMPPCFP128Type();
}