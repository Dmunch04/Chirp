module dllvm.core.enums;

alias LLVMAttributeIndex = uint;

alias LLVMOpcode = int;
alias LLVMTypeKind = int;
alias LLVMLinkage = int;
alias LLVMVisibility = int;
alias LLVMUnnamedAddr = int;
alias LLVMDLLStorageClass = int;
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
    /// Externally visible function
    LLVMExternalLinkage,

    LLVMAvailableExternallyLinkage,

    /// Keep one copy of function when linking (inline)
    LLVMLinkOnceAnyLinkage,

    /// Same, but only replaced by something equivalent
    LLVMLinkOnceODRLinkage,

    /// Obsolete
    LLVMLinkOnceODRAutoHideLinkage,

    /// Keep one copy of function when linking (weak)
    LLVMWeakAnyLinkage,

    /// Same as `LLVMWeakAnyLinkage`, but only replaced by something equivalent
    LLVMWeakODRLinkage,

    /// Special purpose, only applies to global arrays
    LLVMAppendingLinkage,

    /// Rename collisions when linking (static functions)
    LLVMInternalLinkage,

    /// Like Internal, but omit from symbol table
    LLVMPrivateLinkage,

    /// Obsolete
    LLVMDLLImportLinkage,

    /// Obsolete
    LLVMDLLExportLinkage,

    /// ExternalWeak linkage description
    LLVMExternalWeakLinkage,

    /// Obsolete
    LLVMGhostLinkage,

    /// Tentative definitions
    LLVMCommonLinkage,

    /// Like Private, but linker removes
    LLVMLinkerPrivateLinkage,

    /// Like LinkerPrivate, but is weak
    LLVMLinkerPrivateWeakLinkage
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

enum : LLVMDLLStorageClass
{
    LLVMDefaultStorageClass,

    /// Function to be imported from DLL
    LLVMDLLImportStorageClass,

    /// Function to be accessible from DLL
    LLVMDLLExportStorageClass
}

enum : LLVMCallConv
{
    LLVMCCallConv               = 0,
    LLVMFastCallConv            = 8,
    LLVMColdCallConv            = 9,
    LLVMGHCCallConv             = 10,
    LLVMHiPECallConv            = 11,
    LLVMWebKitJSCallConv        = 12,
    LLVMAnyRegCallConv          = 13,
    LLVMPreserveMostCallConv    = 14,
    LLVMPreserveAllCallConv     = 15,
    LLVMSwiftCallConv           = 16,
    LLVMCXXFASTTLSCallConv      = 17,
    LLVMX86StdcallCallConv      = 64,
    LLVMX86FastcallCallConv     = 65,
    LLVMARMAPCSCallConv         = 66,
    LLVMARMAAPCSCallConv        = 67,
    LLVMARMAAPCSVFPCallConv     = 68,
    LLVMMSP430INTRCallConv      = 69,
    LLVMX86ThisCallCallConv     = 70,
    LLVMPTXKernelCallConv       = 71,
    LLVMPTXDeviceCallConv       = 72,
    LLVMSPIRFUNCCallConv        = 75,
    LLVMSPIRKERNELCallConv      = 76,
    LLVMIntelOCLBICallConv      = 77,
    LLVMX8664SysVCallConv       = 78,
    LLVMWin64CallConv           = 79,
    LLVMX86VectorCallCallConv   = 80,
    LLVMHHVMCallConv            = 81,
    LLVMHHVMCCallConv           = 82,
    LLVMX86INTRCallConv         = 83,
    LLVMAVRINTRCallConv         = 84,
    LLVMAVRSIGNALCallConv       = 85,
    LLVMAVRBUILTINCallConv      = 86,
    LLVMAMDGPUVSCallConv        = 87,
    LLVMAMDGPUGSCallConv        = 88,
    LLVMAMDGPUPSCallConv        = 89,
    LLVMAMDGPUCSCallConv        = 90,
    LLVMAMDGPUKERNELCallConv    = 91,
    LLVMX86RegCallCallConv      = 92,
    LLVMAMDGPUHSCallConv        = 93,
    LLVMMSP430BUILTINCallConv   = 94,
    LLVMAMDGPULSCallConv        = 95,
    LLVMAMDGPUESCallConv        = 96
}

