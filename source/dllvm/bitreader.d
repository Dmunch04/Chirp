module dllvm.bitreader;

// Source: https://llvm.org/doxygen/group__LLVMCBitReader.html

import dllvm.ctypes;

extern(C)
{
    LLVMBool LLVMParseBitcode(LLVMMemoryBufferRef memBuf, LLVMModuleRef* outModule, char** outMessage);

    LLVMBool LLVMParseBitcode2(LLVMMemoryBufferRef memBuf, LLVMModuleRef* outModule);

    LLVMBool LLVMParseBitcodeInContext(LLVMContextRef ctx, LLVMMemoryBufferRef memBuf, LLVMModuleRef *outModule, char** outMessage);

    LLVMBool LLVMParseBitcodeInContext2(LLVMContextRef ctx, LLVMMemoryBufferRef memBuf, LLVMModuleRef* outModule);

    /++
     + Reads a module from the specified path, returning via the OutMP parameter a module provider which performs lazy deserialization
     +
     + Returns 0 on success. Optionally returns a human-readable error message via OutMessage
     +
     + Deprecated: use `LLVMGetBitcodeModuleInContext2` instead
     +/
    deprecated LLVMBool LLVMGetBitcodeModuleInContext(LLVMContextRef ctx, LLVMMemoryBufferRef memBuf, LLVMModuleRef* outModule, char** outMessage);

    /++
     + Reads a module from the specified path, returning via the OutMP parameter a module provider which performs lazy deserialization
     +
     + Returns: 0 on success
     +/
    LLVMBool LLVMGetBitcodeModuleInContext2(LLVMContextRef ctx, LLVMMemoryBufferRef memBuf, LLVMModuleRef *outModule);

    LLVMBool LLVMGetBitcodeModule(LLVMMemoryBufferRef memBuf, LLVMModuleRef* outModule, char** outMessage);

    LLVMBool LLVMGetBitcodeModule2(LLVMMemoryBufferRef memBuf, LLVMModuleRef* outModule);
}