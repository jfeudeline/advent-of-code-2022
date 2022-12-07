a <- readLines("input/input01.txt")

max <- 0
this <- 0

for (item in a) {
  if (item == "") {
    max <- ifelse(this > max, this, max)
    this <- 0
  } else {
    this <- this + as.numeric(item)
  }
}

res1 <- max

total <- c()
this <- 0

for (item in a) {
  if (item == "") {
    total <- c(total, this)
    this <- 0
  } else {
    this <- this + as.numeric(item)
  }
}

res2 <- sum(sort(total, decreasing = TRUE)[1:3])



