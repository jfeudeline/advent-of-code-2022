test_rucksak <- c(
  "vJrwpWtwJgWrhcsFMMfFFhFp",
  "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
  "PmmdzqPrVvPwwTWBwg",
  "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
  "ttgJtRGJQctTZtZT",
  "CrZsJsPPZsGzwwsLwLmpwMDw"
)

priorities <- 1:52
names(priorities) <- c(letters, LETTERS)

calculate_share_item <- function(rucksak) {
  rucksak <- strsplit(rucksak, "")[[1]]
  n <- length(rucksak)/2
  for (item in rucksak[1:n]) {
    if (item %in% rucksak[(n+1):(2*n)]) return(item)
  }
}


items <- sapply(test_rucksak, FUN = calculate_share_item)
sum(priorities[items])


rucksaks <- readLines("input/input03.txt")
items <- sapply(rucksaks, FUN = calculate_share_item)
sum(priorities[items])





find_common_letter <- function(rucksaks) {
  common <- rep(0, 52)
  names(common) <- c(letters, LETTERS)
  for (rucksak in rucksaks) {
    rucksak <- strsplit(rucksak, "")[[1]]
    common <- (c(letters, LETTERS) %in% rucksak) + common
  }
  for (item in c(letters, LETTERS)) {
    if (common[item] == 3) return(item)
  }
}

find_common_letter(test_rucksak[4:])
# r

n <- length(rucksaks)/3

score <- 0
for (i in 1:n) {
  badge <- find_common_letter(rucksaks[(3*i-2):(3*i)])
  #print(badge)
  score <- score + priorities[badge]
}
score
