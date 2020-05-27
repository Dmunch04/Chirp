module dllvm.core.values.constants.global.values;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueConstantGlobals.html

import dllvm.ctypes;
import dllvm.core.enums;

extern(C)
{
    LLVMModuleRef LLVMGetGlobalParent(LLVMValueRef global);

    LLVMBool LLVMIsDeclaration(LLVMValueRef global);

    LLVMLinkage LLVMGetLinkage(LLVMValueRef global);

    void LLVMSetLinkage(LLVMValueRef global, LLVMLinkage linkage);

    const(char*) LLVMGetSection(LLVMValueRef global);

    void LLVMSetSection(LLVMValueRef global);

    LLVMVisibility LLVMGetVisibility(LLVMValueRef global);

    void LLVMSetVisibility(LLVMValueRef global, LLVMVisibility visibility);

    LLVMDLLStorageClass LLVMGetDLLStorageClass(LLVMValueRef global);

    void LLVMSetDLLStorageClass(LLVMValueRef global, LLVMDLLStorageClass dll);

    LLVMUnnamedAddr LLVMGetUnnamedAddress(LLVMValueRef global);

    void LLVMSetUnnamedAddress(LLVMValueRef global, LLVMUnnamedAddr addr);

    /++
     + Returns the "value type" of a global value.
     +
     + This differs from the formal type of a global value which is always a pointer type
     +/
    LLVMTypeRef LLVMGlobalGetValueType(LLVMValueRef global);

    /++
     + Deprecated: Use `LLVMGetUnnamedAddress` instead
     +/
    LLVMBool LLVMHasUnnamedAddr(LLVMValueRef global);

    /++
     + Deprecated: Use LLVMSetUnnamedAddress instead
     +/
    void LLVMSetUnnamedAddr(LLVMValueRef global, LLVMBool hasUnnamedAddr);

    /++
     + Obtain the preferred alignment of the value
     +/
    uint LLVMGetAlignment(LLVMValueRef value);

    /++
     + Set the preferred alignment of the value
     +/
    void LLVMSetAlignment(LLVMValueRef value, uint bytes);

    /++
     + Sets a metadata attachment, erasing the existing metadata attachment if it already exists for the given kind
     +/
    void LLVMGlobalSetMetadata(LLVMValueRef global, uint kind, LLVMMetadataRef metadata);

    /++
     + Erases a metadata attachment of the given kind if it exists
     +/
    void LLVMGlobalEraseMetadata(LLVMValueRef global, uint kind);

    /++
     + Removes all metadata attachments from this value
     +/
    void LLVMGlobalClearMetadata(LLVMValueRef global);

    /++
     + Retrieves an array of metadata entries representing the metadata attached to this value
     +
     + The caller is responsible for freeing this array by calling `LLVMDisposeValueMetadataEntries`
     +/
    LLVMValueMetadataEntry* LLVMGlobalCopyAllMetadata(LLVMValueRef value, size_t* entriesCount);

    /++
     + Destroys value metadata entries
     +/
    void LLVMDisposeValueMetadataEntries(LLVMValueMetadataEntry* entries);

    /++
     + Returns the kind of a value metadata entry at a specific index
     +/
    uint LLVMValueMetadataEntriesGetKind(LLVMValueMetadataEntry* entries, uint index);

    /++
     + Returns the underlying metadata node of a value metadata entry at a specific index
     +/
    LLVMMetadataRef LLVMValueMetadataEntriesGetMetadata(LLVMValueMetadataEntry* entries, uint index);
}