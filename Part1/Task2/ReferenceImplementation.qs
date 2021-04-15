namespace QCHack.Task2 {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    // Task 2. Check that colors don't form a triangle
    // Inputs:
    //      1) a 3-qubit array `inputs`,
    //      2) a qubit `output`.
    // Goal: Flip the output qubit if and only if at least two of the input qubits are different.
    // For example, for the result of applying the operation to state (|001⟩ + |110⟩ + |111⟩) ⊗ |0⟩
    // will be |001⟩ ⊗ |1⟩ + |110⟩ ⊗ |1⟩ + |111⟩ ⊗ |0⟩.
    operation Task2_ValidTriangle_Reference (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        // We don't want to mark only all 0s and all 1s - mark them and flip
        (ControlledOnInt(0, X))(inputs, output);
        Controlled X(inputs, output);
        X(output);
    }
}
