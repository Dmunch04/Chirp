module dllvm.core.metadata;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueMetadata.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Create an MDString value from a given string value
     +
     + The `MDString` value does not take ownership of the given string,
     + it remains the responsibility of the caller to free it
     +/
    LLVMMetadataRef LLVMMDStringInContext2(LLVMContextRef ctx, const(char*) str, size_t strLength);

    /++
     + Create an `MDNode` value with the given array of operands
     +/
    LLVMMetadataRef LLVMMDNodeInContext2(LLVMContextRef ctx, LLVMMetadataRef *metadatas, size_t count);

    /++
     + Obtain a Metadata as a Value
     +/
    LLVMValueRef LLVMMetadataAsValue(LLVMContextRef ctx, LLVMMetadataRef metadata);

    /++
     + Obtain a Value as a Metadata
     +/
    LLVMMetadataRef LLVMValueAsMetadata(LLVMValueRef value);

    /++
     + Obtain the underlying string from a MDString value
     +
     + - Param `value`: Instance to obtain string from
     + - Param `length`: Memory address which will hold length of returned string
     +
     + Returns: String data in `MDString`
     +/
    const(char*) LLVMGetMDString(LLVMValueRef value, uint* length);

    /++
     + Obtain the number of operands from an MDNode value.
     +
     + - Param `value`: `MDNode` to get number of operands from
     +
     + Returns: Number of operands of the `MDNode`
     +/
    uint LLVMGetMDNodeNumOperands(LLVMValueRef value);

    /++
     + Obtain the given MDNode's operands
     +
     + The passed LLVMValueRef pointer should point to enough memory to hold all of the operands
     + of the given MDNode (see LLVMGetMDNodeNumOperands) as LLVMValueRefs.
     + This memory will be populated with the LLVMValueRefs of the MDNode's operands
     +
     + - Param `value`: `MDNode` to get the operands from
     + - Param `destination`: Destination array for operands
     +/
    void LLVMGetMDNodeOperands(LLVMValueRef value, LLVMValueRef* destination);

    /++
     + Deprecated: Use `LLVMMDStringInContext2` instead
     +/
    deprecated LLVMValueRef LLVMMDStringInContext(LLVMContextRef ctx, const(char*) str, uint strLength);

    /++
     + Deprecated: Use `LLVMMDStringInContext2` instead
     +/
    deprecated LLVMValueRef LLVMMDString(const(char*) str, uint strLength);

    /++
     + Deprecated: Use `LLVMMDNodeInContext2` instead
     +/
    deprecated LLVMValueRef LLVMMDNodeInContext(LLVMContextRef ctx, LLVMValueRef* values, uint count);

    /++
     + Deprecated: Use `LLVMMDNodeInContext2` instead
     +/
    deprecated LLVMValueRef LLVMMDNode(LLVMValueRef* values, uint count);
}