enum : LLVMValueKind
{
    LLVMArgumentValueKind,
	LLVMBasicBlockValueKind,
	LLVMMemoryUseValueKind,
	LLVMMemoryDefValueKind,
	LLVMMemoryPhiValueKind,
	LLVMFunctionValueKind,
	LLVMGlobalAliasValueKind,
	LLVMGlobalIFuncValueKind,
	LLVMGlobalVariableValueKind,
	LLVMBlockAddressValueKind,
	LLVMConstantExprValueKind,
	LLVMConstantArrayValueKind,
	LLVMConstantStructValueKind,
	LLVMConstantVectorValueKind,
	LLVMUndefValueValueKind,
	LLVMConstantAggregateZeroValueKind,
	LLVMConstantDataArrayValueKind,
	LLVMConstantDataVectorValueKind,
	LLVMConstantIntValueKind,
	LLVMConstantFPValueKind,
	LLVMConstantPointerNullValueKind,
	LLVMConstantTokenNoneValueKind,
	LLVMMetadataAsValueValueKind,
	LLVMInlineAsmValueKind,
	LLVMInstructionValueKind
}

enum : LLVMIntPredicate
{
    /// Equal
    LLVMIntEQ = 32,

    /// Not equal
    LLVMIntNE,

    /// Unsigned greater than
    LLVMIntUGT,

    /// Unsigned greater or equal
    LLVMIntUGE,

    /// Unsigned less than
    LLVMIntULT,

    /// Unsigned less or equal
    LLVMIntULE,

    /// Signed greater than
    LLVMIntSGT,

    /// Signed greater or equal
    LLVMIntSGE,

    /// Signed less than
    LLVMIntSLT,

    /// Signed less or equal
    LLVMIntSLE
}

enum : LLVMRealPredicate
{
    /// Always false (always folded)
    LLVMRealPredicateFalse,

    /// True if ordered and equal
    LLVMRealOEQ,

    /// True if ordered and greater than
    LLVMRealOGT,

    /// True if ordered and greater than or equal
    LLVMRealOGE,

    /// True if ordered and less than
    LLVMRealOLT,

    /// True if ordered and less than or equal
    LLVMRealOLE,

    /// True if ordered and operands are unequal
    LLVMRealONE,

    /// True if ordered (no nans)
    LLVMRealORD,

    /// True if unordered: isnan(X) | isnan(Y)
    LLVMRealUNO,

    /// True if unordered or equal
    LLVMRealUEQ,

    /// True if unordered or greater than
    LLVMRealUGT,

    /// True if unordered, greater than, or equal
    LLVMRealUGE,

    /// True if unordered or less than
    LLVMRealULT,

    /// True if unordered, less than, or equal
    LLVMRealULE,

    /// True if unordered or not equal
    LLVMRealUNE,

    /// Always true (always folded)
    LLVMRealPredicateTrue
}

enum : LLVMLandingPadClauseTy
{
    /// A catch clause
    LLVMLandingPadCatch,

    /// A filter clause
    LLVMLandingPadFilter
}

enum : LLVMThreadLocalMode
{
    LLVMNotThreadLocal = 0,
    LLVMGeneralDynamicTLSModel,
    LLVMLocalDynamicTLSModel,
    LLVMInitialExecTLSModel,
    LLVMLocalExecTLSModel
}

enum : LLVMAtomicOrdering
{
    /// A load or store which is not atomic
    LLVMAtomicOrderingNotAtomic                 = 0,

