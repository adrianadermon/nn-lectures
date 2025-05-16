#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import fletcher.shapes: pill

#set page(width: auto, height: auto, margin: 0.5cm, fill: none)
#set text(
  font: "Raleway"
)

#diagram(
    // node-stroke: black,
    node-shape: pill,
    let node-width = 4em,
    let skip = 0.5,

    let riverbank1 = "I swam across the river to get to the other *bank*",
    let riverbank2 = "I _swam_ across the _river_ to get to the other bank",

    for (i, n) in riverbank1.split(" ").enumerate() {
        node((skip*i, 0), eval(n, mode: "markup"), name: "rb1" + str(i + 1), width: node-width)
    },
    
    for (i, n) in riverbank2.split(" ").enumerate() {
        node((skip*i, 1), eval(n, mode: "markup"), name: "rb2" + str(i + 1), width: node-width)
    },

    edge(<rb22>, (skip*1, 0.4), (skip*10, 0.4), <rb111>, "-|>", corner-radius: 3mm),
    edge(<rb25>, (skip*4, 0.6), (skip*10, 0.6), <rb111>, "-|>", corner-radius: 3mm),

    
    let moneybank1 = "I walked across the road to get cash from the *bank*",
    let moneybank2 = "I walked across the road to get _cash_ from the bank",
    
    for (i, n) in moneybank1.split(" ").enumerate() {
        node((skip*i, 2), eval(n, mode: "markup"), name: "mb1" + str(i + 1), width: node-width)
    },
    for (i, n) in moneybank2.split(" ").enumerate() {
        node((skip*i, 3), eval(n, mode: "markup"), name: "mb2" + str(i + 1), width: node-width)
    },
    
    edge(<mb28>, (skip*7, 2.5), (skip*10, 2.5), <mb111>, "-|>", corner-radius: 3mm),

    node(enclose: (<rb11>, <rb211>), fill : yellow.lighten(40%)),
    node(enclose: (<mb11>, <mb211>), fill : aqua.lighten(40%)),
)
