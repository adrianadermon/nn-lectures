// Prototype for drawing ConvNet graphs

#set page(width: auto, height: auto, margin: .5cm, fill: none)


#import "@preview/cetz:0.3.4"
#cetz.canvas(
    length: 10cm,
    {
        import cetz.draw: *
        set-style(
            stroke: (thickness: 1pt)
        )

        // Function to draw a box with given dimensions
        let box(x, y, z, width: 1, height: 1, depth: 1, trans: 50%,
            xycol: green, xzcol: blue, yzcol: red) = {
                
                // Front face
                on-xy({
                    rect((x, y), (x + width, y + height),
                        fill: xycol.transparentize(trans),
                        stroke: (join: "round"))
                }, z: z)
                
                // Top face
                on-xz({
                    rect((x, z), (x + width, z - depth),
                        fill: xzcol.transparentize(trans),
                        stroke: (join: "round"))
                }, y: y + height)
                // Right side face
                on-yz({ // Wrong order of arguments, marked as a bug that will be fixed at some point
                    rect((z, y), (z - depth, y + height),
                        fill: yzcol.transparentize(trans),
                        stroke: (join: "round"))
                }, x: x + width)
                
                // Only draw back lines if box is transparent
                if trans > 0% {
                    // Back face lines
                    on-xy({
                        line((x, y), (x, y + height), stroke: (dash: "dashed"))
                        line((x, y), (x + width, y), stroke: (dash: "dashed"))
                    }, z: z - depth)
                
                    // Bottom face line
                    on-xz({
                        line((x, z), (x, z - depth), stroke: (dash: "dashed"))
                    }, y: y)
                }
        }

        // Draw some boxes
        // ortho(y: 10deg,
        //     x: 10deg,
        //     {
        //         box(0, 0, 0,
        //             width: 0.4, height: 0.5, trans: 0%, yzcol: aqua)
        //         box(1, 0.2, 0,
        //             width: 0.3, height: 0.3, depth: 0.3, trans: 80%)
        //         box(2, 0, 0,
        //             width: 0.2)
        //         box(1, 1, 1,
        //             width: 0.3, height: 0.3, depth: 0.3, xycol: orange)
        //         on-yz({
        //             line((0.15, 0), (0.02, 0), mark: (end: "straight"))
        //         }, x: 0.2)
        //         on-xy({
        //             content((0.2, 0), [32x32])
        //         },
        //             z: 0.2)
        //     })
        ortho(y: 20deg, x: 20deg,
            {
                box(0, 0, 0,
                    width: 3/50, height: 224/200, depth: 224/200, trans: 0%)
                box(4/50, 0, 0,
                    width: 3/50, height: 224/200, depth: 224/200, trans: 0%)
                box(10/50, 101/200, 0,
                    width: 3/50, height: 112/200, depth: 112/200, trans: 0%)
            })
    })

