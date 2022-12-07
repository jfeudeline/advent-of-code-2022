input <- strsplit(readLines("input/input05.txt"), split = " ")
#input <- strsplit(readLines("input/input05-test.txt"), split = " ")


# [C]         [S] [H]                
# [F] [B]     [C] [S]     [W]        
# [B] [W]     [W] [M] [S] [B]        
# [L] [H] [G] [L] [P] [F] [Q]        
# [D] [P] [J] [F] [T] [G] [M] [T]    
# [P] [G] [B] [N] [L] [W] [P] [W] [R]
# [Z] [V] [W] [J] [J] [C] [T] [S] [C]
# [S] [N] [F] [G] [W] [B] [H] [F] [N]
# 1   2   3   4   5   6   7   8   9 


 



stacks <- list(
  c("C", "F", "B", "L", "D", "P", "Z", "S"),
  c("B", "W", "H", "P", "G", "V", "N"),
  c("G", "J", "B", "W", "F"),
  c("S", "C", "W", "L", "F", "N", "J", "G"),
  c("H", "S", "M", "P", "T", "L", "J", "W"),
  c("S", "F", "G", "W", "C", "B"),
  c("W", "B", "Q", "M", "P", "T", "H"),
  c("T", "W", "S", "F"),
  c("R", "C", "N")
)

# Part 1

# stacks <- list(
#   c("N", "Z"),
#   c("D", "C", "M"),
#   c("P")
# )

for (row in input) {
  
  move <- as.numeric(row[2])
  from <- as.numeric(row[4])
  to <- as.numeric(row[6])

  stacks[[to]] <- c(stacks[[from]][move:1], stacks[[to]])
  stacks[[from]] <- stacks[[from]][-(1:move)]
  #print(stacks)
}


stacks
# FWSHSPJWM


# Part 2

stacks <- list(
  c("C", "F", "B", "L", "D", "P", "Z", "S"),
  c("B", "W", "H", "P", "G", "V", "N"),
  c("G", "J", "B", "W", "F"),
  c("S", "C", "W", "L", "F", "N", "J", "G"),
  c("H", "S", "M", "P", "T", "L", "J", "W"),
  c("S", "F", "G", "W", "C", "B"),
  c("W", "B", "Q", "M", "P", "T", "H"),
  c("T", "W", "S", "F"),
  c("R", "C", "N")
)

for (row in input) {
  
  move <- as.numeric(row[2])
  from <- as.numeric(row[4])
  to <- as.numeric(row[6])
  
  stacks[[to]] <- c(stacks[[from]][1:move], stacks[[to]])
  stacks[[from]] <- stacks[[from]][-(1:move)]
  #print(stacks)
}


stacks
# PWPWHGFZS

