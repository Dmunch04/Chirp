module dllvm.core.types.integer;

// Source: https://llvm.org/doxygen/group__LLVMCCoreTypeInt.html

import dllvm.ctypes;

extern(C)
{
    LLVMTypeRef LLVMInt1TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMInt8TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMInt16TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMInt32TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMInt64TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMInt128TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMIntTypeInContext(LLVMContextRef ctx);

    /++
     + Obtain an integer type from the global context with a specified bit width
     +/
    LLVMTypeRef LLVMInt1Type();

    /++
     + Obtain an integer type from a context with specified bit width
     +/
    LLVMTypeRef LLVMInt8Type();

    LLVMTypeRef LLVMInt16Type();

    LLVMTypeRef LLVMInt32Type();

    LLVMTypeRef LLVMInt64Type();

    LLVMTypeRef LLVMInt128Type();

    LLVMTypeRef LLVMIntType(uint bits);

    uint LLVMGetIntTypeWidth(LLVMTypeRef ty);
}