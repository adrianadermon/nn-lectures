#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge

#set page(width: auto, height: auto, margin: 0.5cm, fill: none)
#set text(
  font: "Raleway"
)

#diagram(
    
    // node-stroke: black,
    node-shape: circle,
    node-outset: 1mm,
    crossing-thickness: 8,
    crossing-fill: rgb("f9f9f9"),
    let node-radius = 7mm,
    let Ocol = yellow,
    let Acol = aqua,
    let Xcol = lime,

    node((0, 0), $Y$, name: <Y>, stroke: none),
    edge("<|-"),
    node((0, 2), $O_ell$, name: <Ol>, fill: Ocol, radius: node-radius),
    edge("<|-", $B$, label-pos: 0.7, label-side: left),
    node((0, 4), $A_ell$, name: <Al>, fill: Acol, radius: node-radius),
    edge("<|-", $W$, label-side: left),
    node((0, 6), $X_ell$, name: <Xl>, fill: Xcol, radius: node-radius),
        
    edge(<Al>, "r", "u", "ll", "d", "r", "-|>", $U$, label-pos: 0.3, crossing: true),

    // node((0, 0), eval("$Y$"), name: <Y>, stroke: none),
    // edge("<|-"),
    // node((0, 1), eval("$O_ell$"), name: <Ol>, fill: Ocol),
    // edge("<|-", $B$),
    // node((0, 2), eval("$A_ell$"), name: <Al>, fill: Acol),
    // edge("<|-", $W$),
    // node((0, 3), eval("$X_ell$"), name: <Xl>, fill: Xcol),
    
    // edge(<Al>, <Al>, "-|>", bend: 130deg),

    node((2, 4), [#set text(size:22pt); $=$], stroke: none),

    let nshift = 3,
    
    let n1 = 3,
    let n2 = 2,

    let x = (),
    let a = (),
    let o = (),
    
    for (i) in range(n1) {
        node(((i+nshift), 6), eval("$"+"X_"+str(i+1)+"$"), name: "X"+str(i), fill: Xcol, radius: node-radius)
        edge("-|>", $W$, label-side: right)
        node(((i+nshift), 4), eval("$"+"A_"+str(i+1)+"$"), name: "A"+str(i), fill: Acol, radius: node-radius)
        edge("-|>", $B$, label-side: right)
        node(((i+nshift), 2), eval("$"+"O_"+str(i+1)+"$"), name: "O"+str(i), fill: Ocol, radius: node-radius)
    },

    edge(<A0>, <A1>, "-|>", $U$),
    edge(<A1>, <A2>, "-|>", $U$),


    node((6, 6), [#set text(size:22pt); $...$], stroke: none),
    
    let nshift2 = 4,
    node(((nshift+nshift2), 2), $O_(L-1)$, name: "Ol1", fill: Ocol, radius: node-radius),
    edge("<|-", $B$, label-side: left),
    node(((nshift+nshift2), 4), $A_(L-1)$, name: "Al1", fill: Acol, radius: node-radius),
    edge("<|-", $W$, label-side: left),
    node(((nshift+nshift2), 6), $X_(L-1)$, name: "Xl1", fill: Xcol, radius: node-radius),

    node(((nshift+nshift2+1), 0), $Y$, name: <Y0>, stroke: none),
    edge("<|-"),
    node(((nshift+nshift2+1), 2), $O_L$, name: "Ol0", fill: Ocol, radius: node-radius),
    edge("<|-", $B$, label-side: left),
    node(((nshift+nshift2+1), 4), $A_L$, name: "Al0", fill: Acol, radius: node-radius),
    edge("<|-", $W$, label-side: left),
    node(((nshift+nshift2+1), 6), $X_L$, name: "Xl0", fill: Xcol, radius: node-radius),

    edge(<A2>, <Al1>, "-|>", $U$),
    
    edge(<Al1>, <Al0>, "-|>", $U$),
    
    // // Input layer
    // let nx = 4,
    // let x = (),
    // for (i) in range(nx) {
    //     x.push("X_"+str(i+1))
    // },
    // for (i, n) in x.enumerate() {
    //     node((0, (i+1)*(h/(nx+1))), eval("$"+n+"$"), name: n, fill: aqua)
    // },

    // // Hidden layer 1
    // let nA = 6,
    // let A = (),
    // for (i) in range(nA) {
    //     A.push("A^(\(1\))_"+str(i+1))
    // },
    // for (i, n) in A.enumerate() {
    //     node((w/3, (i+1)*(h/(nA+1))), eval("$"+n+"$"), name: n, fill: lime)
    // },
    
    // // Hidden layer 1
    // let nB = 5,
    // let B = (),
    // for (i) in range(nB) {
    //     B.push("A^(\(2\))_"+str(i+1))
    // },
    // for (i, n) in B.enumerate() {
    //     node((2*(w/3), (i+1)*(h/(nB+1))), eval("$"+n+"$"), name: n, fill: orange)
    // },

    // // Output layer
    // node((w, h/2), $f(X)$, name: <fX>, fill: yellow),

    // // Final output
    // node((w+0.7, h/2), $Y$, name: <Y>, stroke: none),
    
    // // Edges input-hidden layer 1
    // for (x) in x {
    //     for (A) in A {
    //         edge(label(x), label(A), "-|>")
    //     }
    // },
    
    // // Edges hidden layer 1-hidden layer 2
    // for (A) in A {
    //     for (B) in B {
    //         edge(label(A), label(B), "-|>")
    //     }
    // },

    // // Edges hidden layer 2-output layer
    // for (B) in B {
    //     edge(label(B), <fX>, "-|>")
    // },
    
    // // Edge output-final output
    // edge(<fX>, <Y>, "-|>"),

    // node((0, 0.2), "Input layer", stroke: none),
    // node((w/3, 0.2), "Hidden layer " + $L_1$, stroke: none),
    // node((2*(w/3), 0.2), "Hidden layer " + $L_2$, stroke: none),
    // node((w, 0.2), "Output layer", stroke: none),
)

