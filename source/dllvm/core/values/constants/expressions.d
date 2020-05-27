module dllvm.core.values.constants.expressions;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueConstantExpressions.html

import dllvm.ctypes;
import dllvm.core.enums;

extern(C)
{
    LLVMOpcode LLVMGetConstOpcode(LLVMValueRef value);

    LLVMValueRef LLVMAlignOf(LLVMTypeRef ty);

    LLVMValueRef LLVMSizeOf(LLVMTypeRef ty);

    LLVMValueRef LLVMConstNeg(LLVMValueRef value);

    LLVMValueRef LLVMConstNSWNeg(LLVMValueRef value);

    LLVMValueRef LLVMConstNUWNeg(LLVMValueRef value);

    LLVMValueRef LLVMConstFNeg(LLVMValueRef value);

    LLVMValueRef LLVMConstNot(LLVMValueRef value);

    LLVMValueRef LLVMConstAdd(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstNSWAdd(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstNUWAdd(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstFAdd(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstSub(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstNSWSub(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstNUWSub(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstFSub(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstMul(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstNSWMul(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstNUWMul(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstFMul(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstUDiv(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstExactUDiv(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstSDiv(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstExactSDiv(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstFDiv(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstURem(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstSRem(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstFRem(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstAnd(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstOr(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstXor(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstICmp(LLVMIntPredicate predicate, LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstFCmp(LLVMRealPredicate predicate, LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstShl(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstLShr(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstAShr(LLVMValueRef left, LLVMValueRef right);

    LLVMValueRef LLVMConstGEP(LLVMValueRef value, LLVMValueRef* constantIndices, uint indicesCount);

    LLVMValueRef LLVMConstGEP2(LLVMTypeRef ty, LLVMValueRef value, LLVMValueRef* constantIndices, uint indicesCount);

    LLVMValueRef LLVMConstInBoundsGEP(LLVMValueRef value, LLVMValueRef* constantIndices, uint indicesCount);

    LLVMValueRef LLVMConstInBoundsGEP2(LLVMTypeRef ty, LLVMValueRef value, LLVMValueRef* constantIndices, uint indicesCount);

    LLVMValueRef LLVMConstTrunc(LLVMValueRef value, LLVMTypeRef toType);

    LLVMValueRef LLVMConstSExt(LLVMValueRef value, LLVMTypeRef toType);

    LLVMValueRef LLVMConstZExt(LLVMValueRef value, LLVMTypeRef toType);

    LLVMValueRef LLVMConstFPTrunc(LLVMValueRef value, LLVMTypeRef toType);

    LLVMValueRef LLVMConstFPExt(LLVMValueRef value, LLVMTypeRef toType);

    LLVMValueRef LLVMConstUIToFP(LLVMValueRef value, LLVMTypeRef toType);

    LLVMValueRef LLVMConstSIToFP(LLVMValueRef value, LLVMTypeRef toType);

    LLVMValueRef LLVMConstFPToUI(LLVMValueRef value, LLVMTypeRef toType);

    LLVMValueRef LLVMConstFPToSI(LLVMValueRef value, LLVMTypeRef toType);

    LLVMValueRef LLVMConstPtrToInt(LLVMValueRef value, LLVMTypeRef toType);

    LLVMValueRef LLVMConstIntToPtr(LLVMValueRef value, LLVMTypeRef toType);

    LLVMValueRef LLVMConstBitCast(LLVMValueRef value, LLVMTypeRef toType);

    // TODO: Add the few rest
}