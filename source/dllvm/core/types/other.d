module dllvm.core.types.other;

// Source: https://llvm.org/doxygen/group__LLVMCCoreTypeOther.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Create a void type in a context
     +/
    LLVMTypeRef LLVMVoidTypeInContext(LLVMContextRef ctx);

    /++
     + Create a label type in a context
     +/
    LLVMTypeRef LLVMLabelTypeInContext(LLVMContextRef ctx);

    /++
     + Create a X86 MMX type in a context
     +/
    LLVMTypeRef LLVMX86MMXTypeInContext(LLVMContextRef ctx);

    /++
     + Create a token type in a context
     +/
    LLVMTypeRef LLVMTokenTypeInContext(LLVMContextRef ctx);

    /++
     + Create a metadata type in a context
     +/
    LLVMTypeRef LLVMMetadataTypeInContext(LLVMContextRef ctx);

    /++
     + Create a void type in global context
     +/
    LLVMTypeRef LLVMVoidType();

    /++
     + Create a void type in global context
     +/
    LLVMTypeRef LLVMLabelType();

    /++
     + Create a X86 MMX type in global context
     +/
    LLVMTypeRef LLVMX86MMXType();
}