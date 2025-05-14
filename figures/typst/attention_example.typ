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

    let riverbank = "I swam across the river to get to the other bank",

    for (i, n) in riverbank.split(" ").enumerate() {
        node((0.7*i, 0), n, name: "rb1" + str(i + 1), width: node-width)
    },
    
    for (i, n) in riverbank.split(" ").enumerate() {
        node((0.7*i, 1), n, name: "rb2" + str(i + 1), width: node-width)
    },

    edge(<rb22>, (0.7*1, 0.4), (0.7*10, 0.4), <rb111>, "-|>", corner-radius: 3mm),
    edge(<rb25>, (0.7*4, 0.6), (0.7*10, 0.6), <rb111>, "-|>", corner-radius: 3mm),

    
    let moneybank = "I walked across the road to get cash from the bank",
    
    for (i, n) in moneybank.split(" ").enumerate() {
        node((0.7*i, 2), n, name: "mb1" + str(i + 1), width: node-width)
    },
    for (i, n) in moneybank.split(" ").enumerate() {
        node((0.7*i, 3), n, name: "mb2" + str(i + 1), width: node-width)
    },
    
    edge(<mb28>, (0.7*7, 2.5), (0.7*10, 2.5), <mb111>, "-|>", corner-radius: 3mm),

)
