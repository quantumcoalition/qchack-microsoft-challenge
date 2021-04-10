namespace QCHack.Task3 {
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Logical;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;

    open Quantum.Kata.Utils;


    internal operation VerifySingleOutputFunction(numInputs : Int, op : ((Qubit[], Qubit) => Unit is Adj+Ctl), predicate : (Int -> Bool)) : Unit {
        for assignment in 0 .. 2^numInputs - 1 {
            use (inputs, output) = (Qubit[numInputs], Qubit());
            within {
                ApplyXorInPlace(assignment, LittleEndian(inputs));
                AllowAtMostNCallsCA(0, Measure, "You are not allowed to use measurements");
            } apply {
                ResetNQubitOpCount();
                
                op(inputs, output);

                // Take into account that CCNOT is NOT natively implemented on Toffoli simulator,
                // so it counts as two three-qubit gates - CCNOT and Controlled X.
                // ApplyAnd has the same implementation.
                let op3 = GetExactlyNQubitOpCount(3) - GetOracleCallsCount(CCNOT) - GetOracleCallsCount(ApplyAnd);
                // Message($"{GetExactlyNQubitOpCount(3)} - {GetOracleCallsCount(CCNOT)} - {GetOracleCallsCount(ApplyAnd)} = {op3}");

                // One 4-qubit operation goes for calling op itself and should be allowed
                let op4plus = GetNPlusQubitOpCount(4) - 1;

                Fact(op3 <= 1, $"You are allowed to use at most one 3-qubit gate, and you used {op3}");
                Fact(op4plus == 0, $"You are not allowed to use gates with 4 or more qubits, and you used {op4plus}");
            }

            // Check that the result is expected
            let actual = ResultAsBool(MResetZ(output));
            let expected = predicate(assignment);
            Fact(actual == expected,
                $"Oracle evaluation result {actual} does not match expected {expected} for assignment {IntAsBoolArray(assignment, numInputs)}");

            // Check that the inputs were not modified
            Fact(MeasureInteger(LittleEndian(inputs)) == 0, 
                $"The input states were modified for assignment {assignment}");
        }
    }


    // ------------------------------------------------------
    internal function IsTriangleValid (input : Int) : Bool {
        // the triangle is valid if it has at least two different bits (i.e., not all are the same)
        return input > 0 and input < 7;
    }

    @Test("Microsoft.Quantum.Katas.CounterSimulator")
    operation Test3_ValidTriangle() : Unit {
        VerifySingleOutputFunction(3, Task3_ValidTriangle, IsTriangleValid);
    }
}
