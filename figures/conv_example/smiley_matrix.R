library(png)

img <- readPNG("smiley.png")

red <- img[,,1]
green <- img[,,2]
blue <- img[,,3]

matrix2latex <- function(matr) {
  printmrow <- function(x) {
    cat(cat(x,sep=" & "),"\\\\ \n")
  }
  cat("\\begin{bmatrix}","\n")
  body <- apply(matr,1,printmrow)
  cat("\\end{bmatrix}")
}

matrix2latex(round(red, 2))
## matrix2latex(red*255)

