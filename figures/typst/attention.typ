#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge

#set page(width: auto, height: auto, margin: 0.5cm, fill: none)
#set text(
    font: "Raleway"
)

#diagram(
    
    // node-stroke: black,
    node-shape: circle,
    node-outset: 1mm,
    
    let node-radius = 3mm,
    let Xcol = lime,
    let Vcol = yellow,
    let Acol = aqua,


    let d = 4,

    // x1
    //-------------------------------------------------------
    let x1 = range(d).map(i => label("x" + str(1) + str(i))),
    let v1 = range(d).map(i => label("v" + str(1) + str(i))),
    let a1 = range(d).map(i => label("a" + str(1) + str(i))),

    // Draw nodes
    for (i, n) in x1.enumerate() {
        node((0, i), name: n, fill: Xcol, radius: node-radius)
    },
    
    for (i, n) in v1.enumerate() {
        node((3, i), name: n, fill: Vcol, radius: node-radius)
    },
    
    for (i, n) in a1.enumerate() {
        node((6, i), name: n, fill: Acol, radius: node-radius)
    },

    // Draw edges between x and v
    for (x) in x1 {
        for (v) in v1 {
            edge(x, v, "-|>")
        }
    },

    // x2
    //-------------------------------------------------------
    let x2 = range(d).map(i => label("x" + str(2) + str(i))),
    let v2 = range(d).map(i => label("v" + str(2) + str(i))),
    let a2 = range(d).map(i => label("a" + str(2) + str(i))),

    // Draw nodes
    for (i, n) in x2.enumerate() {
        node((0, i + 5), name: n, fill: Xcol, radius: node-radius)
    },
    
    for (i, n) in v2.enumerate() {
        node((3, i + 5), name: n, fill: Vcol, radius: node-radius)
    },
    
    for (i, n) in a2.enumerate() {
        node((6, i + 5), name: n, fill: Acol, radius: node-radius)
    },

    // Draw edges between x and v
    for (x) in x2 {
        for (v) in v2 {
            edge(x, v, "-|>")
        }
    },


    // x3
    //-------------------------------------------------------
    let x3 = range(d).map(i => label("x" + str(3) + str(i))),
    let v3 = range(d).map(i => label("v" + str(3) + str(i))),
    let a3 = range(d).map(i => label("a" + str(3) + str(i))),

    // Draw nodes
    for (i, n) in x3.enumerate() {
        node((0, i + 10), name: n, fill: Xcol, radius: node-radius)
    },
    
    for (i, n) in v3.enumerate() {
        node((3, i + 10), name: n, fill: Vcol, radius: node-radius)
    },
    
    for (i, n) in a3.enumerate() {
        node((6, i + 10), name: n, fill: Acol, radius: node-radius)
    },

    // Draw edges between x and v
    for (x) in x3 {
        for (v) in v3 {
            edge(x, v, "-|>")
        }
    },


    

    // Draw edges between v and a
    for (v) in v1 + v2 + v3 {
        for (a) in a1 + a2 + a3 {
            edge(v, a, "-|>", stroke: gray)
        }
    },

    //-------------------------------------------------------
    
    // Step labels
    node((0, 10 + d - 0.5), [Inputs]),
    node((3, 10 + d - 0.5), [Values]),
    node((6, 10 + d - 0.5), [Outputs]),

    // Input labels
    node((-0.5, 1.5), $x_1$),
    node((-0.5, 6.5), $x_2$),
    node((-0.5, 11.5), $x_3$),

    node((4, -0.5), [Attention], width: 0mm),

)

