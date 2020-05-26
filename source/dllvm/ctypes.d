module dllvm.ctypes;

// Source: https://llvm.org/doxygen/group__LLVMCSupportTypes.html

alias LLVMBool = int;

/++
 +
 +/
struct LLVMOpaqueContext;
alias LLVMContextRef = LLVMOpaqueContext*;

/++
 +
 +/
struct LLVMOpaqueModule;
alias LLVMModuleRef = LLVMOpaqueModule*;

/++
 +
 +/
struct LLVMOpaqueType;
alias LLVMTypeRef = LLVMOpaqueType*;

/++
 +
 +/
struct LLVMOpaqueValue;
alias LLVMValueRef = LLVMOpaqueValue*;

/++
 +
 +/
struct LLVMOpaqueBasicBlock;
alias LLVMBasicBlockRef = LLVMOpaqueBasicBlock*;

/++
 +
 +/
struct LLVMOpaqueMetadata;
alias LLVMMetadataRef = LLVMOpaqueMetadata*;

/++
 +
 +/
struct LLVMOpaqueNamedMDNode;
alias LLVMNamedMDNodeRef = LLVMOpaqueNamedMDNode*;

/++
 +
 +/
struct LLVMOpaqueValueMetadataEntry;
alias LLVMValueMetadataEntry = LLVMOpaqueValueMetadataEntry*;

/++
 +
 +/
struct LLVMOpaqueBuilder;
alias LLVMBuilderRef = LLVMOpaqueBuilder*;

/++
 +
 +/
struct LLVMOpaqueDIBuilder;
alias LLVMDIBuilderRef = LLVMOpaqueDIBuilder*;

/++
 +
 +/
struct LLVMOpaqueModuleProvider;
alias LLVMModuleProviderRef = LLVMOpaqueModuleProvider*;

/++
 +
 +/
struct LLVMOpaqueMemoryBuffer;
alias LLVMMemoryBufferRef = LLVMOpaqueMemoryBuffer*;

/++
 +
 +/
struct LLVMOpaquePassManager;
alias LLVMPassManagerRef = LLVMOpaquePassManager*;

/++
 +
 +/
struct LLVMOpaquePassRegistry;
alias LLVMPassRegistryRef = LLVMOpaquePassRegistry*;

/++
 +
 +/
struct LLVMOpaqueUse;
alias LLVMUseRef = LLVMOpaqueUse*;

/++
 +
 +/
struct LLVMOpaqueAttributeRef;
alias LLVMAttributeRef = LLVMOpaqueAttributeRef*;

/++
 +
 +/
struct LLVMOpaqueDiagnosticInfo;
alias LLVMDiagnosticInfoRef = LLVMOpaqueDiagnosticInfo*;

/++
 +
 +/
struct LLVMComdat;
alias LLVMComdatRef = LLVMComdat*;

/++
 +
 +/
struct LLVMOpaqueModuleFlagEntry;
alias LLVMModuleFlagEntry = LLVMOpaqueModuleFlagEntry;

/++
 +
 +/
struct LLVMOpaqueJITEventListener;
alias LLVMJITEventListenerRef = LLVMOpaqueJITEventListener*;

/++
 +
 +/
struct LLVMOpaqueBinary;
alias LLVMBinaryRef = LLVMOpaqueBinary*;