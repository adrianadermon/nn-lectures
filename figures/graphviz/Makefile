#vpath %.gv ./

graphviz = dot $< -Tsvg  -o $@

all: shallow_nn.svg shallow_nn_p1.svg shallow_nn_p2.svg deep_nn.svg deep_nn_multi.svg

shallow_nn.svg: shallow_nn.gv
	$(graphviz)

shallow_nn_p1.svg: shallow_nn_p1.gv
	$(graphviz)

shallow_nn_p2.svg: shallow_nn_p2.gv
	$(graphviz)

deep_nn.svg: deep_nn.gv
	$(graphviz)

deep_nn_multi.svg: deep_nn_multi.gv
	$(graphviz)

# ols_net.pdf: ols_net.gv
# 	$(graphviz)

# transform_net.pdf: transform_net.gv
# 	$(graphviz)

# neural_net_regression.pdf: neural_net_regression.gv
# 	$(graphviz)

# deep_net_regression.pdf: deep_net_regression.gv
# 	$(graphviz)

# neural_net_classification.pdf: neural_net_classification.gv
# 	$(graphviz)

# recurrent_net.pdf: recurrent_net.gv
# 	$(graphviz)
