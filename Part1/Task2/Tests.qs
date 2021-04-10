namespace QCHack.Task2 {
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Logical;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;


    internal operation VerifySingleOutputFunction(numInputs : Int, op : ((Qubit[], Qubit) => Unit is Adj+Ctl), predicate : (Int -> Bool)) : Unit {
        for assignment in 0 .. 2^numInputs - 1 {
            use (inputs, output) = (Qubit[numInputs], Qubit());
            within {
                ApplyXorInPlace(assignment, LittleEndian(inputs));
                AllowAtMostNCallsCA(0, Measure, "You are not allowed to use measurements");
            } apply {
                op(inputs, output);
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

    @Test("ToffoliSimulator")
    operation Test2_ValidTriangle() : Unit {
        VerifySingleOutputFunction(3, Task2_ValidTriangle, IsTriangleValid);
    }
}
