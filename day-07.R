input <- strsplit(readLines("input/input07.txt"), split = " ")


# Part 1

file_system <- list()

for (row in input) {
  if (row[[2]] == "cd") {
    if (row[[3]] == "/") {
      path <- c(".")
    } else {
      if (row[[3]] == "..") {
        path <- path[-length(path)]
      } else {
        path <- c(path, row[[3]])
      }
    } 
  } else {
    size <- as.numeric(row[[1]])
    if (!is.na(size)) {
      for (i in 1:length(path)) {
        path_name <- paste(path[1:i], collapse = "/")
        file_system[[path_name]] <- c(file_system[[path_name]], size)
      }
      
    }
  }
}

sizes <- lapply(file_system, sum)

total_size <- 0

for (size in sizes) {
  total_size <- total_size + ifelse(size <= 100000, size, 0)
}

total_size



# Part 2

size <- 7e+7

for (i in sizes) {
  unused_space <- 7e+7 - sizes[[1]] + i
  size <- ifelse((i < size) && (unused_space >= 3e+7), i, size )
}

size


