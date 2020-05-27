module dllvm.core.types.integer;

import dllvm.ctypes;

extern (C)
{
    LLVMTypeRef LLVMInt1TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMInt8TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMInt16TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMInt32TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMInt64TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMInt128TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMIntTypeInContext(LLVMContextRef ctx);
}