game_test <- data.frame(
  him = c("A", "B", "C"),
  me = c("Y", "X", "Z")
)

game <- read.table(
  file = "input/input02.txt"
)
colnames(game) <- c("him", "me")

shape_score_calculate <- function(me) {
  scores <- c(1, 2, 3)
  names(scores) <- c("X", "Y", "Z")
  return(scores[me])
}

outcome_score_calculate <- function(him, me) {
  scores <- c(3, 6, 0, 0, 3, 6, 6, 0, 3)
  names(scores) <-paste0(
    rep(c("A", "B", "C"), each = 3),
    rep(c("X", "Y", "Z"), times = 3)
    )
  return(scores[paste0(him, me)])
}

shape_calculate <- function(him, me) {
    shape <- c("Z", "X", "Y", "X", "Y", "Z", "Y", "Z", "X")
    names(shape) <-paste0(
      rep(c("A", "B", "C"), each = 3),
      rep(c("X", "Y", "Z"), times = 3)
      )
    return(shape[paste0(him, me)])
    }



sum(
  shape_score_calculate(game_test$me) + 
    outcome_score_calculate(game_test$him, game_test$me)
)


sum(
  shape_score_calculate(game$me) + 
    outcome_score_calculate(game$him, game$me)
)

# Partie 2

me <- shape_calculate(game_test$him, game_test$me)
sum(
  shape_score_calculate(me) + 
    outcome_score_calculate(game_test$him, me)
)

me <- shape_calculate(game$him, game$me)
sum(
  shape_score_calculate(me) + 
    outcome_score_calculate(game$him, me)
)
