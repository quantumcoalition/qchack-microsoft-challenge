namespace QCHack.Task2 {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    // Task 2 (2 points). f(x) = 1 if at least two of three input bits are different - easy version
    //
    // Inputs:
    //      1) a 3-qubit array "inputs",
    //      2) a qubit "output".
    // Goal: Implement a marking oracle for function f(x) = 1 if at least two of the three bits of x are different.
    //       That is, if both inputs are in a basis state, flip the state of the output qubit 
    //       if and only if the three bits written in the array "inputs" have both 0 and 1 among them,
    //       and leave the state of the array "inputs" unchanged.
    //       The effect of the oracle on superposition states should be defined by its linearity.
    //       Don't use measurements; the implementation should use only X gates and its controlled variants.
    //       This task will be tested using ToffoliSimulator.
    // 
    // For example, the result of applying the operation to state (|001⟩ + |110⟩ + |111⟩)/√3 ⊗ |0⟩
    // will be 1/√3|001⟩ ⊗ |1⟩ + 1/√3|110⟩ ⊗ |1⟩ + 1/√3|111⟩ ⊗ |0⟩.
    //
    operation Task2_ValidTriangle (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        let PatternOne = ControlledOnBitString([true, true, false], X);
        let PatternTwo = ControlledOnBitString([true, false, false], X);
        let PatternThree = ControlledOnBitString([true, false, true], X);
        let PatternFour = ControlledOnBitString([false, true, true], X);
        let PatternFive = ControlledOnBitString([false, true, false], X);
        let PatternSix = ControlledOnBitString([false, false, true], X);

        PatternOne(inputs,output);
        PatternTwo(inputs,output);
        PatternThree(inputs,output);
        PatternFour(inputs,output);
        PatternFive(inputs,output);
        PatternSix(inputs,output);
    }
}

