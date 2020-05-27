module dllvm.core.enums;

alias LLVMAttribute = long;
alias LLVMAttributeIndex = uint;
alias LLVMOpcode = int;
alias LLVMTypeKind = int;
alias LLVMLinkage = int;
alias LLVMVisibility = int;
alias LLVMUnnamedAddr = int;
alias LLVMDLLStorageCall = int;
alias LLVMCallConv = int;
alias LLVMValueKind = int;
alias LLVMIntPredicate = int;
alias LLVMRealPredicate = int;
alias LLVMLandingPadClauseTy = int;
alias LLVMThreadLocalMode = int;
alias LLVMAtomicOrdering = int;
alias LLVMAtomicRMWBinOp = int;
alias LLVMDiagnosticSeverity = int;
alias LLVMInlineAsmDialect = int;
alias LLVMModuleFlagBehavior = int;

enum : uint
{
    LLVMAttributeReturnIndex    = 0,
    LLVMAttributeFunctionIndex  = -1
}

enum : LLVMOpcode
{
    LLVMRet             = 1,
    LLVMBr              = 2,
    LLVMSwitch          = 3,
    LLVMIndirectBr      = 4,
    LLVMInvoke          = 5,
    LLVMUnreachable     = 7,
    LLVMAdd             = 8,
    LLVMFAdd            = 9,
    LLVMSub             = 10,
    LLVMFSub            = 11,
    LLVMMul             = 12,
    LLVMFMul            = 13,
    LLVMUDiv            = 14,
    LLVMSDiv            = 15,
    LLVMFDiv            = 16,
    LLVMURem            = 17,
    LLVMSRem            = 18,
    LLVMFRem            = 19,
    LLVMShl             = 20,
    LLVMLShr            = 21,
    LLVMAShr            = 22,
    LLVMAnd             = 23,
    LLVMOr              = 24,
    LLVMXor             = 25,
    LLVMAlloca          = 26,
    LLVMLoad            = 27,
    LLVMStore           = 28,
    LLVMGetElementPtr   = 29,
    LLVMTrunc           = 30,
    LLVMZExt            = 31,
    LLVMSExt            = 32,
    LLVMFPToUI          = 33,
    LLVMFPToSI          = 34,
    LLVMUIToFP          = 35,
    LLVMSIToFP          = 36,
    LLVMFPTrunc         = 37,
    LLVMFPExt           = 38,
    LLVMPtrToInt        = 39,
    LLVMIntToPtr        = 40,
    LLVMBitCast         = 41,
    LLVMICmp            = 42,
    LLVMFCmp            = 43,
    LLVMPHI             = 44,
    LLVMCall            = 45,
    LLVMSelect          = 46,
    LLVMUserOp1         = 47,
    LLVMUserOp2         = 48,
    LLVMVAArg           = 49,
    LLVMExtractElement  = 50,
    LLVMInsertElement   = 51,
    LLVMShuffleVector   = 52,
    LLVMExtractValue    = 53,
    LLVMInsertValue     = 54,
    LLVMFence           = 55,
    LLVMAtomicCmpXchg   = 56,
    LLVMAtomicRMW       = 57,
    LLVMResume          = 58,
    LLVMLandingPad      = 59,
    LLVMAddrSpaceCast   = 60,
    LLVMCleanupRet      = 61,
    LLVMCatchRet        = 62,
    LLVMCatchPad        = 63,
    LLVMCleanupPad      = 64,
    LLVMCatchSwitch     = 65,
    LLVMFNeg            = 66,
    LLVMCallBr          = 67,
    LLVMFreeze          = 68
}

enum : LLVMTypeKind
{
    /// Type with no size
    LLVMVoidTypeKind,

    /// 16 bit floating point type
    LLVMHalfTypeKind,

    /// 16 bit brain floating point type
    LLVMBFloatTypeKind,

    /// 32 bit floating point type
    LLVMFloatTypeKind,

    /// 64 bit floating point type
    LLVMDoubleTypeKind,

    /// 80 bit floating point type (X87)
    LLVMX86_FP80TypeKind,

    /// 128 bit floating point type (112-bit mantissa)
    LLVMFP128TypeKind,

    /// 128 bit floating point type (two 64-bits)
    LLVMPPC_FP128TypeKind,

    /// Labels
    LLVMLabelTypeKind,

    /// Arbitrary bit width integers
    LLVMIntegerTypeKind,

    /// Functions
    LLVMFunctionTypeKind,

    /// Structures
    LLVMStructTypeKind,

    /// Arrays
    LLVMArrayTypeKind,

    /// Pointers
    LLVMPointerTypeKind,

    /// Fixed width SIMD vector type
    LLVMVectorTypeKind,

    /// Metadata
    LLVMMetadataTypeKind,

    /// X86 MMX
    LLVMX86_MMXTypeKind,

    /// Tokens
    LLVMTokenTypeKind,

    /// Scalable SIMD vector type
    LLVMScalableVectorTypeKind
}

enum : LLVMLinkage
{
    LLVMExternalLinkage
}

enum : LLVMVisibility
{
    /// The GV is visible
    LLVMDefaultVisibility,

    /// The GV is hidden
    LLVMHiddenVisibility,

    /// The GV is protected
    LLVMProtectedVisibility
}

enum : LLVMUnnamedAddr
{
    /// Address of the GV is significant
    LLVMNoUnnamedAddr,

    /// Address of the GV is locally insignificant
    LLVMLocalUnnamedAddr,

    /// Address of the GV is globally insignificant
    LLVMGlobalUnnamedAddr
}

enum : LLVMDLLStorageCall
{
    LLVMDefaultStorageClass,

    /// Function to be imported from DLL
    LLVMDLLImportStorageClass,

    /// Function to be accessible from DLL
    LLVMDLLExportStorageClass
}

enum : LLVMCallConv
{
    LLVMCCallConv = 0
}

enum : LLVMValueKind
{
    LLVMArgumentValueKind
}