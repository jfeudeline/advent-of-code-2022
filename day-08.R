library(magrittr)

input <- strsplit(readLines("input/input08.txt"), split = "")
input <- strsplit(readLines("input/input08-test.txt"), split = "")

forest <- purrr::map(input, as.numeric) %>% purrr::reduce(rbind)

n_rows <- nrow(forest)
n_cols <- ncol(forest)

# Part 1

n_visible <- 2 * n_rows + 2 * (n_cols - 2)

for (j in 2:(n_cols-1)) {
  for (i in 2:(n_rows - 1)) {
    
    max_up <- max(forest[1:(i-1), j])
    max_down <- max(forest[(i+1):n_rows, j])
    max_left <- max(forest[i, 1:(j-1)])
    max_right <- max(forest[i, (j+1):n_cols])
    visibility <- c(max_up, max_left, max_right, max_down)
    
    n_visible <- n_visible + ifelse(forest[i, j] > min(visibility), 1, 0)
    
  }
}

n_visible

# Part 2

scenic <- matrix(0, n_rows, n_cols)

for (j in 2:(n_cols-1)) {
  for (i in 2:(n_rows - 1)) {
    
    up <- forest[(i-1):1, j]
    down <- forest[(i+1):n_rows, j]
    left <- forest[i, (j-1):1]
    right <- forest[i, (j+1):n_cols]
    
    max_high <- forest[i,j]
    scenic[i, j] <- 1
    
    for (trees in list(up, down, left, right)) {
      
      view <- 0

      for (tree in trees) {

        view <- view + 1
        
        if (tree >= max_high) break

      }

      scenic[i, j] <- scenic[i, j] * view
      
    }
  }
}

max(scenic)


