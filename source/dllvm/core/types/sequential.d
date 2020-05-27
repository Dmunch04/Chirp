module dllvm.core.types.sequential;

// Source: https://llvm.org/doxygen/group__LLVMCCoreTypeSequential.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Obtain the type of elements within a sequential type
     + 
     + This works on array, vector, and pointer types
     +/
    LLVMTypeRef LLVMGetElementType(LLVMTypeRef ty);

    /++
     + Returns type's subtypes
     +/
    void LLVMGetSubTypes(LLVMTypeRef ty, LLVMTypeRef* array);

    /++
     + Return the number of types in the derived type
     +/
    uint LLVMGetNumContainedTypes(LLVMTypeRef ty);

    /++
     + Create a fixed size array type that refers to a specific type
     +
     + The created type will exist in the context that its element type exists in
     +/
    LLVMTypeRef LLVMArrayType(LLVMTypeRef elementType, uint elementCount);

    /++
     + Obtain the length of an array type
     +
     + This only works on types that represent arrays
     +/
    uint LLVMGetArrayLength(LLVMTypeRef ty);

    /++
     + Create a pointer type that points to a defined type
     +
     + The created type will exist in the context that its pointee type exists in
     +/
    LLVMTypeRef LLVMPointerType(LLVMTypeRef elementType, uint addressSpace);

    /++
     + Obtain the address space of a pointer type
     +
     + This only works on types that represent pointers
     +/
    uint LLVMGetPointerAddressSpace(LLVMTypeRef ty);

    /++
     + Create a vector type that contains a defined type and has a specific number of elements
     +
     + The created type will exist in the context thats its element type exists in
     +/
    LLVMTypeRef LLVMVectorType(LLVMTypeRef elementType, uint elementCount);

    /++
     + Obtain the number of elements in a vector type
     +
     + This only works on types that represent vectors
     +/
    uint LLVMGetVectorSize(LLVMTypeRef ty);
}