    /// Lowest level of atomicity, guarantees somewhat sane results, lock free
    LLVMAtomicOrderingUnordered                 = 1,

    /// Guarantees that if you take all the operations affecting a specific address, a consistent ordering exists
    LLVMAtomicOrderingMonotonic                 = 2,

    /// Acquire provides a barrier of the sort necessary to acquire a lock to access other memory with normal loads and stores
    LLVMAtomicOrderingAcquire                   = 4,

    /// Release is similar to Acquire, but with a barrier of the sort necessary to release a lock
    LLVMAtomicOrderingRelease                   = 5,

    /// Provides both an Acquire and a Release barrier (for fences and operations which both read and write memory)
    LLVMAtomicOrderingAcquireRelease            = 6,

    /++
     + Provides Acquire semantics for loads and Release semantics for stores
     +
     + Additionally, it guarantees that a total ordering exists between all SequentiallyConsistent operations
     +/
    LLVMAtomicOrderingSequentiallyConsistent    = 7
}

enum : LLVMAtomicRMWBinOp
{
    /// Set the new value and return the one old
    LLVMAtomicRMWBinOpXchg,

    /// Add a value and return the old one
    LLVMAtomicRMWBinOpAdd,

    /// Subtract a value and return the old one
    LLVMAtomicRMWBinOpSub,

    /// And a value and return the old one
    LLVMAtomicRMWBinOpAnd,

    /// Not-And a value and return the old one
    LLVMAtomicRMWBinOpNand,

    /// OR a value and return the old one
    LLVMAtomicRMWBinOpOr,

    /// Xor a value and return the old one
    LLVMAtomicRMWBinOpXor,

    /// Sets the value if it's greater than the original using a signed comparison and return the old one
    LLVMAtomicRMWBinOpMax,

    /// Sets the value if it's Smaller than the original using a signed comparison and return the old one
    LLVMAtomicRMWBinOpMin,

    /// Sets the value if it's greater than the original using an unsigned comparison and return the old one
    LLVMAtomicRMWBinOpUMax,

    /// Sets the value if it's greater than the original using an unsigned comparison and return the old one
    LLVMAtomicRMWBinOpUMin,

    /// Add a floating point value and return the old one
    LLVMAtomicRMWBinOpFAdd,

    /// Subtract a floating point value and return the old one
    LLVMAtomicRMWBinOpFSub
}

enum : LLVMDiagnosticSeverity
{
    LLVMDSError,
    LLVMDSWarning,
    LLVMDSRemark,
    LLVMDSNote
}

enum : LLVMInlineAsmDialect
{
    LLVMInlineAsmDialectATT,
    LLVMInlineAsmDialectIntel
}

enum : LLVMModuleFlagBehavior
{
    /// Emits an error if two values disagree, otherwise the resulting value is that of the operands
    LLVMModuleFlagBehaviorError,

    /++
     + Emits a warning if two values disagree.
     +
     + The result value will be the operand for the flag from the first module being linked.
     +/
    LLVMModuleFlagBehaviorWarning,

    /++
     + Adds a requirement that another module flag be present and have a specified value after linking is performed
     +
     + The value must be a metadata pair, where the first element of the pair is the ID of the module flag to be restricted,
     + and the second element of the pair is the value the module flag should be restricted to.
     + This behavior can be used to restrict the allowable results (via triggering of an error) of linking IDs with the Override behavior
     +/
    LLVMModuleFlagBehaviorRequire,

    /++
     + Uses the specified value, regardless of the behavior or value of the other module
     +
     + If both modules specify Override, but the values differ, an error will be emitted
     +/
    LLVMModuleFlagBehaviorOverride,

    /// Appends the two values, which are required to be metadata nodes
    LLVMModuleFlagBehaviorAppend,

    /++
     + Appends the two values, which are required to be metadata nodes
     +
     + However, duplicate entries in the second list are dropped during the append operation
     +/
    LLVMModuleFlagBehaviorAppendUnique
}