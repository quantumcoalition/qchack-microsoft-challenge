namespace QCHack.Task4 {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    // Check that colors don't form a triangle of edges
    operation IsValidTriangle_Reference (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        // We don't want to mark only all 0s and all 1s - mark them and flip
        (ControlledOnInt(0, X))(inputs, output);
        Controlled X(inputs, output);
        X(output);
    }


    // ------------------------------------------------------
    // Convert the list of edges into adjacency matrix (with indices of edges)
    function AdjacencyMatrix_Reference (V : Int, edges : (Int, Int)[]) : Int[][] {
        mutable adjVertices = new Int[][V];
        for ind in 0 .. V - 1 {
            set adjVertices w/= ind <- ConstantArray(V, -1);
        }
        for edgeInd in 0 .. Length(edges) - 1 {
            let (v1, v2) = edges[edgeInd];
            // track both directions in the adjacency matrix
            set adjVertices w/= v1 <- (adjVertices[v1] w/ v2 <- edgeInd);
            set adjVertices w/= v2 <- (adjVertices[v2] w/ v1 <- edgeInd);
        }
        return adjVertices;
    }


    // ------------------------------------------------------
    // Extract the list of triangles from the adjacency matrix
    function TrianglesList_Reference (V : Int, adjacencyMatrix : Int[][]) : (Int, Int, Int)[] {
        mutable triangles = new (Int, Int, Int)[0];
        for v1 in 0 .. V - 1 {
            for v2 in v1 + 1 .. V - 1 {
                for v3 in v2 + 1 .. V - 1 {
                    if (adjacencyMatrix[v1][v2] > -1 and adjacencyMatrix[v1][v3] > -1 and adjacencyMatrix[v2][v3] > -1) {
                        set triangles = triangles + [(v1, v2, v3)];
                    }
                }
            }
        }
        return triangles;
    }


    // ------------------------------------------------------
    operation Task4_TriangleFreeColoringOracle_Reference (
        V : Int, 
        edges : (Int, Int)[], 
        colorsRegister : Qubit[], 
        target : Qubit
    ) : Unit is Adj+Ctl {
        // Construct adjacency matrix of the graph
        let adjacencyMatrix = AdjacencyMatrix_Reference(V, edges);
        // Enumerate all possible triangles of edges
        let trianglesList = TrianglesList_Reference(V, adjacencyMatrix);

        // Allocate one extra qubit per triangle
        let nTr = Length(trianglesList);
        use aux = Qubit[nTr];
        within {
            for i in 0 .. nTr - 1 {
                // For each triangle, form an array of qubits that holds its edge colors
                let (v1, v2, v3) = trianglesList[i];
                let edgeColors = [colorsRegister[adjacencyMatrix[v1][v2]],
                                  colorsRegister[adjacencyMatrix[v1][v3]], 
                                  colorsRegister[adjacencyMatrix[v2][v3]]];
                IsValidTriangle_Reference(edgeColors, aux[i]);
            }
        } apply {
            // If all triangles are good, all aux qubits are 1
            Controlled X(aux, target);
        }
    }
}
