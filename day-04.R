input <- strsplit(readLines("input/input04-test.txt"), split = ",")
input <- strsplit(readLines("input/input04.txt"), split = ",")


# Part 1


contains <- function(v) {
  a <- v[1]
  b <- v[2]
  ext_a <- as.numeric(strsplit(a, "-")[[1]])
  ext_b <- as.numeric(strsplit(b, "-")[[1]])
  
  if (ext_a[1] <= ext_b[1] && ext_a[2] >= ext_b[2]) return(TRUE)
  if (ext_a[1] >= ext_b[1] && ext_a[2] <= ext_b[2]) return(TRUE)
  return(FALSE)
}



sum(unlist(lapply(input, contains)))

# Part 2

overlap <- function(v) {
  a <- v[1]
  b <- v[2]
  ext_a <- as.numeric(strsplit(a, "-")[[1]])
  ext_b <- as.numeric(strsplit(b, "-")[[1]])
  
  if (ext_a[1] >= ext_b[1] && ext_a[1] <= ext_b[2]) return(TRUE)
  if (ext_b[1] >= ext_a[1] && ext_b[1] <= ext_a[2]) return(TRUE)
  return(FALSE)
}

sum(unlist(lapply(input, overlap)))
