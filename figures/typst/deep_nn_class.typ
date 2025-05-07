#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge

#set page(width: auto, height: auto, margin: 0.5cm, fill: none)
#set text(
  font: "Raleway"
)

#diagram(
    node-stroke: black,
    node-shape: circle,

    let h = 6,
    let w = 4,
    
    // Input layer
    let nx = 4,
    let x = (),
    for (i) in range(nx) {
        x.push("X_"+str(i+1))
    },
    for (i, n) in x.enumerate() {
        node((0, (i+1)*(h/(nx+1))), eval("$"+n+"$"), name: n, fill: aqua)
    },

    // Hidden layer 1
    let nA = 6,
    let A = (),
    for (i) in range(nA) {
        A.push("A^(\(1\))_"+str(i+1))
    },
    for (i, n) in A.enumerate() {
        node((w/3, (i+1)*(h/(nA+1))), eval("$"+n+"$"), name: n, fill: lime)
    },
    
    // Hidden layer 1
    let nB = 5,
    let B = (),
    for (i) in range(nB) {
        B.push("A^(\(2\))_"+str(i+1))
    },
    for (i, n) in B.enumerate() {
        node((2*(w/3), (i+1)*(h/(nB+1))), eval("$"+n+"$"), name: n, fill: orange)
    },

    // Output layer
    let nfX = 4,
    let fX = (),
    for (i) in range(nfX) {
        fX.push("f_" + str(i) + "(X)")
    },
    for (i, n) in fX.enumerate() {
        node((3*(w/3), (i+1)*(h/(nfX+1))), eval("$"+n+"$"), name: n, fill: yellow)
    },

    // Final output
    let Y = (),
    for (i) in range(nfX) {
        Y.push("Y_" + str(i))
    },
    for (i, n) in Y.enumerate() {
        node((w+0.7, (i+1)*(h/(nfX+1))), eval("$"+n+"$"), name: n, stroke: none)
    },


    // Edges input-hidden layer 1
    for (x) in x {
        for (A) in A {
            edge(label(x), label(A), "-|>")
        }
    },
    
    // Edges hidden layer 1-hidden layer 2
    for (A) in A {
        for (B) in B {
            edge(label(A), label(B), "-|>")
        }
    },

    // Edges hidden layer 2-output layer
    for (B) in B {
        for (fX) in fX {
            edge(label(B), label(fX), "-|>")
        }
    },

    // Edge output-final output
    for (i, n) in fX.enumerate() {
        edge(label(fX.at(i)), label(Y.at(i)), "-|>")
    },

    node((0, 0.2), "Input layer", stroke: none),
    node((w/3, 0.2), "Hidden layer " + $L_1$, stroke: none),
    node((2*(w/3), 0.2), "Hidden layer " + $L_2$, stroke: none),
    node((w, 0.2), "Output layer", stroke: none),
)

