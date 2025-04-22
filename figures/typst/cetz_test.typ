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
        let box(x, y, z, width: 1, height: 1, depth: 1) = {
                on-xy({
                    rect((x, y), (x + width, y + height), fill: green.transparentize(50%))
                }, z: z)
                on-xy({
                    line((x, y), (x, y + height), stroke: (dash: "dashed"))
                    line((x, y), (x + width, y), stroke: (dash: "dashed"))
                }, z: z - depth)
                on-xz({
                    rect((x, z), (x + width, z - depth), fill: blue.transparentize(50%))
                }, y: y + height)
                on-xz({
                    line((x, z), (x, z - depth), stroke: (dash: "dashed"))
                }, y: y)
                on-yz({ // Wrong order of arguments, marked as a bug that will be fixed at some point
                    rect((z, y), (z - depth, y + height), fill: red.transparentize(50%))
                }, x: x + width)
        }

        
        ortho(y: 20deg,
            x: 20deg,
            {
                box(0, 0, 0,
                    width: 0.4, height: 0.5)
                box(1, 0.2, 0,
                    width: 0.3, height: 0.3, depth: 0.3)
                box(2, 0, 0,
                    width: 0.2)
                box(1, 1, 1,
                    width: 0.3, height: 0.3, depth: 0.3)

                on-yz({
                    line((0.15, 0), (0.02, 0), mark: (end: "straight"))
                }, x: 0.2)
                on-xy({
                    content((0.2, 0), [32x32])
                },
                    z: 0.2)
            })
    })
