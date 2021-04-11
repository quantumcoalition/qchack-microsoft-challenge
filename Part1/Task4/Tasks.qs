namespace QCHack.Task4 {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    // Task 4 (12 points). f(x) = 1 if the graph edge coloring is triangle-free
    // 
    // Inputs:
    //      1) The number of vertices in the graph "V" (V ≤ 6).
    //      2) An array of E tuples of integers "edges", representing the edges of the graph (0 ≤ E ≤ V(V-1)/2).
    //         Each tuple gives the indices of the start and the end vertices of the edge.
    //         The vertices are indexed 0 through V - 1.
    //         The graph is undirected, so the order of the start and the end vertices in the edge doesn't matter.
    //      3) An array of E qubits "colorsRegister" that encodes the color assignments of the edges.
    //         Each color will be 0 or 1 (stored in 1 qubit).
    //         The colors of edges in this array are given in the same order as the edges in the "edges" array.
    //      4) A qubit "target" in an arbitrary state.
    //
    // Goal: Implement a marking oracle for function f(x) = 1 if
    //       the coloring of the edges of the given graph described by this colors assignment is triangle-free, i.e.,
    //       no triangle of edges connecting 3 vertices has all three edges in the same color.
    //
    // Example: a graph with 3 vertices and 3 edges [(0, 1), (1, 2), (2, 0)] has one triangle.
    // The result of applying the operation to state (|001⟩ + |110⟩ + |111⟩)/√3 ⊗ |0⟩ 
    // will be 1/√3|001⟩ ⊗ |1⟩ + 1/√3|110⟩ ⊗ |1⟩ + 1/√3|111⟩ ⊗ |0⟩.
    // The first two terms describe triangle-free colorings, 
    // and the last term describes a coloring where all edges of the triangle have the same color.
    //
    // In this task you are not allowed to use quantum gates that use more qubits than the number of edges in the graph,
    // unless there are 3 or less edges in the graph. For example, if the graph has 4 edges, you can only use 4-qubit gates or less.
    // You are guaranteed that in tests that have 4 or more edges in the graph the number of triangles in the graph 
    // will be strictly less than the number of edges.
    //
    // Hint: Make use of helper functions and helper operations, and avoid trying to fit the complete
    //       implementation into a single operation - it's not impossible but make your code less readable.
    //       GraphColoring kata has an example of implementing oracles for a similar task.
    //
    // Hint: Remember that you can examine the inputs and the intermediary results of your computations
    //       using Message function for classical values and DumpMachine for quantum states.
    //
    
operation Task2_ValidTriangle (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        use a = Qubit[2];
    CNOT(inputs[0],a[0]);
    CNOT(inputs[1],a[0]);
    
    CNOT(inputs[1],a[1]);
    CNOT(inputs[2],a[1]);
    
    CNOT(a[0],output);
    CNOT(a[1],output);
    CCNOT(a[0],a[1],output);
    
    // Resetting to 0
    CNOT(inputs[2],a[1]);
    CNOT(inputs[1],a[1]);

    CNOT(inputs[1],a[0]);
    CNOT(inputs[0],a[0]);
    
    X(output);
    X(output);
    }


    operation Task4_TriangleFreeColoringOracle (
        V : Int, 
        edges : (Int, Int)[], 
        colorsRegister : Qubit[], 
        target : Qubit
    ) : Unit is Adj+Ctl {
        let nEdges = Length(edges);
    let count = nEdges*(nEdges-1)*(nEdges-2)/6;
    //Message($"Number of loops: {count}");        

    use conflictQubits = Qubit[count];
    within {
        for i in 0..nEdges-3{
            for j in i+1..nEdges-2{
                for k in j+1..nEdges-1{
                    let (a0,a1) = edges[i];
                    let (b0,b1) = edges[j];
                    let (c0,c1) = edges[k];
                    //Message($"{edges[i]}-> {a0},{a1}|{edges[j]} -> {b0},{b1}|{edges[k]} -> {c0},{c1}");
                    let colVec = [colorsRegister[i],colorsRegister[j],colorsRegister[k]];
                    //Message($"Colours:{colVec}");
                    
                    //Message("State before applying the marking oracle:");
                    //DumpMachine();

                    Task2_ValidTriangle(colVec, conflictQubits[0]);

                    // Print the resulting state; notice which amplitudes changed
                    //Message("State after applying the marking oracle:");
                    //DumpMachine();
                }
            }
        }
    } apply {
         //If there are no conflicts (all qubits are in 0 state), the vertex coloring is valid.
        (ControlledOnInt(0, X))(conflictQubits, target);
    }
    }
}

