namespace QCHack.Task1 {
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
    internal function IsDivisibleByFour (input : Int) : Bool {
        return input % 4 == 0;
    }

    @Test("ToffoliSimulator")
    operation Test1_DivisibleByFour() : Unit {
        for i in 3 .. 5 {
            VerifySingleOutputFunction(3, Task1_DivisibleByFour, IsDivisibleByFour);
        }
    }
}
