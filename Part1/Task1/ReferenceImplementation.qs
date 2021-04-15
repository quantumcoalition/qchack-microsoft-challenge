namespace QCHack.Task1 {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    // Task 1. Check that x is divisible by 4
    // Inputs:
    //      1) an N-qubit array `inputs`,
    //      2) a qubit `output`.
    // Goal: Flip the output qubit if and only if the number written in the array `inputs`
    //      (in little-endian encoding) is divisible by 4.
    // For example, for the result of applying the operation to state (|000⟩ + |101⟩ + |111⟩) ⊗ |0⟩
    // will be |001⟩ ⊗ |1⟩ + |101⟩ ⊗ |0⟩ + |111⟩ ⊗ |0⟩.
    operation Task1_DivisibleByFour_Reference (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        // The first two qubits must be in 00 state
        (ControlledOnInt(0, X))(inputs[0 .. 1], output);
    }
}
