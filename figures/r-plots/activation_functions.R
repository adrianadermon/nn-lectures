relu <- function(z) pmax(z, 0)
svg("relu.svg", width = 6, height = 4)
par(lwd = 1.5, mai = c(0.8, 0.8, 0.1, 0.1), bg = "#f9f9f9")
plot(relu, -5, 5, xlab = "z", ylab = "g(z)")
dev.off()


sigmoid <- function(z) 1/(1+exp(-z))
svg("sigmoid.svg", width = 6, height = 4)
par(lwd = 1.5, mai = c(0.8, 0.8, 0.1, 0.1), bg = "#f9f9f9")
plot(sigmoid, -5, 5, xlab = "z", ylab = "g(z)")
dev.off()
