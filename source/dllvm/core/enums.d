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
alias LLVMIntPredicate = int;
alias LLVMRealPredicate = int;
alias LLVMLandingPadClauseTy = int;
alias LLVMThreadLocalMode = int;
alias LLVMAtomicOrdering = int;
alias LLVMAtomicRMWBinOp = int;
alias LLVMDiagnosticSeverity = int;
alias LLVMInlineAsmDialect = int;
alias LLVMModuleFlagBehavior = int;

enum : LLVMOpcode
{
    LLVMRet             = 1,
    LLVMBr              = 2,
    LLVMSwitch          = 3,
    LLVMIndirectBr      = 4,
    LLVMInvoke          = 5,
    LLVMUnreachable     = 7,
    LLVMCallBr          = 67,
    LLVMFNeg            = 66,
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
    LLVMAddrSpaceCast   = 60,
    LLVMICmp            = 32,
}