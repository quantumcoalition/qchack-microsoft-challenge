namespace QCHack.Task4 {
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
    open QCHack.Task4.TestingHarness;


    // ------------------------------------------------------
    @Test("Microsoft.Quantum.Katas.CounterSimulator")
    operation Test4_ValidTriangle_Small() : Unit {
        TestingHarness_ValidTriangle_Small(Task4_TriangleFreeColoringOracle);
    }
}
