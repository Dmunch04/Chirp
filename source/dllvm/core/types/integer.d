module dllvm.core.types.integer;

import dllvm.ctypes;

extern (C)
{
    LLVMTypeRef LLVMInt1TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMInt8TypeInContext(LLVMContextRef ctx);

    LLVMTypeRef LLVMInt16TypeInContext(LLVMContextRef ctx);
}