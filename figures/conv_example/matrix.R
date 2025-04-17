library(png)

block <- readPNG("mario_block.png")

red <- block[,,1]
green <- block[,,2]
blue <- block[,,3]

xtable(as.matrix(red))

red*255
green*255
blue*255

round(red, 2)
round(green, 2)
round(blue, 2)

matrix2latex <- function(matr) {
  printmrow <- function(x) {
    cat(cat(x,sep=" & "),"\\\\ \n")
  }
  cat("\\begin{bmatrix}","\n")
  body <- apply(matr,1,printmrow)
  cat("\\end{bmatrix}")
}

matrix2latex(round(red, 2))
matrix2latex(red*255)

