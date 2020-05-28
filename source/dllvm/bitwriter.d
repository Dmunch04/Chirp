module dllvm.bitwriter;

// Source: https://llvm.org/doxygen/group__LLVMCBitWriter.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Writes a module to the specified path
     +
     + Returns: 0 on success
     +/
    int LLVMWriteBitcodeToFile(LLVMModuleRef mod, const(char*) path);

    /++
     + Writes a module to an open file descriptor
     +
     + Returns: 0 on success
     +/
    int LLVMWriteBitcodeToFD(LLVMModuleRef mod, int fd, int shouldClose, int unbuffered);

    /++
     + Deprecated for LLVMWriteBitcodeToFD
     +
     + Writes a module to an open file descriptor. Closes the handle
     +
     + Returns: 0 on success. 
     +/
    int LLVMWriteBitcodeToFileHandle(LLVMModuleRef mod, int handle);

    /++
     + Writes a module to a new memory buffer and returns it
     +/
    LLVMMemoryBufferRef LLVMWriteBitcodeToMemoryBuffer(LLVMModuleRef mod);
}