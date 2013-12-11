elo.rb
======

A small implementation of the ELO rating system in Ruby.

Authors: Anna Sheaffer @anna2, Rishi Ghosh 

A Ruby implementation of the ELO Player Rating system. The method below handles all aspects of calculating the new ELO ratings for both players. Object Oriented use supported.


newRating (Method of Match class)
-------------
+   Description: Returns an array with keys "Player1" and "Player2" holding corresponding new ELO ratings.
+   Examples: No examples yet.
+   Parmeters: 
    +   player1_rating: Rating of Player1 right before match.
    +   player2_rating: Rating of Player2 right before match.
    +   k_value: The constant K-value used in developers ELO system. Read the wikipedia article on ELO for details.
    +   result: The result of the match on a scale of 0 to 1. "0" = Player1 lost, Player 2 won. "0.5" = Draw. "1" = Player 1 won, Player 2 lost.
    +	should_round: Set to "true" by default. Rounds the output ratings.


Examples:
-------------
```ruby
# Object Oriented Example
tom = RatedPlayer.new("Tom",1600)
alan = RatedPlayer.new("Alan",2000)
puts tom.rating
puts alan.rating
Match.new(tom,alan,1)
puts tom.rating
puts alan.rating
```

Output:
1600

2000

1629

1971

