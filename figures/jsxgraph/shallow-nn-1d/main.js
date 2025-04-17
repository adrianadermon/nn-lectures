JXG.Options.text.useMathJax = true;
JXG.Options.text.cssClass = 'jsx-graph-font';
JXG.Options.text.highlightCssClass = 'jsx-graph-font';

import { relu, sigmoid, leakyRelu, hardSwish } from '../modules/activation-functions.js';

// Get colors from CSS
const documentCSS = window.getComputedStyle(document.body);
const blue = documentCSS.getPropertyValue('--graph-blue');
const red = documentCSS.getPropertyValue('--graph-red');
const black = documentCSS.getPropertyValue('--graph-black');
const green = documentCSS.getPropertyValue('--graph-green');
const orange = documentCSS.getPropertyValue('--graph-orange');

// Coordinate ranges for 3D view
const box = [-5, 5];

// Boards
const board_dims = [-2, 4, 6, -4];

const board_output = JXG.JSXGraph.initBoard('controls.output',
        {
                boundingbox: board_dims,
                axis: false,
                showNavigation: false,
                showCopyright: false
        }),
        board_lin_output = JXG.JSXGraph.initBoard('lin.output',
                {
                        boundingbox: board_dims,
                        axis: true,
                        defaultAxes: {
                                x: {
                                        // name: 'x',
                                        // withLabel: true,
                                        // label: {
                                        //     position: 'rt',
                                        // },
                                        ticks: { visible: false }
                                },
                                y: {
                                        // name: 'y',
                                        // withLabel: true,
                                        // label: {
                                        //     position: 'rt',
                                        // },
                                        ticks: { visible: false }
                                }
                        },
                        showNavigation: false,
                        showCopyright: false
                });

board_output.addChild(board_lin_output);

const board_h1 = JXG.JSXGraph.initBoard('controls.h1',
        {
                boundingbox: board_dims,
                axis: false,
                showNavigation: false,
                showCopyright: false
        }),
        board_lin_h1 = JXG.JSXGraph.initBoard('lin.h1',
                {
                        boundingbox: board_dims,
                        axis: true,
                        defaultAxes: {
                                x: {
                                        ticks: { visible: false }
                                },
                                y: {
                                        ticks: { visible: false }
                                }
                        },
                        showNavigation: false,
                        showCopyright: false
                }),
        board_clip_h1 = JXG.JSXGraph.initBoard('clip.h1',
                {
                        boundingbox: board_dims,
                        axis: true,
                        defaultAxes: {
                                x: {
                                        ticks: { visible: false }
                                },
                                y: {
                                        ticks: { visible: false }
                                }
                        },
                        showNavigation: false,
                        showCopyright: false
                }),
        board_scale_h1 = JXG.JSXGraph.initBoard('scale.h1',
                {
                        boundingbox: board_dims,
                        axis: true,
                        defaultAxes: {
                                x: {
                                        ticks: { visible: false }
                                },
                                y: {
                                        ticks: { visible: false }
                                }
                        },
                        showNavigation: false,
                        showCopyright: false
                });

board_h1.addChild(board_lin_h1);
board_h1.addChild(board_clip_h1);
board_h1.addChild(board_scale_h1);
board_h1.addChild(board_lin_output);

board_output.addChild(board_clip_h1);
board_output.addChild(board_scale_h1);

const board_h2 = JXG.JSXGraph.initBoard('controls.h2',
        {
                boundingbox: board_dims,
                axis: false,
                showNavigation: false,
                showCopyright: false
        }),
        board_lin_h2 = JXG.JSXGraph.initBoard('lin.h2',
                {
                        boundingbox: board_dims,
                        axis: true,
                        defaultAxes: {
                                x: {
                                        ticks: { visible: false }
                                },
                                y: {
                                        ticks: { visible: false }
                                }
                        },
                        showNavigation: false,
                        showCopyright: false
                }),
        board_clip_h2 = JXG.JSXGraph.initBoard('clip.h2',
                {
                        boundingbox: board_dims,
                        axis: true,
                        defaultAxes: {
                                x: {
                                        ticks: { visible: false }
                                },
                                y: {
                                        ticks: { visible: false }
                                }
                        },
                        showNavigation: false,
                        showCopyright: false
                }),
        board_scale_h2 = JXG.JSXGraph.initBoard('scale.h2',
                {
                        boundingbox: board_dims,
                        axis: true,
                        defaultAxes: {
                                x: {
                                        ticks: { visible: false }
                                },
                                y: {
                                        ticks: { visible: false }
                                }
                        },
                        showNavigation: false,
                        showCopyright: false
                });

board_h2.addChild(board_lin_h2);
board_h2.addChild(board_clip_h2);
board_h2.addChild(board_scale_h2);
board_h2.addChild(board_lin_output);

