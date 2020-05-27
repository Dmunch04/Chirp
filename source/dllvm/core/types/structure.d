module dllvm.core.types.structure;

// Source: https://llvm.org/doxygen/group__LLVMCCoreTypeStruct.html

import dllvm.ctypes;

extern (C)
{
    /++
     + Create a new structure type in a context
     +
     + A structure is specified by a list of inner elements/types and whether these can be packed together
     +/
    LLVMTypeRef LLVMStructTypeInContext(LLVMContextRef ctx, LLVMTypeRef* elementTypes, uint elementCount, LLVMBool packed);

    /++
     + Create a new structure type in the global context
     +/
    LLVMTypeRef LLVMStructType(LLVMTypeRef* elementTypes, uint elementCount, LLVMBool packed);

    /++
     + Create an empty structure in a context having a specified name
     +/
    LLVMTypeRef LLVMStructCreateNamed(LLVMContextRef ctx, const(char*) name);

    /++
     + Obtain the name of a structure
     +/
    const(char*) LLVMGetStructName(LLVMTypeRef ty);

    /++
     + Set the contents of a structure type
     +/
    void LLVMStructSetBody(LLVMTypeRef ty, LLVMTypeRef* elementTypes, uint elementCount, LLVMBool packed);

    /++
     + Get the number of elements defined inside the structure
     +/
    uint LLVMCountStructElementTypes(LLVMTypeRef ty);

    /++
     + Get the elements within a structure
     +
     + The function is passed the address of a pre-allocated array of LLVMTypeRef at least LLVMCountStructElementTypes() long.
     + After invocation, this array will be populated with the structure's elements.
     + The objects in the destination array will have a lifetime of the structure type itself,
     + which is the lifetime of the context it is contained in.
     +/
    void LLVMGetStructElementTypes(LLVMTypeRef ty, LLVMTypeRef* destination);

    /++
     + Get the type of the element at a given index in the structure
     +/
    LLVMTypeRef LLVMStructGetTypeAtIndex(LLVMTypeRef ty, uint index);

    /++
     + Determine whether a structure is packed
     +/
    LLVMBool LLVMIsPackedStruct(LLVMTypeRef ty);

    /++
     + Determine whether a structure is opaque
     +/
    LLVMBool LLVMIsOpaqueStruct(LLVMTypeRef ty);

    /++
     + Determine whether a structure is literal
     +/
    LLVMBool LLVMIsLiteralStruct(LLVMTypeRef ty);
}