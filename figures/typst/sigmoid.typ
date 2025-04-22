#import "@preview/cetz:0.3.4": canvas, draw
#import "@preview/cetz-plot:0.1.1": plot

#set page(width: auto, height: auto, margin: .5cm)


#let style = (stroke: black, fill: rgb(0, 0, 200, 75))

#let sigmoid(z) = 1/(1+calc.exp(-z))

#set text(size: 10pt)

#canvas({
    import draw: *

    // Set-up a thin axis style
    // set-style(axes: (stroke: .5pt, tick: (stroke: .5pt)),
    //           legend: (stroke: none, orientation: ttb, item: (spacing: .3), scale: 80%))

    plot.plot(size: (12, 8),
        x-label: $z$,
        y-label: $g(z)$,
        x-tick-step: 2,
        y-tick-step: 0.5, y-min: -0.2, y-max: 1.2,
        {
            let domain = (-5, 5)
            plot.add(sigmoid,
                domain: domain,
                style: (stroke: black),
            )
        })
})