board_output.addChild(board_clip_h2);
board_output.addChild(board_scale_h2);

// Sliders
const sleft = -1.5,
        sright = 2.5,
        w0h = 3,
        w1h = 2,
        b0h = 3,
        b1h = 2,
        b2h = 1,
        srange = [-3, 1, 3];

const t0param = [[sleft, w0h], [sright, w0h], srange],
        t1param = [[sleft, w1h], [sright, w1h], srange],
        p0param = [[sleft, b0h], [sright, b0h], srange],
        p1param = [[sleft, b1h], [sright, b1h], srange],
        p2param = [[sleft, b2h], [sright, b2h], srange];

const satts = { withTicks: false, digits: 1 }

const p0 = board_output.create('slider',
        p0param,
        {
            name: '\\(\\beta_0\\)',
            ...satts
        }),
        b1 = board_output.create('slider',
                p1param,
                {
                    name: '\\(\\beta_1\\)',
                    ...satts
                }),
        b2 = board_output.create('slider',
                p2param,
                {
                    name: '\\(\\beta_2\\)',
                    ...satts
                }),

        w10 = board_h1.create('slider',
                t0param,
                {
                    name: '\\(w_{10}\\)',
                    ...satts
                }),
        w11 = board_h1.create('slider',
                t1param,
                {
                    name: '\\(w_{11}\\)',
                    ...satts
                }),

        w20 = board_h2.create('slider',
                t0param,
                {
                    name: '\\(w_{20}\\)',
                    ...satts
                }),
        t21 = board_h2.create('slider',
                t1param,
                {
                    name: '\\(w_{21}\\)',
                    ...satts
                });

// Text
board_lin_h1.create('text',
    [5.5, -3.5, '\\[w_{10} + w_{11} X\\]'],
    { anchorX: 'right' });

board_clip_h1.create('text',
    [5.5, -3.5, '\\[A_1 = g(w_{10} + w_{11} X)\\]'],
    { anchorX: 'right' });

board_scale_h1.create('text',
    [5.5, -3.5, '\\[\\beta_1 A_1\\]'],
    { anchorX: 'right' });

board_lin_h2.create('text',
    [5.5, -3.5, '\\[w_{20} + w_{21} X\\]'],
    { anchorX: 'right' });

board_clip_h2.create('text',
    [5.5, -3.5, '\\[A_2 = g(w_{20} + w_{21} X)\\]'],
    { anchorX: 'right' });

board_scale_h2.create('text',
    [5.5, -3.5, '\\[\\beta_2 A_2\\]'],
    { anchorX: 'right' });

board_lin_output.create('text',
    [5.5, -3.5, '\\[Y = \\beta_0 + \\beta_1 h_1 + \\beta_2 h_2\\]'],
    { anchorX: 'right' });

// Functions
let activationMenu = document.getElementById('activation-select');
activationMenu.addEventListener('change', setActivationFunction);

let activation = relu;

function setActivationFunction(event) {
        if (activationMenu.value == 'relu') {
                activation = relu;
                board_output.fullUpdate();
        } else if (activationMenu.value == 'sigmoid') {
                activation = sigmoid;
                board_output.fullUpdate();
        } else if (activationMenu.value == 'leaky_relu') {
                activation = leakyRelu;
                board_output.fullUpdate();
        } else if (activationMenu.value == 'hardswish') {
                activation = hardSwish;
                board_output.fullUpdate();
        } else if (activationMenu.value == 'passthrough') {
                activation = (x) => x;
                board_output.fullUpdate();
        }
};

function lin_h1(x) { return w10.Value() + w11.Value() * x };
function clip_h1(x) { return activation(lin_h1(x)) };
function scale_h1(x) { return b1.Value() * clip_h1(x) };

function lin_h2(x) { return w20.Value() + t21.Value() * x };
function clip_h2(x) { return activation(lin_h2(x)) };
function scale_h2(x) { return b2.Value() * clip_h2(x) };


function lin_output(x) {
        return p0.Value() + scale_h1(x) + scale_h2(x)
};

// Function to create graph
function create_graph(board, f, color) {
        return board.create('functiongraph', f, {
                strokeWidth: 3,
                strokeColor: color
        })
};

// Output layer
const graph_lin_output = create_graph(board_lin_output, lin_output, orange);

// h1
const graph_lin_h1 = create_graph(board_lin_h1, lin_h1, blue);

const graph_clip_h1 = create_graph(board_clip_h1, clip_h1, blue);

const graph_scale_h1 = create_graph(board_scale_h1, scale_h1, blue);

// h2
const graph_lin_h2 = create_graph(board_lin_h2, lin_h2, green);

const graph_clip_h2 = create_graph(board_clip_h2, clip_h2, green);

const graph_scale_h2 = create_graph(board_scale_h2, scale_h2, green);
