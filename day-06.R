input <- strsplit(readLines("input/input06.txt"), split = "")[[1]]

# Part 1

triplet <- input[1:3]


for (i in 4:length(input)) {
  if (length(unique(c(triplet, input[i]))) == 4) break
  triplet <- c(triplet[2:3], input[i])
}

c(triplet, input[i])
i

# Part 2

triplet <- input[1:13]


for (i in 14:length(input)) {
  if (length(unique(c(triplet, input[i]))) == 14) break
  triplet <- c(triplet[2:13], input[i])
}

c(triplet, input[i])
i
