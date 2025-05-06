#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge

#set page(width: auto, height: auto, margin: 0.5cm, fill: none)
#set text(
  font: "Raleway"
)

#set text(size: 20pt)

#diagram(
    node-stroke: black,
    node-shape: circle,

    let h = 4,
    let w = 4,
    
    // Input layer
    let nx = 2,
    let x = (),
    for (i) in range(nx) {
        x.push("X_"+str(i+1))
    },
    for (i, n) in x.enumerate() {
        node((0, (i+1)*(h/(nx+1))), eval("$"+n+"$"), name: n, fill: aqua)
    },

    // Hidden layer
    let nA = 3,
    let A = (),
    for (i) in range(nA) {
        A.push("A_"+str(i+1))
    },
    for (i, n) in A.enumerate() {
        node((w/2, (i+1)*(h/(nA+1))), eval("$"+n+"$"), name: n, fill: lime)
    },

    // Output layer
    node((w, h/2), $f(X)$, name: <fX>, fill: yellow),

    // Final output
    node((w+0.8, h/2), $Y$, name: <Y>, stroke: none),
    
    // Edges input-hidden layer
    for (x) in x {
        for (A) in A {
            edge(label(x), label(A), "-|>")
        }
    },

    // Edges hidden-output layer
    for (A) in A {
        edge(label(A), <fX>, "-|>")
    },
    
    // Edge output-final output
    edge(<fX>, <Y>, "-|>"),

    node((0, 0.2), "Input layer", stroke: none),
    node((w/2, 0.2), "Hidden layer", stroke: none),
    node((w, 0.2), "Output layer", stroke: none),
)
