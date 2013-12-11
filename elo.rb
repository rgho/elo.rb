# usage
# require 'elo.rb'

class RatedPlayer
   # A Rated Player
   attr_accessor :id, :rating # ACTUALLY A SNEAKY METHOD.
   def initialize(id,rating)
      @id = id
      @rating = rating
  end
end


class Match
	# A NEW MATCH OBJECT
	def initialize(player1,player2, result)
	  #@player1 = player1
	  #@player2 = player2
	  #@result = result
	  ratings_after_match = new_ratings(player1.rating , player2.rating , result)      
	  player1.rating = ratings_after_match['player1']
	  player2.rating = ratings_after_match['player2']
    end

   	def new_ratings(player1_rating,player2_rating,result,k_value=32,should_round=true)
	   	#Assign actual individual results
	   	player1_result = result
	   	player2_result = 1 - result

	   	#Calculate expected results
	   	player1_expectation = 1/(1+10**((player2_rating - player1_rating)/400.0)) #the .0 is important to force float operations!))
	   	player2_expectation = 1/(1+10**((player1_rating - player2_rating)/400.0))

	    #Calculate new ratings
	   	player1_new_rating = player1_rating + (k_value*(player1_result - player1_expectation))
	   	player2_new_rating = player2_rating + (k_value*(player2_result - player2_expectation))

	   	#Optional rounding
	   	if should_round
	      # int rounds down and forces type
	      player1_new_rating = player1_new_rating.round
	      player2_new_rating = player2_new_rating.round
	    end 
	   	
	   	# Create a dictionary to return and do so!
	   	new_ratings_hash = Hash.new
	   	new_ratings_hash['player1'] = player1_new_rating
	   	new_ratings_hash['player2'] = player2_new_rating
   		
   		new_ratings_hash
	end
end

# Object Oriented Example
tom = RatedPlayer.new("Tom",1600)
alan = RatedPlayer.new("Alan",2000)
puts tom.rating
puts alan.rating
Match.new(tom,alan,1)
puts tom.rating
puts alan.rating