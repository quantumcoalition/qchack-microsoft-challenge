namespace QCHack.Task3 {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    // Task 3. Check that colors don't form a triangle
    // Inputs:
    //      1) a 3-qubit array `inputs`,
    //      2) a qubit `output`.
    // Goal: Flip the output qubit if and only if at least two of the input qubits are different.
    // For example, for the result of applying the operation to state (|001⟩ + |110⟩ + |111⟩) ⊗ |0⟩
    // will be |001⟩ ⊗ |1⟩ + |110⟩ ⊗ |1⟩ + |111⟩ ⊗ |0⟩.
    operation Task3_ValidTriangle_Reference (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        // We cannot just enumerate all the inputs for which f(x) = 1, so need to do some computation
        within {
            CNOT(inputs[1], inputs[0]);
            CNOT(inputs[1], inputs[2]);
        } apply {
            Controlled X([inputs[0], inputs[2]], output);
            CNOT(inputs[0], output);
            CNOT(inputs[2], output);
        }
    }
}
