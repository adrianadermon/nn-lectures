#import "@preview/cetz:0.3.4": canvas, draw
#import "@preview/cetz-plot:0.1.1": plot

#set page(width: auto, height: auto, margin: .5cm, fill: none)


#let style = (stroke: black, fill: rgb(0, 0, 200, 75))

#let relu(z) = calc.max(z, 0)

#set text(size: 18pt)

#canvas({
    import draw: *

    // Set-up a thin axis style
    // set-style(axes: (stroke: .5pt, tick: (stroke: .5pt)),
    //           legend: (stroke: none, orientation: ttb, item: (spacing: .3), scale: 80%))

    plot.plot(size: (12, 8),
        x-label: $z$,
        y-label: $g(z)$,
        x-tick-step: 2,
        y-tick-step: 2, y-min: -1, y-max: 5,
        {
            let domain = (-5, 5)
            plot.add(relu,
                domain: domain,
                style: (stroke: black),
                samples: 50,
                sample-at: (0, 0.01)
            )
        })
})
