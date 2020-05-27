module dllvm.core.values.constants.functions;

// Source: https://llvm.org/doxygen/group__LLVMCCoreValueFunction.html

import dllvm.ctypes;
import dllvm.core.enums;

extern(C)
{
    /++
     + Remove a function from its containing module and deletes it
     +/
    void LLVMDeleteFunction(LLVMValueRef fn);

    /++
     + Check whether the given function has a personality function
     +/
    LLVMBool LLVMHasPersonalityFn(LLVMValueRef fn);

    /++
     + Obtain the personality function attached to the function
     +/
    LLVMValueRef LLVMGetPersonalityFn(LLVMValueRef fn);

    /++
     + Set the personality function attached to the function
     +/
    void LLVMSetPersonalityFn(LLVMValueRef fn, LLVMValueRef personalityFn);

    /++
     + Obtain the intrinsic ID number which matches the given function name
     +/
    uint LLVMLookupIntrinsicID(const(char*) name, size_t nameLength);

    /++
     + Obtain the ID number from a function instance
     +/
    uint LLVMGetIntrinsicID(LLVMValueRef fn);

    /++
     + Create or insert the declaration of an intrinsic
     +
     + For overloaded intrinsics, parameter types must be provided to uniquely identify an overload
     +/
    LLVMValueRef LLVMGetIntrinsicDeclaration(LLVMModuleRef mod, uint id, LLVMTypeRef* paramTypes, size_t paramCount);

    /++
     + Retrieves the type of an intrinsic
     +
     + For overloaded intrinsics, parameter types must be provided to uniquely identify an overload
     +/
    LLVMTypeRef LLVMIntrinsicGetType(LLVMContextRef ctx, uint id, LLVMTypeRef* paramTypes, size_t paramCount);

    /++
     + Retrieves the name of an intrinsic
     +/
    const(char*) LLVMIntrinsicGetName(uint id, size_t* nameLength);

    /++
     + Copies the name of an overloaded intrinsic identified by a given list of parameter types
     +
     + Unlike `LLVMIntrinsicGetName`, the caller is responsible for freeing the returned string
     +/
    const(char*) LLVMIntrinsicCopyOverloadedName(uint id, LLVMTypeRef* paramTypes, size_t paramCount, size_t* nameLength);

    /++
     + Obtain if the intrinsic identified by the given ID is overloaded
     +/
    LLVMBool LLVMIntrinsicIsOverloaded(uint id);

    /++
     + Obtain the calling function of a function
     +
     + The returned value corresponds to the `LLVMCallConv` enumeration
     +/
    uint LLVMGetFunctionCallConv(LLVMValueRef fn);

    /++
     + Set the calling convention of a function
     +/
    void LLVMSetFunctionCallConv(LLVMValueRef fn, uint callingConvention);

    /++
     + Obtain the name of the garbage collector to use during code generation
     +/
    const(char*) LLVMGetGC(LLVMValueRef fn);

    /++
     + Define the garbage collector to use during code generation
     +/
    void LLVMSetGC(LLVMValueRef fn, const(char*) name);

    /++
     + Add an attribute to a function
     +/
    void LLVMAddAttributeAtIndex(LLVMValueRef fn, LLVMAttributeIndex index, LLVMAttributeRef attr);

    uint LLVMGetAttributeCountAtIndex(LLVMValueRef fn, LLVMAttributeIndex index);

    void LLVMGetAttributesAtIndex(LLVMValueRef fn, LLVMAttributeIndex index, LLVMAttributeRef* attrs);

    LLVMAttributeRef LLVMGetEnumAttributeAtIndex(LLVMValueRef fn, LLVMAttributeIndex index, uint kindId);

    LLVMAttributeRef LLVMGetStringAttributeAtIndex(LLVMValueRef fn, LLVMAttributeIndex index, const(char*) k, uint kLength);

    void LLVMRemoveEnumAttributeAtIndex(LLVMValueRef fn, LLVMAttributeIndex index, uint kindId);

    void LLVMRemoveStringAttributeAtIndex(LLVMValueRef fn, LLVMAttributeIndex index, const(char*) k, uint kLength);

    /++
     + Add a target-dependent attribute to a function
     +/
    void LLVMAddTargetDependentFunctionAttr(LLVMValueRef fn, const(char*) a, const(char*) v);
}